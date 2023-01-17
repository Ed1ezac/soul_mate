class UserInterests {
  List<String> habits;
  List<String> interests;

  UserInterests({
    required this.habits,
    required this.interests,
  });

  bool isEmpty() {
    return habits.isEmpty && interests.isEmpty;
  }
}
