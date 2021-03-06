import 'package:flutter/material.dart';
import 'package:pet_app/screens/home/home_page.dart';
import 'package:pet_app/screens/login/login_form.dart';
import 'package:pet_app/services/auth/auth_service.dart';
import 'package:pet_app/services/services.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = services.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LoginForm(
              loginHandler: (email, password) async {
                _authService.signIn(email, password).then((value) =>
                    Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName));
              },
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed("/register"),
              child: Text("Don't have an account?"),
            )
          ],
        ),
      ),
    );
  }
}
