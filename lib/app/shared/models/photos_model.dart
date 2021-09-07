import 'dart:convert';

class PhotosModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnail;
  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  PhotosModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnail,
  }) {
    return PhotosModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory PhotosModel.fromMap(Map<String, dynamic> map) {
    return PhotosModel(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosModel.fromJson(String source) => PhotosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhotosModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PhotosModel &&
      other.albumId == albumId &&
      other.id == id &&
      other.title == title &&
      other.url == url &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnail.hashCode;
  }
}
