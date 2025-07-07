import 'package:product_app/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class DetailsView extends StatelessWidget{
  final Tracks track;
  const DetailsView({super.key, required this.track});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF251117),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.close,
                    color: Colors.transparent),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("From Album", 
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          ),
                        ),
                        Text("${track.album.title}",
                        style: TextStyle(
                          fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            ),
                        )
                      ],
                    ),
                  Icon(Icons.close,
                    color: Colors.white70,)
                  ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(track.album.coverBig),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) 
                )
              ),
              SizedBox(height: 30),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${track.title}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            Text("${track.artist.name}",
                            style: TextStyle(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                        Icon(Icons.favorite,
                          color: Colors.green,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    ProgressBar(
                      progress: Duration(minutes: 1),
                      total: Duration(minutes: 3, seconds: 45),
                      bufferedBarColor: Colors.white38,
                      baseBarColor: Colors.white10,
                      thumbColor: Colors.white,
                      timeLabelTextStyle: TextStyle(
                        color: Colors.white
                      ),
                      progressBarColor: Colors.white,
                      onSeek: (duration) {
                        print('User selected a new time: $duration');
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, 
                          icon: Icon(Icons.swap_horiz_outlined,
                          color: Colors.white,)),
                        IconButton(onPressed: (){}, 
                          icon: Icon(Icons.skip_previous,
                          color: Colors.white, size: 36,)),
                        IconButton(onPressed: (){}, 
                          icon: Icon(Icons.play_circle,
                          color: Colors.white, size: 60,)),
                        IconButton(onPressed: (){}, 
                          icon: Icon(Icons.skip_next,
                          color: Colors.white, size: 36,)),
                        IconButton(onPressed: (){}, 
                          icon: Icon(Icons.repeat,
                          color: Colors.white)),
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}