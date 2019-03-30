import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/BookFaceUserProfile.dart';
import 'package:flutter_app/bookFaceUser.dart';
import 'package:flutter_app/appSharedPreferences.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To BookFace"),
      ),
      body: SecondPageActivity(),
    );
  }
}

class SecondPageActivity extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPageActivity> {
  final _bookFaceUsers = <BookFaceUser>[];

  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Container(
      color: Colors.cyan,
      child: Column(
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.all(15.0),
          ),
          FutureBuilder<String>(
            future: AppSharedPreferences().getLoggedInUsername(),
            initialData: "User",
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return snapshot.hasData
                  ? _buildUsernameContainer(snapshot.data)
                  : Container();
            },
          ),
          Padding(
            padding: new EdgeInsets.all(20.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: width,
                height: height / 2,
                child: _buildPosts(),
              ),
            ],
          ),
          Padding(
            padding: new EdgeInsets.all(30.0),
          ),
          RaisedButton(
            padding: EdgeInsets.all(5.0),
            child: Text(
                "Go To Profile",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black,
            splashColor: Colors.deepOrange,
            onPressed: () {
              Navigator.push(
                context,
                new CupertinoPageRoute(
                    builder: (context) => BookFaceUserProfile()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameContainer(String username) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
      width: width,
      height: 60.0,
      child: Text(
        "Welcome, " + username + "!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
    );
  }

  Widget _buildPosts() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _bookFaceUsers.length) {
          _bookFaceUsers.addAll(generateBookFacePosts(10));
        }
        return _buildProfileCell(_bookFaceUsers[index]);
      },
    );
  }

  Widget _buildProfileCell(BookFaceUser bookFaceUser) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new CupertinoPageRoute(
            builder: (context) =>
                BookFaceUserProfile(bookFaceUser: bookFaceUser),
          ),
        );
      },
      child: Card(
        elevation: 8.0,
        color: Colors.lightBlue[50],
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                bookFaceUser.getFirstName() + " " + bookFaceUser.getLastName(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Favourite Sport: " + bookFaceUser.getFavouriteSport(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                bookFaceUser.getStatus().toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
