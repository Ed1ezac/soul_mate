class UserHabitsAndInterests {
  List<String> habits;
  List<String> interests;

  UserHabitsAndInterests({
    this.habits,
    this.interests,
  });

  bool isEmpty() {
    return habits == null && interests == null;
  }
}
