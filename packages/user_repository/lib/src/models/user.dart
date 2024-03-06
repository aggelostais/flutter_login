import 'package:equatable/equatable.dart';

// The User class is a simple model that represents a user. It extends Equatable to make it easier to compare instances of the class.
// What is Equatable? Equatable is a package that provides a base class that makes it easier to compare objects for equality.
// The User class has a single property, id, which is a unique identifier for the user.
// It could also have other properties, such as a username, email etc.
class User extends Equatable {
  const User(this.id);
  final String id;

  // The props getter returns a list of the object's properties that should be used to determine if two instances of the class are equal.
  // In this case, the property is the id.
  @override
  List<Object> get props => [id]; 

  static const empty = User('-');
}