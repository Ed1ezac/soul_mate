class UserPersonality {
  int extroversion;
  int extroversionType;
  int loveExpression;

  UserPersonality(
      this.extroversion, this.extroversionType, this.loveExpression);

  @override
  String toString() {
    return "base: " +
        extroversion.toString() +
        "\n"
            "type: " +
        extroversionType.toString() +
        "\n"
            "love: " +
        loveExpression.toString();
  }

  bool isEmpty() {
    return extroversion < 0 && extroversionType < 0 && loveExpression < 0;
  }
}
