part of 'authentication_bloc.dart';

// AuthenticationEvent: Abstract class that represents the different events that can occur in the authentication process.
sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

// Represents a change in user authentication status.
final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status); // new AuthenticationStatus.

  final AuthenticationStatus status;
}

// Represents a user logout request.
final class AuthenticationLogoutRequested extends AuthenticationEvent {}