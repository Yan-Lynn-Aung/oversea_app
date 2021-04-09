import 'package:oversea_app/bloc/auth_bloc/bloc/auth.dart';
import 'package:oversea_app/bloc/get/cubit/getcontact_cubit.dart';
import 'package:oversea_app/data/api/apiService.dart';
import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:oversea_app/data/repository/contact_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;
void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  // AuthapiRepository authapiRepository = AuthapiRepository(getIt.call());
  // getIt.registerLazySingleton(() => authapiRepository);

  ContactRepository contactRepository = ContactRepository(getIt.call());
  getIt.registerLazySingleton(() => contactRepository);

  GetcontactCubit getcontactCubit = GetcontactCubit(getIt.call());
  getIt.registerLazySingleton(() => getcontactCubit);
}
