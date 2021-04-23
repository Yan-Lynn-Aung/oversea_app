import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:oversea_app/bloc/auth_bloc/bloc/auth.dart';
import 'package:oversea_app/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oversea_app/bloc/get/cubit/getcontact_cubit.dart';
import 'package:oversea_app/data/api/apiService.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:oversea_app/screen/addContact_screen.dart';
import 'package:oversea_app/widget/contact/contactList_widget.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'EditContact_screen.dart';
import 'package:dio/dio.dart';
import 'package:oversea_app/style/theme.dart' as Style;

class Home extends StatelessWidget {
  ApiService apiService = Get.find();
  @override
  Widget build(BuildContext context) {
    Options options = buildCacheOptions(Duration(days: 10), forceRefresh: true);
    Get.put(options);

    // BlocProvider.of<GetcontactCubit>(context).getContact();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.secondBlack,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://c4.wallpaperflare.com/wallpaper/493/399/797/hitman-despicable-me-minions-wallpaper-preview.jpg"),
          ),
        ),
        title: Text("Contact List"),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Get.to(AddContactScreen());
          var result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddContactScreen()));
          if (result != null && result == 'success') {
            BlocProvider.of<GetcontactCubit>(context).getContact();
          }
          // Get.to(AddContactScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: BlocBuilder<GetcontactCubit, GetcontactState>(
        builder: (context, state) {
          return FutureBuilder(
              future: apiService.getContact(options: options),
              builder: (context, snapshot) {
                if (state is GetcontactSuccess) {
                  List<Contact> contacts = state.contacts;
                  return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, position) {
                        return item(contacts[position], context);
                        // return ContactList(contacts[position],context);
                      });
                }
                return Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
  }
}

Widget item(Contact contact, BuildContext context) {
  return Card(
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          icon: Icons.edit,
          color: Colors.blue,
          onTap: () async {
            var result = await Navigator.push(context,
                MaterialPageRoute(builder: (_) => EditContactScreen(contact)));
            if (result != null && result == 'success') {
              BlocProvider.of<GetcontactCubit>(context).getContact();
            }
          },
        )
      ],
      secondaryActions: [
        IconSlideAction(
          icon: Icons.delete,
          color: Colors.red,
          onTap: () {
            context.bloc<GetcontactCubit>().delete(contact.id.toString());
          },
        )
      ],
      child: ListTile(
        onTap: () {
          Get.to(AddContactScreen());
        },
        title: Text(contact.name),
        subtitle: Text(contact.job),
        trailing: Text('age ${contact.age}'),
      ),
    ),
  );
}
