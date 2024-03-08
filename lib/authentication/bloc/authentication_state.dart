part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  final AuthenticationStatus status;
  final User user;

  // Constructor that creates an instance of AuthenticationState with the initial values.
  // This is the initial state of the AuthenticationBloc, before the user's authentication status is known.
  // The properties are set to their default values.
  const AuthenticationState.unknown() : this._();

  
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  // Override the props getter to return a list of the properties that are used to compare instances of the class.
  @override
  List<Object> get props => [status, user];
}
