import 'package:faker/faker.dart';
import "dart:math";
import 'package:english_words/english_words.dart';

enum Status {
  online,
  offline,
}

class BookFaceUser {
  String firstName;
  String lastName;
  String favouriteSport;
  Status status;
  String profileQuote;

  BookFaceUser(this.firstName, this.lastName, this.favouriteSport, this.status,
      this.profileQuote);

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

  String getProfileQuote() {
    return profileQuote;
  }
}

List<BookFaceUser> generateBookFacePosts(int numberPostsToGenerate) {
  List<BookFaceUser> bookFaceUsers = new List();

  List<Status> statuses = Status.values;

  for (int i = 0; i < numberPostsToGenerate; i++) {
    Faker faker = new Faker();

    final _random = new Random();
    Status randomStatus = statuses[_random.nextInt(statuses.length)];
    String randomSentence = generateWordPairs().take(1).toString() +
        " " +
        generateWordPairs().take(1).toString();

    bookFaceUsers.add(new BookFaceUser(
        faker.person.firstName(),
        faker.person.lastName(),
        faker.sport.name(),
        randomStatus,
        randomSentence));
  }

  return bookFaceUsers;
}

