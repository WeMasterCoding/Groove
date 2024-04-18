import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groove/utils/colors.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Room extends StatefulWidget {
  final String roomID;
  final IO.Socket socket;

  const Room({super.key, required this.socket, required this.roomID});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  TextEditingController _ytController = TextEditingController();
  late YoutubePlayerController _controller;
  String? videoURL;
  String? videoID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('in rooms.dart: ');
    _controller = YoutubePlayerController(initialVideoId: '');

    // video sync
    widget.socket.on('r-video', (videURL) {
      setState(() {
        videoID = YoutubePlayer.convertUrlToId(videURL!);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('room displose');
    widget.socket.emit('leaveRoom', widget.roomID);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(child: Text('Room page')),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.clear,
            size: 35,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.accent,
        // title: Text('Room page'),
      ),

      body: Container(
        color: AppColors.accent,
        // padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ytController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Enter YouTube video URL",
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      videoURL = _ytController.text;

                      widget.socket.emit('play-video',
                          {"videoURL": videoURL, "roomID": widget.roomID});
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Text('Play'),
                  ),
                ],
              ),
            ),
            // TextField(
            //   controller: _ytController,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     videoURL = _ytController.text;

            //     widget.socket.emit('play-video',
            //         {"videoURL": videoURL, "roomID": widget.roomID});

            //     // setState(() {
            //     //   // videoID = YoutubePlayer.convertUrlToId(videoURL!);
            //     // });
            //   },
            //   child: const Text('Play'),
            // ),
            SizedBox(
              height: 40,
            ),
            (videoID != null && videoID!.isNotEmpty)
                ? YoutubePlayer(
                    controller: _controller,
                    onReady: () {
                      _controller.load(videoID!);
                      _controller.play();
                    },
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blue,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                      ),
                    ],
                  )
                : Container(
                    child: const Text(
                      "It's quiet here...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

            Expanded(child: SizedBox()),
            Container(
              // color: Color.fromARGB(74, 83, 100, 115),
              padding: EdgeInsets.symmetric(horizontal: 9),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 0, 217, 255),
                  width: 0.2,
                ),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Chat with others...",
                          hintStyle: TextStyle(color: Colors.white60),
                          border: InputBorder.none
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.transparent),
                          // ),
                          ),
                    ),
                  ),
                  // Text(
                  //   'ehlo',
                  //   style: TextStyle(color: Colors.red),
                  // )
                  Icon(
                    Icons.send,
                    color: Color.fromARGB(220, 0, 213, 255),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
