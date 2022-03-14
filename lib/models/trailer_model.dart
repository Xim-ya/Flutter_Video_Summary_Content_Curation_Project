class Trailer {
  final String? name;
  final String? key;

  Trailer({this.name, this.key});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      Trailer(name: json["name"], key: json["key"]);
}
