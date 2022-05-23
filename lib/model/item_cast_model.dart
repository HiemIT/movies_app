class ItemCast {
  String? name;
  String? character;
  String? profile_path;

  ItemCast({this.name, this.character, this.profile_path});

  toJson() {
    return {
      "name": this.name,
      "character": this.character,
      "profile_path": this.profile_path
    };
  }

  factory ItemCast.fromJson(json) {
    return ItemCast(
        name: json['name'],
        character: json['character'],
        profile_path: json['profile_path']);
  }
}