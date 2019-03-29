import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/mainProfileScreen.dart';
import 'package:flutter_app/appSharedPreferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookFace for Flutter',
      home: LoginActivity(),
      theme: new ThemeData(
        primaryColor: Colors.amber,
      ),
    );
  }
}

class LoginActivity extends StatefulWidget {
  @override
  LoginActivityState createState() => new LoginActivityState();
}

class LoginActivityState extends State<LoginActivity> {
  TextEditingController _userNameTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("BookFace Log In Screen"),
      ),
      body: _buildUserAndPasswordInputs(),
    );
  }

  Widget _buildUserAndPasswordInputs() {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.all(5.0),
          ),
          Container(
            height: 225.0,
            width: 400.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/NYC.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(5.0),
          ),
          Center(
            child: Container(
              height: 75.0,
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                'Welcome to BookFace, a social media application!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(5.0),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100.0,
            child: TextFormField(
              controller: _userNameTextEditingController,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                hintText: 'Enter your BookFace User Name',
                labelText: 'BookFace User Name',
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100.0,
            child: TextFormField(
              controller: _passwordTextEditingController,
              keyboardType: TextInputType.text,
              //obscure text == true makes text hidden
              obscureText: true,
              decoration: new InputDecoration(
                hintText: 'Enter your BookFace password',
                labelText: 'BookFace Password',
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            child: RaisedButton(
              child: const Text('Log in'),
              color: Colors.black,
              textColor: Colors.white,
              padding: const EdgeInsets.all(5.0),
              onPressed: _saveUsernameAndPasswordAndProceed,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _saveUsernameAndPasswordAndProceed() {
    String userName = _userNameTextEditingController.text;
    String password = _passwordTextEditingController.text;

    AppSharedPreferences().setLoggedInUsername(userName);
    AppSharedPreferences().setLoggedInPassword(password);

    Navigator.push(
      context,
      new CupertinoPageRoute(builder: (context) => SecondScreen()),
    );
  }
}

//class CustomTextForm extends StatefulWidget {
//  @override
//  _CustomTextFormState createState() => _CustomTextFormState();
//}
//
//class _CustomTextFormState extends State<CustomTextForm> {
//  final customController = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//
//  @override
//  void dispose() {
//    customController.dispose();
//    super.dispose();
//  }
//}
