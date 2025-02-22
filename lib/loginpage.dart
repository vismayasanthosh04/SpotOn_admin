import 'package:flutter/material.dart';
import 'package:spoton_admin/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          height: 800,
          width: 400,
          color: Colors.black,
          child: Image(
            image: const NetworkImage(
                'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg'),
            fit: BoxFit.contain,
          ),
        )),
        Expanded(
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  'SpotOn',
                  style: TextStyle(fontSize: 50.0, color: Color(0xFF7F00FF)),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.black))),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    obscureText: isObscure,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xFF7F00FF)),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(405.0, 50.0),
                        backgroundColor: Color(0xFF7F00FF)),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
