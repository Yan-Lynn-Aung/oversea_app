import 'package:oversea_app/bloc/get/cubit/getcontact_cubit.dart';
import 'package:oversea_app/data/api/apiService.dart';
import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:oversea_app/screen/auth/intro_screen.dart';
import 'package:oversea_app/screen/home.dart';
import 'package:oversea_app/service_locator/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oversea_app/style/theme.dart' as Style;
import 'bloc/auth_bloc/bloc/auth.dart';
import 'bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

void main() {
  final authapiRepository = AuthapiRepository(null);
  locator();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(authapiRepository: authapiRepository)
          ..add(AppStarted());
      },
      child: MyApp(authapiRepository: authapiRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthapiRepository authapiRepository;
  MyApp({Key key, @required this.authapiRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ApiService apiService = ApiService(dio);
    Get.put(apiService);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return GetMaterialApp(
              home: BlocProvider<GetcontactCubit>(
                create: (context) => getIt.call(),
                child: Home(),
              ),
            );
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(authapiRepository: authapiRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
