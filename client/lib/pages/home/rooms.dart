import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Room extends StatefulWidget {
  final String roomID;
  final IO.Socket socket;

  const Room({super.key, required this.socket, required this.roomID});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('in rooms.dart: ');
    print(widget.roomID);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('room displose');
    widget.socket.emit('leaveRoom', widget.roomID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(child: Text('Room page')),
      appBar: AppBar(
        title: Text('Room page'),
      ),
    );
  }
}
