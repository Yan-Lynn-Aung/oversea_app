import 'package:oversea_app/data/api/apiService.dart';
import 'package:oversea_app/data/model/contact.dart';

class ContactRepository {
  final ApiService _apiService;

  ContactRepository(this._apiService);
  //get
  Future<List<Contact>> getContact() => _apiService.getContact();
  //add
  Future<Contact> addContact(Contact contact) =>
      _apiService.addContact(contact);
  //update
  Future<Contact> updateContact(String id, Contact contact) =>
      _apiService.updateContact(id, contact);
  //delete
  Future<Contact> deleteContact(String id) => _apiService.deleteContact(id);
}
