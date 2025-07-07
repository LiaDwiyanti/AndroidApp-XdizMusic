class Tracks{
  final int id;
  final String title;
  final Album album;
  final Artist artist;

  Tracks({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      id: json['id'] ?? 0, 
      title: json['title'] ?? 'No Title',
      album: Album.fromJson(json['album']),
      artist: Artist.fromJson(json['artist']),
    );
  }
}

class Album {
  final int id;
  final String title;
  final String coverMedium;
  final String coverSmall;
  final String coverBig;

  Album({
    required this.id,
    required this.title,
    required this.coverMedium,
    required this.coverSmall,
    required this.coverBig,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      coverMedium: json['cover_medium'] ?? '',
      coverSmall: json['cover_small'] ?? '',
      coverBig: json['cover_big'] ?? '',
    );
  }
}

class Artist {
  final int id;
  final String name;

  Artist({
    required this.id,
    required this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}