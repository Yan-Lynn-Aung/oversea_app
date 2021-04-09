import 'package:oversea_app/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oversea_app/bloc/login_bloc/bloc/login_bloc.dart';

import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final AuthapiRepository authapiRepository;

  LoginScreen({Key key, @required this.authapiRepository})
      : assert(authapiRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authapiRepository: authapiRepository,
          );
        },
        child: LoginForm(
          authapiRepository: authapiRepository,
        ),
      ),
    );
  }
}
