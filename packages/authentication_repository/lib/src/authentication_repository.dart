import 'dart:async';

// Represents the possible authentication status of a user.
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

// Manages user authentication logic.
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  // The status getter returns a Stream<AuthenticationStatus> that emits the current authentication status and any subsequent changes to it.
  // The getter returns a stream that included data events from 2 sources: the initial status and any changes added to the _controller.
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(
        const Duration(seconds: 1)); // Simulate a network request delay.
    yield AuthenticationStatus
        .unauthenticated; // Emits an initial status of unauthenticated to the returned stream.
    yield* _controller
        .stream; // Any changes added to the _controller are emitted to the returned stream.
        
  }

  // Simulates a user login.
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    // Simulate a network request delay.
    await Future.delayed(
      // The Future.delayed method returns a Future that completes after the specified duration.
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  // The logOut method adds the unauthenticated status to the _controller.
  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  // The dispose method closes the _controller when the AuthenticationRepository is no longer needed.
  void dispose() => _controller.close();
}
