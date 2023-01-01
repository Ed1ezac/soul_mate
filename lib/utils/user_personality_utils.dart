class PersonalityUtils {
  static final int INTROVERT = 1;
  static final int SOCIAL_INTROVERT = 3;
  static final int ANXIOUS_INTROVERT = 5;
  static final int THINKING_INTROVERT = 7;
  static final int RESTRAINED_INTROVERT = 9;

  static final int EXTROVERT = 2;
  static final int EXTROVERTED_FEELER = 4;
  static final int EXTROVERTED_SENSORS = 6;
  static final int EXTROVERTED_THINKERS = 8;
  static final int EXTROVERTED_INTUITORS = 10;

  static final int GIFTING = 11; //gift
  static final int HELPFULNESS = 12; //service Helpfulness
  static final int VERBAL_AFFECTION = 13; //words
  static final int BODILY_AFFECTION = 14; //physical
  static final int PRIORITIZING_TIME = 15; //time

  static final String GIFTING_TITLE = "Gifting";
  static final String HELPFULNESS_TITLE = "Helpfulness";
  static final String VERBAL_AFFECTION_TITLE = "Verbal Affection";
  static final String BODILY_AFFECTION_TITLE = "Bodily Affection";
  static final String PRIORITIZING_TIME_TITLE = "Prioritizing Time";

  static final String SOCIAL_INTROVERT_TITLE = "Social Introvert";
  static final String ANXIOUS_INTROVERT_TITLE = "Anxious Introvert";
  static final String THINKING_INTROVERT_TITLE = "Thinking Introvert";
  static final String RESTRAINED_INTROVERT_TITLE = "Restrained Introvert";

  static final String EXTROVERTED_FEELER_TITLE = "Extroverted Feeler";
  static final String EXTROVERTED_SENSORS_TITLE = "Extroverted Sensor";
  static final String EXTROVERTED_THINKERS_TITLE = "Extroverted Thinker";
  static final String EXTROVERTED_INTUITORS_TITLE = "Extroverted Intuitor";

  static final String SOCIAL_INTROVERT_TIP = "Most common type of introvert." +
      " They prefer to spend time alone and keep a very small circle of friends.";
  static final String ANXIOUS_INTROVERT_TIP =
      "This introvert tends to feel anxious in" +
          " social situations. They experience high levels of self consciousness or" +
          " awkwardness at social gatherings.";
  static final String THINKING_INTROVERT_TIP =
      "This introvert tends to think about everything." +
          "They are self-reflective and like analyzing situations and conversations.";
  static final String RESTRAINED_INTROVERT_TIP =
      "This introvert is a restrained person " +
          "who likes to get to know the people or the situation before they eventually open up.";

//================= Extrovert ======================
  static final String EXTROVERTED_FEELER_TIP =
      "Most common type of extrovert. They enjoy interacting with other people" +
          " and sharing their thoughts and experiences. They require the least amount of alone time.";

  static final String EXTROVERTED_SENSORS_TIP =
      "This extrovert is stimulated by the physical world around them." +
          " They use their senses, e.g. touch, smell, vision, to understand people. They are" +
          " full of energy, active, and like to have lots of things going on.";

  static final String EXTROVERTED_THINKERS_TIP =
      "These extroverts are enterprising and smart risk takers. They thrive on competition and like" +
          " to discuss ideas. They love networking and working with various people to achieve their goals.";

  static final String EXTROVERTED_INTUITORS_TIP =
      "This extrovert loves to learn and are always challenging their mind." +
          " They prefer to live and explore life on their own terms and tend to be very perfectionistic. They" +
          " have high expectations of people.";

  //=========== love expressions =======
  static final String GIFTING_TIP =
      "Shows love by giving thoughtful gifts to their partner.";
  static final String HELPFULNESS_TIP =
      "Shows love by performing duties, e.g. laundry, and being resourceful to their partner.";
  static final String VERBAL_AFFECTION_TIP =
      "Shows love by using words to reassert their fondness and longing to their partner.";
  static final String BODILY_AFFECTION_TIP =
      "Shows love through body language e.g. hugging, holding hands or any kind of physical affection.";
  static final String PRIORITIZING_TIME_TIP =
      "Shows love by prioritizing time alone with their partner, e.g. walks, weekend getaways, long phone calls," +
          " to create and share special moments together.";

  String? getIntroversionTitle(int introversion) {
    switch (introversion) {
      case (3):
        return PersonalityUtils.SOCIAL_INTROVERT_TITLE;
      case (5):
        return PersonalityUtils.ANXIOUS_INTROVERT_TITLE;
      case (7):
        return PersonalityUtils.THINKING_INTROVERT_TITLE;
      case (9):
        return PersonalityUtils.RESTRAINED_INTROVERT_TITLE;
      default:
        return null;
    }
  }

  String? getExtroversionTitle(int extroversion) {
    switch (extroversion) {
      case (4):
        return PersonalityUtils.EXTROVERTED_FEELER_TITLE;
      case (6):
        return PersonalityUtils.EXTROVERTED_SENSORS_TITLE;
      case (8):
        return PersonalityUtils.EXTROVERTED_THINKERS_TITLE;
      case (10):
        return PersonalityUtils.EXTROVERTED_INTUITORS_TITLE;
      default:
        return null;
    }
  }

  String? getLoveExpressionTitle(int loveExpression) {
    switch (loveExpression) {
      case (11):
        return PersonalityUtils.GIFTING_TITLE;
      case (12):
        return PersonalityUtils.HELPFULNESS_TITLE;
      case (13):
        return PersonalityUtils.VERBAL_AFFECTION_TITLE;
      case (14):
        return PersonalityUtils.BODILY_AFFECTION_TITLE;
      case (15):
        return PersonalityUtils.PRIORITIZING_TIME_TITLE;
      default:
        return null;
    }
  }
}
