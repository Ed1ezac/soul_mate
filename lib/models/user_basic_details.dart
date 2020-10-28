class UserBasicDetails {
  String name;
  Gender gender;
  Sexuality sexuality;
  bool hideAge;
  int age, height;

  UserBasicDetails(
      {this.age,
      this.name,
      this.gender,
      this.height,
      this.sexuality,
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
    return this.age == null &&
        this.name == null &&
        this.height == null &&
        this.gender == null &&
        this.sexuality == null;
  }
}

enum Gender { Male, Female, GenderQueer, GenderNeutral }

enum Sexuality { Heterosexual, Homosexual, Bisexual }
