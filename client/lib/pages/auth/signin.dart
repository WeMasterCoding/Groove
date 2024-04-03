import 'package:flutter/material.dart';
import 'package:client/widgets/input_field.dart';

class SignIn extends StatefulWidget {
  // const SignIn({super.key});
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String password = '';
  String email = '';

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0B1527),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0B1527),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headings
                const Row(
                  children: [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.waving_hand,
                      color: Colors.yellow,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                const Text(
                  "Please enter your email & password to sign in.",
                  style: TextStyle(
                    color: Colors.white38,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                InputField(
                  controller: emailController,
                  fieldName: 'Email',
                  hintText: "user@gmail.com",
                  icon: const Icon(Icons.mail_outline, color: Colors.white),
                ),

                InputField(
                  controller: passwordController,
                  fieldName: 'Password',
                  hintText: "*********",
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  height: 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                ),

                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white38,
                          ),
                          children: [
                            TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

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
                            ' or continue with ',
                            style: TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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

                const SizedBox(height: 20,),

                const Row(
                  children: [
                    SocialLogins(icon: Icon(Icons.discord, color: Colors.indigoAccent)),
                    Spacer(),
                    SocialLogins(icon: Icon(Icons.facebook, color: Colors.lightBlueAccent)),
                    Spacer(),
                    SocialLogins(icon: Icon(Icons.discord, color: Colors.indigoAccent)),
                    Spacer(),
                    SocialLogins(icon: Icon(Icons.discord, color: Colors.indigoAccent)),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 20,),
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign in'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),

                // const Text(
                //   'hue',
                //   style: TextStyle(color: Colors.white),
                // ),
                // Text(
                //   email + " ->email",
                //   style: TextStyle(color: Colors.white),
                // ),
                // Text(password + ' ->password',
                //     style: TextStyle(color: Colors.white)),
                //
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         // email = controller.text;
                //         // widget.password = widget.passwordController.text;
                //         email = emailController.text;
                //         password = passwordController.text;
                //       });
                //     },
                //     child: const Text('button2'))
              ],
            ),
          ),
        ));
  }
}

class SocialLogins extends StatelessWidget {
  final Icon icon;
  const  SocialLogins({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(40.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: icon,
          ),
        )
      ],
    );
  }
}

