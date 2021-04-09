import 'package:oversea_app/bloc/put/cubit/editcontact_cubit.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactForm extends StatefulWidget {
  final Contact _contact;
  ContactForm(this._contact);
  @override
  _ContactFormState createState() => _ContactFormState(this._contact);
}

class _ContactFormState extends State<ContactForm> {
  final Contact _contact;
  _ContactFormState(this._contact);
  final _formKey = GlobalKey<FormState>();
  String _name, _job;
  int _age, _id;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextFormField(
            initialValue: _contact.name,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Name'),
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter name";
              }
              return null;
            },
            onSaved: (value) {
              this._name = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: _contact.age.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Age'),
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter Age";
              }
              return null;
            },
            onSaved: (value) {
              this._age = int.parse(value);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: _contact.job,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Job'),
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter Job";
              }
              return null;
            },
            onSaved: (value) {
              this._job = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Contact contact = Contact(_name, _job, _age, _contact.id);
                  context
                      .bloc<EditcontactCubit>()
                      .edit(_contact.id.toString(), contact);
                }
              },
              child: Text('Update Contact'))
        ],
      ),
    );
  }
}
