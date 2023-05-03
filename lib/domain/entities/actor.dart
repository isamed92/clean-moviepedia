class Actor {
  final int id;
  final String profilePath;
  final String name;
  final String? character;

  Actor(
      {required this.id,
      required this.profilePath,
      required this.name,
      this.character});
}
