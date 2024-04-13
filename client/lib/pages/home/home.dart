import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groove/main.dart';
import 'package:groove/routes/route.dart';
import 'package:groove/widgets/input_field.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController joinRoomID = TextEditingController();
  late IO.Socket socket;
  late String? roomID;

  @override
  void initState() {
    super.initState();

    print('@# supabase currentUser: ');
    print(supabase.auth.currentUser);

    setState(() {
      roomID = supabase.auth.currentUser?.id;
    });

    print('home page rendered');

    socket = IO.io('http://192.168.107.239:8000', <String, dynamic>{
      "transports": ['websocket'],
      "autoConnect": false
    });

    connectToSocket(socket);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () async {
                await supabase.auth.signOut();
                await GoogleSignIn().signOut();
                print('signout sucessfull');
              },
              child: Text('Logout'),
            ),
          ),
          ElevatedButton(
              onPressed: () => createRoom(context, socket, roomID),
              child: const Text('create room')),
          Container(
            color: Colors.red,
            child: InputField(
                fieldName: 'room id',
                icon: const Icon(Icons.room_outlined),
                controller: joinRoomID),
          ),
          ElevatedButton(
              onPressed: () => joinRoom(context, socket, joinRoomID.text),
              child: const Text('Join room')),
          Text(roomID!),
          ElevatedButton(
              onPressed: () {
                socket.emit('checkRooms');
              },
              child: Text("log available rooms"))
        ],
      ),
    );
  }
}

void connectToSocket(socket) {
  socket.connect();
  socket.on("connect", (data) {
    print('connected to socket.. from frontend');
  });

  socket.emit('test', supabase.auth.currentUser?.id);
  socket.on('error', (err) => print(err));
}

void createRoom(BuildContext context, socket, roomdID) {
  print('clicked on create room');

  void handleRoomCallback(data) {
    if (data is Map<String, dynamic>) {
      print("callback create ->  ${data['status']}");

      if (data['status'] == true) {
        Navigator.pushNamed(context, '/room',
            arguments: RoomArguments(socket, roomdID));
      }
    }

    socket.off('createRoomCallback', handleRoomCallback);
  }

  socket.on('createRoomCallback', handleRoomCallback);

  socket.emit("createRoomClick",
      {"roomID": roomdID, "callbackEvent": 'createRoomCallback'});
}

void joinRoom(BuildContext context, socket, roomID) {
  void handleRoomCallback(data) {
    print('join room callback --> : ');
    if (data['status'] == false) {
      print("it's false");
    }
    if (data['status'] == true) {
      Navigator.pushNamed(context, '/room',
          arguments: RoomArguments(socket, roomID));
    }

    socket.off('joinRoomCallBack', handleRoomCallback);
  }

  socket.on('joinRoomCallBack', handleRoomCallback);

  socket.emit('joinRoom',
      {"roomID": roomID.toString(), "callbackEvent": 'joinRoomCallBack'});
}
