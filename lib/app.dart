import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/splash/splash.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_login/home/view/home_page.dart';
import 'package:flutter_login/login/login.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> { 
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  // Why dispose the AuthenticationRepository and not UserRepository?

  @override
  Widget build(BuildContext context) {
    // RepositoryProvider is used to provide the AuthenticationRepository to the entire widget tree.
    // Why we don't also provide the UserRepository?
    // The UserRepository is only used in the AuthenticationBloc, so we don't need to provide it to the entire widget tree.
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

// The App widget is a StatefulWidget because it needs to create and dispose the AuthenticationRepository.
class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}


class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>(); // Create a navigator key

  NavigatorState get _navigator => _navigatorKey.currentState!; // Create a getter for the navigator

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey, // Provide the navigator key to the MaterialApp
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              // Use the navigator to navigate to the correct page according to the AuthenticationStatus
              case AuthenticationStatus.authenticated: // the AuthenticationRepository is used here and that's why we provide it to the entire widget tree
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child, // Pass the child to the BlocListener
          // but what child in that case?
          // The child is the MaterialApp's child, which is the Navigator
        );
      },
      onGenerateRoute: (_) => SplashPage.route(), // Use the SplashPage as the initial route
    );
  }
}