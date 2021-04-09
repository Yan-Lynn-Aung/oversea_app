import 'package:bloc/bloc.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:oversea_app/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetcontactState> {
  final ContactRepository _contactRepository;
  GetcontactCubit(this._contactRepository) : super(GetcontactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetcontactInitial());
    _contactRepository
        .getContact()
        .then((value) => emit(GetcontactSuccess(value)))
        .catchError((e) => emit(GetcontactFail('Error')));
  }

  void delete(String id) {
    emit(GetcontactInitial());
    _contactRepository
        .deleteContact(id)
        .then((value) => this.getContact())
        .catchError((e) => emit(GetcontactFail('Connot Delete')));
  }
}
