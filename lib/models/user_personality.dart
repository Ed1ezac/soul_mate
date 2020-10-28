class UserPersonality {
  int _extroversion = -1;
  int _extroversionType = -1;
  int _loveExpression = -1;

  UserPersonality();

  int get extroversion => _extroversion;

  set extroversion(int extroversion) {
    _extroversion = extroversion;
  }

  int get extroversionType => _extroversionType;

  set extroversionType(int extroversionType) {
    _extroversionType = extroversionType;
  }

  int get loveExpression => _loveExpression;

  set loveExpression(int expression) {
    _loveExpression = expression;
  }

  @override
  String toString() {
    return "base: " +
        _extroversion.toString() +
        "\n"
            "type: " +
        _extroversionType.toString() +
        "\n"
            "love: " +
        _loveExpression.toString();
  }

  bool isEmpty() {
    return _extroversion < 0 && _extroversionType < 0 && _loveExpression < 0;
  }
}
