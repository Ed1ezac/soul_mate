import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Soulmate_App/models/potential_match.dart';

enum TriggerDirection { none, right, left, up, down }
enum AmassOrientation { top, bottom, left, right }
enum CardSwipeOrientation { left, right, recover, up, down }

class CardStack extends StatefulWidget {
  final CardBuilder _cardBuilder;
  final int _cardCount; //totalNum
  final int _maxStackNum; //_stackNum
  final int _animDuration;
  final double _swipeEdge;
  final double _swipeEdgeVertical;
  final bool _swipeUp;
  final bool _swipeDown;
  final List<PotentialMatch> potentials;
  final bool _allowVerticalMovement; //not allowed
  final CardSwipeCompleteCallback? swipeCompleteCallback;
  final CardDragUpdateCallback? swipeUpdateCallback;
  final CardController? cardController;
  final List<Size> _cardSizes = [];
  final List<Alignment> _cardAligns = [];

  CardStack({
    required CardBuilder cardBuilder,
    required this.potentials,
    required int cardCount,
    int maxStackNum = 3,
    int animDuration = 700,
    double swipeEdge = 3,
    double swipeEdgeVertical = 8.0,
    bool swipeUp = false,
    bool swipeDown = false,
    double? maxWidth,
    double? maxHeight,
    double? minWidth,
    double? minHeight,
    bool allowVerticalMovement = false,
    this.swipeCompleteCallback,
    this.swipeUpdateCallback,
    this.cardController,
    AmassOrientation orientation = AmassOrientation.bottom,
  })  : assert(maxStackNum > 1),
        assert(swipeEdge > 0),
        assert(swipeEdgeVertical > 0),
        assert(maxWidth! > minWidth! && maxHeight! > minHeight!),
        _cardBuilder = cardBuilder,
        _cardCount = cardCount,
        _maxStackNum = maxStackNum,
        _animDuration = animDuration,
        _swipeEdge = swipeEdge,
        _swipeEdgeVertical = swipeEdgeVertical,
        _swipeUp = swipeUp,
        _swipeDown = swipeDown,
        _allowVerticalMovement = allowVerticalMovement {
    final widthGap = maxWidth! - minWidth!;
    final heightGap = maxHeight! - minHeight!;
    //populate card sizes
    for (var i = 0; i < _maxStackNum; i++) {
      _cardSizes.add(
        Size(minWidth + (widthGap / _maxStackNum) * i,
            minHeight + (heightGap / _maxStackNum) * i),
      );

      switch (orientation) {
        case AmassOrientation.bottom:
          _cardAligns.add(
            Alignment(
              0.0,
              (0.5 / (_maxStackNum - 1)) * (maxStackNum - i),
            ),
          );
          break;
        case AmassOrientation.top:
          _cardAligns.add(
            Alignment(
              0.0,
              (-0.5 / (_maxStackNum - 1)) * (maxStackNum - i),
            ),
          );
          break;
        case AmassOrientation.left:
          _cardAligns.add(
            Alignment(
              (-0.5 / (_maxStackNum - 1)) * (maxStackNum - i),
              0.0,
            ),
          );
          break;
        case AmassOrientation.right:
          _cardAligns.add(
            Alignment(
              (0.5 / (_maxStackNum - 1)) * (maxStackNum - i),
              0.0,
            ),
          );
          break;
      }
    }
  }

  @override
  _StackState createState() => _StackState();
}

class _StackState extends State<CardStack> with TickerProviderStateMixin {
  late Alignment frontCardAlign;
  late int _currentFront;
  static TriggerDirection? _trigger;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  // support for asynchronous data events
  @override
  void didUpdateWidget(covariant CardStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._cardCount != oldWidget._cardCount) {
      _initState();
    }
  }

  void _initState() {
    _currentFront = widget._cardCount - widget._maxStackNum;
    frontCardAlign = widget._cardAligns[widget._cardAligns.length - 1];
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget._animDuration,
      ),
    );
    _animationController.addListener(() => setState(() {}));

    _animationController.addStatusListener(
      (final status) {
        final index = widget._cardCount - widget._maxStackNum - _currentFront;

        if (status == AnimationStatus.completed) {
          CardSwipeOrientation orientation;
          //0,0 is top-left
          if (frontCardAlign.x < -widget._swipeEdge) {
            orientation = CardSwipeOrientation.left;
          } else if (frontCardAlign.x > widget._swipeEdge) {
            orientation = CardSwipeOrientation.right;
          } else if (frontCardAlign.y < -widget._swipeEdgeVertical) {
            orientation = CardSwipeOrientation.up;
          } else if (frontCardAlign.y > widget._swipeEdgeVertical) {
            orientation = CardSwipeOrientation.down;
          } else {
            frontCardAlign = widget._cardAligns[widget._maxStackNum - 1];
            orientation = CardSwipeOrientation.recover;
          }

          if (widget.swipeCompleteCallback != null) {
            widget.swipeCompleteCallback!(orientation, index);
          }

          if (orientation != CardSwipeOrientation.recover) changeCardOrder();
        }
      },
    );
  }

  void changeCardOrder() {
    setState(() {
      _currentFront--;
      frontCardAlign = widget._cardAligns[widget._maxStackNum - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cardController?.addListener(triggerSwipe);

    return Stack(children: _buildCards(context));
  }

  List<Widget> _buildCards(BuildContext context) {
    final cards = <Widget>[];
    for (var i = _currentFront; i < _currentFront + widget._maxStackNum; i++) {
      cards.add(_buildCard(context, i));
    }

    cards.add(SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: (final details) {
          setState(() {
            if (widget._allowVerticalMovement == true) {
              frontCardAlign = Alignment(
                frontCardAlign.x +
                    details.delta.dx * 20 / MediaQuery.of(context).size.width,
                frontCardAlign.y +
                    details.delta.dy * 30 / MediaQuery.of(context).size.height,
              );
            } else {
              frontCardAlign = Alignment(
                frontCardAlign.x +
                    details.delta.dx * 20 / MediaQuery.of(context).size.width,
                0,
              );

              if (widget.swipeUpdateCallback != null) {
                widget.swipeUpdateCallback!(details, frontCardAlign);
              }
            }
            if (widget.swipeUpdateCallback != null) {
              widget.swipeUpdateCallback!(details, frontCardAlign);
            }
          });
        },
        onPanEnd: (final details) {
          animateCards(TriggerDirection.none);
        },
      ),
    ));
    return cards;
  }

  Widget _buildCard(BuildContext context, int realIndex) {
    if (realIndex < 0) {
      return Container();
    }

    final index = realIndex - _currentFront;

    if (index == widget._maxStackNum - 1) {
      //frontmost card
      return Align(
        alignment: _animationController.status == AnimationStatus.forward
            ? frontCardAlign = CardAnimation.frontCardAlign(
                _animationController,
                frontCardAlign,
                widget._cardAligns[widget._maxStackNum - 1],
                widget._swipeEdge,
                widget._swipeUp,
                widget._swipeDown,
              ).value
            : frontCardAlign,
        child: Transform.rotate(
          angle: (pi / 180.0) *
              (_animationController.status == AnimationStatus.forward
                  ? CardAnimation.frontCardRota(
                          _animationController, frontCardAlign.x)
                      .value
                  : frontCardAlign.x),
          child: SizedBox.fromSize(
            size: widget._cardSizes[index],
            child: widget._cardBuilder(
              context,
              widget._cardCount - realIndex - 1,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: _animationController.status == AnimationStatus.forward &&
              (frontCardAlign.x > 3.0 ||
                  frontCardAlign.x < -3.0 ||
                  frontCardAlign.y > 3 ||
                  frontCardAlign.y < -3)
          ? CardAnimation.backCardAlign(
              _animationController,
              widget._cardAligns[index],
              widget._cardAligns[index + 1],
            ).value
          : widget._cardAligns[index],
      child: SizedBox.fromSize(
        size: _animationController.status == AnimationStatus.forward &&
                (frontCardAlign.x > 3.0 ||
                    frontCardAlign.x < -3.0 ||
                    frontCardAlign.y > 3 ||
                    frontCardAlign.y < -3)
            ? CardAnimation.backCardSize(
                _animationController,
                widget._cardSizes[index],
                widget._cardSizes[index + 1],
              ).value
            : widget._cardSizes[index],
        child: widget._cardBuilder(
          context,
          widget._cardCount - realIndex - 1,
        ),
      ),
    );
  }

  void animateCards(TriggerDirection trigger) {
    if (_animationController.isAnimating ||
        _currentFront + widget._maxStackNum == 0) {
      return;
    }
    _trigger = trigger;
    _animationController.stop();
    _animationController.value = 0.0;
    _animationController.forward();
  }

  void triggerSwipe(TriggerDirection trigger) {
    animateCards(trigger);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

typedef CardBuilder = Widget Function(BuildContext context, int index);

/// swipe card to [CardSwipeOrientation.left] or [CardSwipeOrientation.right]
/// , [CardSwipeOrientation.recover] means back to start.
typedef CardSwipeCompleteCallback = void Function(
    CardSwipeOrientation orientation, int index);

/// [DragUpdateDetails] of swiping card.
typedef CardDragUpdateCallback = void Function(
    DragUpdateDetails details, Alignment align);

class CardAnimation {
  static Animation<Alignment> frontCardAlign(
    AnimationController controller,
    Alignment beginAlign,
    Alignment baseAlign,
    double swipeEdge,
    bool swipeUp,
    bool swipeDown,
  ) {
    double endX, endY;
    if (_StackState._trigger == TriggerDirection.none) {
      endX = beginAlign.x > 0
          ? (beginAlign.x > swipeEdge ? beginAlign.x + 10.0 : baseAlign.x)
          : (beginAlign.x < -swipeEdge ? beginAlign.x - 10.0 : baseAlign.x);
      endY = beginAlign.x > 3.0 || beginAlign.x < -swipeEdge
          ? beginAlign.y
          : baseAlign.y;
      if (swipeUp || swipeDown) {
        if (beginAlign.y < 0) {
          if (swipeUp) {
            endY =
                beginAlign.y < -swipeEdge ? beginAlign.y - 10.0 : baseAlign.y;
          }
        } else if (beginAlign.y > 0) {
          if (swipeDown) {
            endY = beginAlign.y > swipeEdge ? beginAlign.y + 10.0 : baseAlign.y;
          }
        }
      }
    } else if (_StackState._trigger == TriggerDirection.left) {
      endX = beginAlign.x - swipeEdge;
      endY = beginAlign.y + 0.5;
    }
    /* Trigger Swipe Up or Down */
    else if (_StackState._trigger == TriggerDirection.up ||
        _StackState._trigger == TriggerDirection.down) {
      var beginY = _StackState._trigger == TriggerDirection.up ? -10 : 10;

      endY = beginY < -swipeEdge ? beginY - 10.0 : baseAlign.y;

      endX = beginAlign.x > 0
          ? (beginAlign.x > swipeEdge ? beginAlign.x + 10.0 : baseAlign.x)
          : (beginAlign.x < -swipeEdge ? beginAlign.x - 10.0 : baseAlign.x);
    } else {
      endX = beginAlign.x + swipeEdge;
      endY = beginAlign.y + 0.5;
    }
    //the amnimation
    return AlignmentTween(
      begin: beginAlign,
      end: Alignment(endX, endY),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }

  static Animation<double> frontCardRota(
      AnimationController controller, double beginRot) {
    return Tween(begin: beginRot, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }

  static Animation<Size?> backCardSize(
    AnimationController controller,
    Size beginSize,
    Size endSize,
  ) {
    return SizeTween(begin: beginSize, end: endSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }

  static Animation<Alignment> backCardAlign(
    AnimationController controller,
    Alignment beginAlign,
    Alignment endAlign,
  ) {
    return AlignmentTween(begin: beginAlign, end: endAlign).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }
}

typedef TriggerListener = void Function(TriggerDirection trigger);

class CardController {
  late TriggerListener? _listener;

  void triggerLeft() {
    if (_listener != null) {
      _listener!(TriggerDirection.left);
    }
  }

  void triggerRight() {
    if (_listener != null) {
      _listener!(TriggerDirection.right);
    }
  }

  void triggerUp() {
    if (_listener != null) {
      _listener!(TriggerDirection.up);
    }
  }

  void triggerDown() {
    if (_listener != null) {
      _listener!(TriggerDirection.down);
    }
  }

  // ignore: use_setters_to_change_properties
  void addListener(final TriggerListener listener) {
    _listener = listener;
  }

  void removeListener() {
    _listener = null;
  }
}
