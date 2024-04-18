import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groove/main.dart';
import 'package:groove/routes/route.dart';
import 'package:groove/utils/colors.dart';
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
  late String? userEmail;

  @override
  void initState() {
    super.initState();

    print('@# supabase currentUser: ');
    print(supabase.auth.currentUser);
    userEmail = supabase.auth.currentUser?.email;

    setState(() {
      // roomID = supabase.auth.currentUser?.id;
      roomID = supabase.auth.currentUser?.email;
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
      //   appBar: AppBar(
      //     title: const Text('Home Page'),
      //   ),
      //   body: Column(
      //     children: [
      //       Container(
      //         child: ElevatedButton(
      //           onPressed: () async {
      //             await supabase.auth.signOut();
      //             await GoogleSignIn().signOut();
      //             print('signout sucessfull');
      //           },
      //           child: Text('Logout'),
      //         ),
      //       ),
      //       ElevatedButton(
      //           onPressed: () => createRoom(context, socket, roomID),
      //           child: const Text('create room')),
      //       Container(
      //         color: Colors.red,
      //         child: InputField(
      //             fieldName: 'room id',
      //             icon: const Icon(Icons.room_outlined),
      //             controller: joinRoomID),
      //       ),
      //       ElevatedButton(
      //           onPressed: () => joinRoom(context, socket, joinRoomID.text),
      //           child: const Text('Join room')),
      //       Text(roomID!),
      //       ElevatedButton(
      //           onPressed: () {
      //             socket.emit('checkRooms');
      //           },
      //           child: Text("log available rooms"))
      //     ],
      //   ),

      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(20),
        color: AppColors.accent,
        height: MediaQuery.of(context).size.height,
        // color: Colors.black,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset('images/Logo.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Groove',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email: $userEmail",
                  style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 17,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "Room ID",
                      style: TextStyle(
                        color: Color.fromARGB(228, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: joinRoomID,
                  style: TextStyle(
                    color: Colors.cyan[200],
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "user@gmail.com",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w800,
                      fontSize: 19,
                    ),
                    // contentPadding: EdgeInsets.all(10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white60,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 81, 0),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => joinRoom(context, socket, joinRoomID.text),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    child: const Text(
                      'JOIN ROOM',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(204, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 0.9,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      const Center(
                        child: Expanded(
                          child: Text(
                            '   OR   ',
                            style: TextStyle(
                              color: Colors.white38,
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 0.9,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // CREATE ROOM BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () => createRoom(context, socket, roomID),
                    child: const Text(
                      'CREATE ROOM',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(204, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   'Your Room ID will be your Email',
                //   style: TextStyle(color: Colors.blue[200]),
                // ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // shadowColor: MaterialStateColor,
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 47, 0),
                      ),
                    ),
                    onPressed: () async {
                      await supabase.auth.signOut();
                      await GoogleSignIn().signOut();
                      print('signout sucessfull');
                    },
                    child: const Text(
                      'LOG OUT',
                      style:
                          TextStyle(color: Color.fromARGB(255, 225, 225, 225)),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       socket.emit('checkRooms');
                //     },
                //     child: Text("log available rooms"))
              ],
            ),
          ),
        ),
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
