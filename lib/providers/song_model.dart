import 'package:flutter/foundation.dart';

class Song with ChangeNotifier {
  final int songId;
  final String title;
  final List genre;
  final String artistName;
  final String imageUrl;
  bool isFavorite;
  bool isPlaying;

  Song({
    this.songId,
    this.title,
    this.genre,
    this.artistName,
    this.imageUrl,
    this.isFavorite = false,
    this.isPlaying = false,
  });
}

class Songs with ChangeNotifier {
  List<Song> _songs = [
    Song(
      songId: 0,
      title: 'Alone',
      genre: ['Hip-Hop', 'Top Lists'],
      artistName: 'Alan Walker',
      imageUrl:
          'https://vignette.wikia.nocookie.net/alan-walker/images/1/1d/9fa13acf7fd692b9310adda64cd0be3f.jpg',
      isPlaying: false,
    ),
    Song(
      songId: 1,
      title: 'culpa',
      genre: ['Pop'],
      artistName: 'akkay',
      imageUrl: "https://via.placeholder.com/150/d32776",
      isPlaying: false,
    ),
    Song(
      songId: 2,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
    Song(
      songId: 3,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
    Song(
      songId: 4,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
    Song(
      songId: 5,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
    Song(
      songId: 6,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
    Song(
      songId: 7,
      title: 'Track Title',
      genre: ['Pop'],
      artistName: 'Artist Name',
      imageUrl:
          "https://images.unsplash.com/photo-1583452133742-84b41c2695c0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=anastase-maragos-FmMJbdxpA-Y-unsplash.jpg",
      isPlaying: false,
    ),
  ];

  int getTotalSongs() {
    return _songs.length;
  }

  String getSongImageUrl(int index) {
    // String imageUrl = songs[index].imageUrl;
    return _songs[index].imageUrl;
  }

  String getSongTitle(int index) {
    return _songs[index].title;
  }

  String getArtistName(int index) {
    return _songs[index].artistName;
  }

  List getSongGenre(int index) {
    return _songs[index].genre;
  }

  void changeIsPlaying(int index) {
    _songs[index].isPlaying = !_songs[index].isPlaying;
    notifyListeners();
  }

  bool getIsPlaying(int index) {
    return _songs[index].isPlaying;
  }
}
