//-Local Databse Initialization constants
const String DatabaseName = "local_db.db";
const String UsersTable = "users";

const String GendersTable = "genders";
const String InterestsTable = "interests";
const String SexualitiesTable = "sexualities";
const String PersonalitiesTable = "personalities";
const String AffectionTraitsTable = "affection_traits";

//TODO - Add a global_id col for Master-DB sync
const String CreateUsersTable = "CREATE TABLE " +
    "users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, " +
    "sexuality TEXT, height INTEGER, birthday TEXT, hide_age TEXT)";
//add -  bio TEXT NULLABLE, profile_image TEXT NULLABLE

//
const String CreateGendersTable =
    "CREATE TABLE genders(id INTEGER PRIMARY KEY AUTOINCREMENT, gender TEXT)";
//
const String CreateSexualitiesTable =
    "CREATE TABLE sexualities(id INTEGER PRIMARY KEY AUTOINCREMENT, sexuality TEXT)";
//
const String CreateInterestsTable =
    "CREATE TABLE interests(id INTEGER PRIMARY KEY AUTOINCREMENT, interest TEXT)";
//
const String CreatePersonalitiesTable =
    "CREATE TABLE personalities(id INTEGER PRIMARY KEY AUTOINCREMENT, personality TEXT)";
//
const String CreateAffectionTraitsTable =
    "CREATE TABLE affection_traits(id INTEGER PRIMARY KEY AUTOINCREMENT, affection_trait TEXT)";
//
const String CreateUserInterestsTable =
    "CREATE TABLE user_has_interests(id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "user_id INTEGER FOREIGN KEY, interest_id INTEGER FOREIGN KEY)";
//---becareful here:Second Foreign Key is ambiguous
/*const String CreateUserHasLikesTable =
    "CREATE TABLE user_has_likes(id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "user_id INTEGER FOREIGN KEY, liked_user_id INTEGER FOREIGN KEY)";*/
//Warning: Foreign Key is ambiguous
const String CreateUserMatchesTable =
    "CREATE TABLE user_has_matches(id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "matched_user_id INTEGER FOREIGN KEY)";
//Subscriptions, Matches, Likes
const String CreateSubscriptionsTable =
    "CREATE TABLE subscriptions(id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "user_id INTEGER FOREIGN KEY, subscription_id INTEGER FOREIGN KEY, " +
        "start_date TEXT, end_date TEXT)";

const List<String> UsersTableColumns = [
  "id",
  "name",
  "gender",
  "sexuality",
  "height",
  "birthday",
  "hide_age",
];

const List<String> defaultInterests = [
  "Food",
  "Sleep",
  "Tennis",
  "Movies",
  "Football",
  "Fashion",
  "Drawing",
  "Painting",
  "Anime",
  "Gum",
  "Tea",
  "Rugby",
  "Nature",
  "Prayer",
  "Mathematics",
  "Islam",
  "Series",
  "Singing",
  "Cuddling",
  "Current Affairs",
  "House Music",
  "Dancing",
  "Acting",
  "Athletics",
  "Travelling",
  "Jazz Music",
  "Physics",
  "Technology",
  "Buddhism",
  "Exercising",
  "Christianity",
  "Afro Pop Music",
  "Video Games",
  "Netball",
  "Booze",
  "Hip Hop",
  "Politics",
  "History",
  "Boxing",
  "Dancehall",
  "Nursing",
  "Gambling",
  "Sikhism",
  "R&B Music",
  "Business",
  "Smoking",
  "Agriculture",
  "Reggae Music",
  "Rasta Farrianism",
  "Bahai Faith",
  "Cooking",
  "Table Tennis",
  "Poetry",
  "Dental Health",
  "Gospel Music",
  "Graphics Design",
  "Photography",
  "Badminton",
  "Reading",
  "Journalism",
  "Accounting",
  "Engineering",
  "Hacking",
  "Hugging",
  "Meditating",
  "Binge Watching",
  "Staying Up Late",
  "African Traditional Religion",
];
