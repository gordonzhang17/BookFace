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
      body: _buildPage(context),
    );
  }

  Widget _buildPage(context) {
    final Size _size = MediaQuery.of(context).size;

    final String _firstName = bookFaceUser.getFirstName();
    final String _lastName = bookFaceUser.getLastName();
    final String _favouriteSport = bookFaceUser.getFavouriteSport();
    final Color _favouriteColor = bookFaceUser.getFavouriteColour();
    final Status _onlineStatus = bookFaceUser.getStatus();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildPaddingWidget(10.0),
        SizedBox(
          child: Container(
            height: 50.0,
            width: _size.width,
            decoration: BoxDecoration(
              color: _favouriteColor,
            ),
            child: Text(
              _firstName + " " + _lastName,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _buildPaddingWidget(20.0),
        Container(
          height: 250.0,
          width: 500.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/NYC.jpg')),
            ),
          ),
        ),
        _buildPaddingWidget(20.0),
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
              color: _favouriteColor,
            ),
            child: Text(
              "I love: " + " " + _favouriteSport,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _buildPaddingWidget(20.0),
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
              color: _favouriteColor,
            ),
            child: Text(
              _onlineStatus.toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaddingWidget(double size) {
    return Padding(
      padding: EdgeInsets.all(size),
    );
  }
}

class BuildProfileActivity extends StatefulWidget {
  @override
  BuildProfileState createState() => new BuildProfileState();
}

class BuildProfileState extends State<BuildProfileActivity> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
