class PersonalityUtils {
  static final int INTROVERT = 1;
  static final int EXTROVERT = 2;

  static final int GIFTING = 5; //gift
  static final int HELPFULNESS = 6; //service Helpfulness
  static final int VERBAL_AFFECTION = 7; //words
  static final int BODILY_AFFECTION = 8; //physical
  static final int PRIORITIZING_TIME = 9; //time

  static final String GIFTING_TITLE = "Gifting";
  static final String HELPFULNESS_TITLE = "Helpfulness";
  static final String VERBAL_AFFECTION_TITLE = "Verbal Affection";
  static final String BODILY_AFFECTION_TITLE = "Physical Affection";
  static final String PRIORITIZING_TIME_TITLE = "Prioritizing Time";

  //=========== love expressions =======
  static final String GIFTING_TIP =
      "Shows love by giving thoughtful gifts to their partner.";
  static final String HELPFULNESS_TIP =
      "Shows love by performing duties and being resourceful to their partner.";
  static final String VERBAL_AFFECTION_TIP =
      "Shows love by using words to reassert their fondness and longing to their partner.";
  static final String BODILY_AFFECTION_TIP =
      "Shows love through body language e.g. hugging, holding hands or any kind of physical affection.";
  static final String PRIORITIZING_TIME_TIP =
      "Shows love by prioritizing time alone with their partner" +
          " to create and share special moments together.";

  String? getLoveExpressionTitle(int loveExpression) {
    switch (loveExpression) {
      case (5):
        return PersonalityUtils.GIFTING_TITLE;
      case (6):
        return PersonalityUtils.HELPFULNESS_TITLE;
      case (7):
        return PersonalityUtils.VERBAL_AFFECTION_TITLE;
      case (8):
        return PersonalityUtils.BODILY_AFFECTION_TITLE;
      case (9):
        return PersonalityUtils.PRIORITIZING_TIME_TITLE;
      default:
        return null;
    }
  }
}
