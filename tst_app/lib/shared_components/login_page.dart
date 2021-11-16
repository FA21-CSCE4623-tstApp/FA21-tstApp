import 'package:flutter/material.dart';
// import 'package:tst_app/home/home_screen.dart';
// import 'package:tst_app/home/page_components.dart';

class LoginRegister extends StatefulWidget {
  static String route = 'login_screen';
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final _controllerUsername = TextEditingController();
  final _controllerpassword = TextEditingController();
  String _username = "";
  String _password = "";
  Color loginColor = Colors.black;
  Color backgroundColor = Color(0xFFFFFBEF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Container(
                width: 35.0,
                height: 35.0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: loginColor,
                  foregroundColor: Color(0xFFFFFBEF),
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: double.infinity),
              child: Container(
                width: 80.0,
                height: 60.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/images/logo_black.png',
                      height: 170.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextField(
                    controller: _controllerUsername,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent, width: 1.5),
                      ),
                    ),
                    cursorColor: Colors.deepOrangeAccent,
                    onChanged: (data) {
                      _username = data;
                      print(_username);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _controllerpassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (data) {
                      _password = data;
                      print(_password);
                    },
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('register');
                        },
                        child: Container(),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   elevation: 10.0,
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 105.0, vertical: 12.0),
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        //   color: Colors.black,
                        //   child: Text(
                        //     'Log in',
                        //     style: TextStyle(
                        //       fontSize: 20.0,
                        //       fontWeight: FontWeight.w300,
                        //       color: backgroundColor,
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // RaisedButton(
                      //   onPressed: () {
                      //     print('register');
                      //   },
                      //   elevation: 10.0,
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 95.0, vertical: 12.0),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ),
                      //   color: Colors.deepOrange[300],
                      //   child: Text(
                      //     'Register',
                      //     style: TextStyle(
                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.w300,
                      //       color: backgroundColor,
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
