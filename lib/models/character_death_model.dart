import 'dart:convert';

class CharacterDeath {
  final String name;
  final int deathCount;

  CharacterDeath({
    this.name,
    this.deathCount,
  });

  factory CharacterDeath.fromJson(String str) =>
      CharacterDeath.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterDeath.fromMap(Map<String, dynamic> json) => CharacterDeath(
        name: json["name"],
        deathCount: json["deathCount"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "deathCount": deathCount,
      };
}
