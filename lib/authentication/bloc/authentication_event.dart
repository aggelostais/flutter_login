part of 'authentication_bloc.dart';

// The AuthenticationEvent is an abstract class that represents the different events that can occur in the authentication process.
sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

// The AuthenticationStatusChanged event is dispatched when the user's authentication status changes.
final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}

// The AuthenticationLogoutRequested event is dispatched when the user requests to log out.
final class AuthenticationLogoutRequested extends AuthenticationEvent {}