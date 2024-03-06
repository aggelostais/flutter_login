import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {

  final _controller = StreamController<AuthenticationStatus>(); // StreamController to manage the state of the user's authentication status.
  
  // The status getter returns a Stream<AuthenticationStatus> that emits the current authentication status and any subsequent changes to it.
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1)); // Simulate a network request delay.
    yield AuthenticationStatus.unauthenticated; // Emit the current authentication status.
    yield* _controller.stream; 
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    // Simulate a network request delay.
    await Future.delayed(
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