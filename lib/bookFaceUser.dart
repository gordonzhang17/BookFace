import 'package:faker/faker.dart';
import "dart:math";
import 'package:flutter/material.dart';

enum Status {
  online,
  offline,
}

class BookFaceUser {
  String firstName;
  String lastName;
  String favouriteSport;
  Status status;
  Color color;

  BookFaceUser(this.firstName, this.lastName, this.favouriteSport, this.status,
      this.color);

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getFavouriteSport() {
    return favouriteSport;
  }

  Status getStatus() {
    return status;
  }

  Color getFavouriteColour() {
    return color;
  }
}

List<BookFaceUser> generateBookFacePosts(int numberPostsToGenerate) {
  List<BookFaceUser> bookFaceUsers = new List();

  List<Status> statuses = Status.values;

  for (int i = 0; i < numberPostsToGenerate; i++) {
    Faker faker = new Faker();

    final _random = new Random();
    Status randomStatus = statuses[_random.nextInt(statuses.length)];
    Color randomColor = Color.fromARGB(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));

    bookFaceUsers.add(new BookFaceUser(
        faker.person.firstName(),
        faker.person.lastName(),
        faker.sport.name(),
        randomStatus,
        randomColor));
  }

  return bookFaceUsers;
}

