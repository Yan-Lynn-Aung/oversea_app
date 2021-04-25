import 'package:oversea_app/bloc/auth_bloc/bloc/auth.dart';
import 'package:oversea_app/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oversea_app/bloc/post/cubit/postcontact_cubit.dart';
import 'package:oversea_app/data/api/apiService.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:oversea_app/service_locator/module.dart';
import 'package:oversea_app/widget/contact/addContact_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:oversea_app/style/theme.dart' as Style;

class AddContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = Get.find();
    return BlocProvider<PostcontactCubit>(
      create: (context) => PostcontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Style.Colors.secondBlack,
          // leading: Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: CircleAvatar(
          //     backgroundImage: NetworkImage(
          //         "https://www.nicepng.com/png/full/138-1383066_mr-bean-cartoon-png.png"),
          //   ),
          // ),
          title: Text("Add Contact"),
          actions: [
            IconButton(
                icon: Icon(EvaIcons.logOutOutline),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(),
                  );
                })
          ],
        ),
        body: BlocBuilder<PostcontactCubit, PostcontactState>(
          builder: (context, state) {
            if (state is PostcontactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostcontactSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('suceess'),
                    FlatButton(
                        onPressed: () {
                          // Get.put('success');
                          Navigator.pop(context, 'success');
                        },
                        child: Text('Go Home'))
                  ],
                ),
              );
            } else if (state is PostcontactFail) {
              return Center(
                child: Text(state.error),
              );
            }
            return ContactForm();
          },
        ),
      ),
    );
  }
}
