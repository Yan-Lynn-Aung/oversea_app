part of 'editcontact_cubit.dart';

abstract class EditcontactState extends Equatable {
  const EditcontactState();

  @override
  List<Object> get props => [];
}

class EditcontactInitial extends EditcontactState {}

class EditcontactLoading extends EditcontactState {}

class EditcontactSuccess extends EditcontactState {}

class EditcontactFail extends EditcontactState {
  final String error;
  EditcontactFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
