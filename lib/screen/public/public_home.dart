import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oversea_app/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:oversea_app/screen/auth/login_screen.dart';
import 'package:oversea_app/style/theme.dart' as Style;

class PublicHome extends StatelessWidget {
  final AuthapiRepository authapiRepository;
  PublicHome({Key key, @required this.authapiRepository}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Get.to(LoginScreen(authapiRepository: authapiRepository));
            },
            child: Text("login"),
          ),
        ],
      ),
    );
  }
}
