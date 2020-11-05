class PotentialMatch {
  String imageURI;
  String name;
  int age, height, introversion;
  List<String> interests;

  PotentialMatch(this.imageURI, this.name, this.age, this.height,
      {this.introversion, this.interests});
}
