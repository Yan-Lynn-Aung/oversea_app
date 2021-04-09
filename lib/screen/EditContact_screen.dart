import 'package:oversea_app/bloc/auth_bloc/bloc/auth.dart';
import 'package:oversea_app/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oversea_app/bloc/put/cubit/editcontact_cubit.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:oversea_app/service_locator/module.dart';
import 'package:oversea_app/widget/contact/editContact_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oversea_app/style/theme.dart' as Style;

class EditContactScreen extends StatelessWidget {
  final Contact _contact;
  EditContactScreen(this._contact);
  @override
  Widget build(BuildContext context) {
    // final ApiService apiService = Get.find();
    return BlocProvider<EditcontactCubit>(
      create: (context) => EditcontactCubit(getIt.call()),
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
          title: Text("Contact Edit"),
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
        body: BlocBuilder<EditcontactCubit, EditcontactState>(
          builder: (context, state) {
            if (state is EditcontactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EditcontactSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('suceess'),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, 'success');
                        },
                        child: Text('Go Home'))
                  ],
                ),
              );
            } else if (state is EditcontactFail) {
              return Center(
                child: Text(state.error),
              );
            }
            return ContactForm(this._contact);
          },
        ),
      ),
    );
  }
}
