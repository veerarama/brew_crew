import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screen/home/brew_list.dart';
import 'package:brew_crew/screen/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
          color: Colors.grey[300],
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Sign Out')
            ),
            FlatButton.icon(
                onPressed: () => showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('settings')
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/coffee_bg.png'),
                  fit: BoxFit.cover
              )
            ),
            child: BrewList()
        ),
      ),
    );
  }
}
