import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/providers/song_model.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';

class MusicPlayerScreen extends StatefulWidget {
  static const routeName = '/music-player';
  final int songIndex;

  MusicPlayerScreen({
    Key key,
    this.songIndex,
  }) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool _isPlaying = false;
  Audio url = Audio(
    "https://assets.mixkit.co/music/download/mixkit-hazy-after-hours-132.mp3",
    metas: Metas(
      title: "Country",
      artist: "Florent Champigny",
      album: "CountryAlbum",
      image: MetasImage.network(
          "https://vignette.wikia.nocookie.net/alan-walker/images/1/1d/9fa13acf7fd692b9310adda64cd0be3f.jpg"), //can be MetasImage.network
    ),
  );
  // "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3";
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio.network(url.path, metas: url.metas),
      showNotification: true,
    );
    // assetsAudioPlayer.play();
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicData = Provider.of<Songs>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        needBackOption: true,
        appBar: AppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MusicCover(
              songIndex: widget.songIndex,
              isPlaying: _isPlaying,
              musicData: musicData),
          MusicTimesBar(),
          MusicTimes(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Feather.skip_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    AntDesign.banckward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    assetsAudioPlayer.seekBy(Duration(seconds: -10));
                  },
                ),
                if (_isPlaying)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                        assetsAudioPlayer.play();
                      });
                    },
                    child: Stack(children: [
                      Image.asset('images/Ellipse 5.png'),
                      Positioned(
                        left: 13,
                        top: 4,
                        // bottom: 5,
                        // right: 5,
                        child: Icon(
                          Feather.play,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ]),
                  ),
                if (!_isPlaying)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                        assetsAudioPlayer.pause();
                      });
                    },
                    child: Stack(children: [
                      Image.asset('images/Ellipse 5.png'),
                      Positioned(
                        left: 7,
                        top: 3,
                        // bottom: 5,
                        // right: 5,
                        child: Icon(
                          Feather.pause,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ]),
                  ),
                IconButton(
                  icon: Icon(
                    AntDesign.forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    assetsAudioPlayer.seekBy(Duration(seconds: 10));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Feather.skip_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MusicTimesBar extends StatelessWidget {
  const MusicTimesBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              Container(
                height: 5,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MusicCover extends StatelessWidget {
  const MusicCover({
    Key key,
    this.songIndex,
    @required this.isPlaying,
    @required this.musicData,
  }) : super(key: key);

  final bool isPlaying;
  final Songs musicData;
  final int songIndex;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      // curve: Curves.easeOutExpo,
      endRadius: 200.0,
      glowColor: isPlaying ? Colors.transparent : Colors.pink,
      child: Material(
        elevation: 8.0,
        shape: CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(
              musicData.getSongImageUrl(songIndex),
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          radius: 100.0,
        ),
      ),
    );
  }
}

class MusicTimes extends StatelessWidget {
  const MusicTimes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '01:33',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '01:33',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
