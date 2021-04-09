part of 'getcontact_cubit.dart';

abstract class GetcontactState extends Equatable {
  const GetcontactState();

  @override
  List<Object> get props => [];
}

class GetcontactInitial extends GetcontactState {}

class GetcontactSuccess extends GetcontactState {
  final List<Contact> contacts;

  GetcontactSuccess(this.contacts);

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [contacts];
}

class GetcontactFail extends GetcontactState {
  final String error;

  GetcontactFail(this.error);
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [error];
}
