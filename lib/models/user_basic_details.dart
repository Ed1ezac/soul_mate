class UserBasicDetails {
  String name;
  Gender gender;
  Sexuality sexuality;
  bool hideAge;
  int age, height;

  UserBasicDetails(
      {required this.age,
      required this.name,
      required this.gender,
      required this.height,
      required this.sexuality,
      this.hideAge = false});

  Map<String, dynamic> toJson() => {
        'name': name,
        'hideAge': hideAge,
        'age': age.toString(),
        'gender': gender.toString(),
        'height': height.toString(),
        'sexuality': sexuality.toString()
      };

  bool isEmpty() {
    //default values
    return this.age == 0 &&
        this.name == "" &&
        this.height == 0 &&
        this.gender == Gender.Female &&
        this.sexuality == Sexuality.Heterosexual;
  }
}

enum Gender { Male, Female, Transgender, GenderNeutral }

enum Sexuality { Heterosexual, Homosexual, Bisexual, Other }
