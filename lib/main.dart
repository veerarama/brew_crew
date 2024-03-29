import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screen/splash.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screen/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Splash(),
        routes: {
          '/wrapper' : (context) => Wrapper(),
        },
      ),
    );
  }
}
