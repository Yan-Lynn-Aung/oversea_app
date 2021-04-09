import 'package:bloc/bloc.dart';
import 'package:oversea_app/data/model/contact.dart';
import 'package:oversea_app/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'postcontact_state.dart';

class PostcontactCubit extends Cubit<PostcontactState> {
  final ContactRepository _contactRepository;
  PostcontactCubit(this._contactRepository) : super(PostcontactInitial());

  void addContact(Contact contact) {
    emit(PostcontactLoading());
    _contactRepository
        .addContact(contact)
        .then((value) => emit(PostcontactSuccess()))
        .catchError((e) => emit(PostcontactFail('Error')));
  }
}
