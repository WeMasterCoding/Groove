import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groove/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () async {
            await supabase.auth.signOut();
            await GoogleSignIn().signOut();
            print('signout sucessfull');
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
