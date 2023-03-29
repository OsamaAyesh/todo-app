import 'dart:typed_data';

class Picture{
  int id;
  String title;
  Uint8List picture;

  Picture({required this.id, required this.title, required this.picture});

  Picture.fromMap(Map map, this.id, this.title, this.picture) {
    id = map[id];
    title = map[title];
    picture = map[picture];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "picture" : picture,
  };

}