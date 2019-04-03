import 'package:flutter/material.dart';
import 'package:flutter_app/bookFaceUser.dart';

class UserProfile extends StatefulWidget {
  final BookFaceUser bookFaceUser;

  UserProfile(this.bookFaceUser);

  @override
  _UserProfileState createState() => _UserProfileState(bookFaceUser);
}

class _UserProfileState extends State<UserProfile> {
  BookFaceUser bookFaceUser;

  _UserProfileState(this.bookFaceUser);

  int _currentNumberLikes = 0;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    final String _firstName = bookFaceUser.getFirstName();
    final String _lastName = bookFaceUser.getLastName();
    final String _favouriteSport = bookFaceUser.getFavouriteSport();
    final Color _favouriteColor = bookFaceUser.getFavouriteColour();
    final Status _onlineStatus = bookFaceUser.getStatus();

    void increaseCounter() {
      setState(() {
        _currentNumberLikes++;
      });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("BookFace Profile"),
      ),
      body: Container(
        color: Colors.cyan,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildPaddingWidget(10.0),SizedBox(
              child: Container(
                height: 50.0,
                width: _size.width / 2,
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
              onPressed: increaseCounter,
              padding: EdgeInsets.all(5.0),
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
                  "Number of Likes: " + " " + _currentNumberLikes.toString(),
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
      ),
    );
  }

  Widget _buildPaddingWidget(double size) {
    return Padding(
      padding: EdgeInsets.all(size),
    );
  }
}
