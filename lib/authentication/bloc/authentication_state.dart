part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  final AuthenticationStatus status;
  final User user;

  // Constructor that creates an instance of AuthenticationState with the status set to AuthenticationStatus.unknown.
  // This is the initial state of the AuthenticationBloc, before the user's authentication status is known.
  // The properties are set to their default values.
  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  // The props getter returns a list of the object's properties that should be used to determine if two instances of the class are equal.
  @override
  List<Object> get props => [status, user];
}
