class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
  });

  factory Pokemon.fromJason(Map<String, dynamic> json) {
    List<String> auxList = [];
    for (var element in json["types"]) {
      auxList.add(element["type"]["name"]);
    }
    return Pokemon(
      id: json["id"],
      name: json["name"],
      image: json["sprites"]["front_default"],
      types: auxList,
    );
  }
}
