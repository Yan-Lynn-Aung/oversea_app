import 'package:oversea_app/data/model/contact.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiService.g.dart';

@RestApi(baseUrl: 'http://localhost:8000/api/v1/')
abstract class ApiService {
  // factory ApiService(Dio dio) => _ApiService(dio);
  factory ApiService(Dio dio) = _ApiService;
  @GET('contact_list')
  Future<List<Contact>> getContact();

  @POST('add_contact')
  Future<Contact> addContact(@Body() Contact contact);

  @PUT('update_contact/{id}')
  Future<Contact> updateContact(@Path() String id, @Body() Contact contact);

  @DELETE('delete_contact/{id}')
  Future<Contact> deleteContact(@Path() String id);
}
