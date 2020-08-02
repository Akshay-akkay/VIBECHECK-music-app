import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/providers/song_model.dart';
import 'package:vibecheck/screen/music_player/music_player_screen.dart';

class VertListView extends StatefulWidget {
  final removeOption;
  final String songId;

  VertListView({
    this.removeOption = false,
    this.songId,
  });

  @override
  _VertListViewState createState() => _VertListViewState();
}

class _VertListViewState extends State<VertListView> {
  var _isPlaying = false;
  Audio url = Audio(
    "assets/audios/relax.mp3",
    metas: Metas(
      title: "Country",
      artist: "Florent Champigny",
      album: "CountryAlbum",
      image: MetasImage.network(
          "https://vignette.wikia.nocookie.net/alan-walker/images/1/1d/9fa13acf7fd692b9310adda64cd0be3f.jpg"), //can be MetasImage.network
    ),
  );
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicdata = Provider.of<Songs>(context);
    // var _isplaying = musicdata.getIsPlaying(0);

    // print(_isPlaying);

    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500, childAspectRatio: 4 / 1),
          physics: BouncingScrollPhysics(),
          // padding: const EdgeInsets.all(6),
          itemCount: musicdata.getTotalSongs(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MusicPlayerScreen(
                      songIndex: index,
                    ),
                  ),
                );
              },
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                musicdata.getSongImageUrl(index),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  musicdata.getSongTitle(index),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  musicdata.getArtistName(index),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (!widget.removeOption)
                                _isPlaying
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isPlaying = !_isPlaying;
                                            assetsAudioPlayer.stop();
                                            // assetsAudioPlayer.playOrPause();
                                          });
                                        },
                                        focusColor: Colors.white,
                                        splashColor: Colors.white30,
                                        icon: Icon(
                                          Feather.pause_circle,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isPlaying = !_isPlaying;
                                            assetsAudioPlayer.open(url);
                                            // assetsAudioPlayer.playOrPause();
                                          });
                                        },
                                        focusColor: Colors.white,
                                        splashColor: Colors.white30,
                                        icon: Icon(
                                          Feather.play_circle,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                            ],
                          ),
                          if (widget.removeOption)
                            IconButton(
                              onPressed: () {},
                              focusColor: Colors.white,
                              splashColor: Colors.white30,
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
