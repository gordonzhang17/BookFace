import 'package:flutter/material.dart';
import 'package:flutter_app/bookFaceUser.dart';

class BookFaceUserProfile extends StatelessWidget {

  final BookFaceUser bookFaceUser;

  BookFaceUserProfile({this.bookFaceUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome To BookFace"),
        ),
        body: Text(bookFaceUser.getFirstName()));
  }
}

class BuildProfileActivity extends StatefulWidget {
  @override
  BuildProfileState createState() => new BuildProfileState();
}

class BuildProfileState extends State<BuildProfileActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: build profile based on bookfaceuser
    return null;
  }
}
