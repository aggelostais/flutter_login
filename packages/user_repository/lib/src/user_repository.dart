import 'dart:async';

import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

// The UserRepository class is a simple repository that provides access to a user object.
// This is where we would query the current user from the backend
class UserRepository {
  User? _user; // The _user property is a private variable that holds the current user.

  // The getUser method returns the current user. If the user is not available, it simulates a network request delay and then returns a new user.
  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}