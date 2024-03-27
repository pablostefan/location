enum Vector {
  cloudWalk._(name: "cloud_walk");

  final String name;

  const Vector._({required this.name});

  String get svg => "svg/$name.svg";
}
