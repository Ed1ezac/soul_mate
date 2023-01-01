class UserHabitsAndInterests {
  List<String> habits;
  List<String> interests;

  UserHabitsAndInterests({
    required this.habits,
    required this.interests,
  });

  bool isEmpty() {
    return habits.isEmpty && interests.isEmpty;
  }
}
