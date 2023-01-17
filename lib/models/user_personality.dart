class UserPersonality {
  int extroversion;
  int loveExpression;

  UserPersonality(this.extroversion, this.loveExpression);

  @override
  String toString() {
    return "base: " +
        extroversion.toString() +
        "\n"
            "type: " +
        "\n"
            "love: " +
        loveExpression.toString();
  }

  bool isEmpty() {
    return extroversion < 0 && loveExpression < 0;
  }
}
