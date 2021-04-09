// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_apiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthapiService implements AuthapiService {
  _AuthapiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://localhost:8000/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<User> login(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('auth/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }
}
