import 'package:flutter/material.dart';
import 'package:flutter_app/bookFaceUser.dart';
import "dart:math";

class BookFaceUserProfile extends StatefulWidget {
  final BookFaceUser bookFaceUser;

  BookFaceUserProfile({this.bookFaceUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To BookFace"),
      ),
      body: BuildProfileActivity(),
    );
  }

  Widget _buildPage(context) {
    final Size _size = MediaQuery.of(context).size;
    final Random _random = new Random();

    int _numberLikes = _random.nextInt(100);

    final String _firstName = bookFaceUser.getFirstName();
    final String _lastName = bookFaceUser.getLastName();
    final String _favouriteSport = bookFaceUser.getFavouriteSport();
    final Color _favouriteColor = bookFaceUser.getFavouriteColour();
    final Status _onlineStatus = bookFaceUser.getStatus();

    void increaseNumberLikes() {
      _numberLikes++;
    }

    return Container(
      color: Colors.cyan,
      child: Column(
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
          FlatButton(
            color: Colors.orange,
            onPressed: null,
            child: Icon(
              Icons.thumb_up,
            ),
          ),
          _buildPaddingWidget(5.0),
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: _favouriteColor,
              ),
              child: Text(
                "Number of Likes: " + " " + _numberLikes.toString(),
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
                "My favourite sport is: " + " " + _favouriteSport,
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
      ),
    );
  }

  Widget _buildPaddingWidget(double size) {
    return Padding(
      padding: EdgeInsets.all(size),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _buildPage;
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
