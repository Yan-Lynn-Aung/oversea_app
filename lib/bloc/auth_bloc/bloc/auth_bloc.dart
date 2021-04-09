import 'dart:async';
import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthapiRepository authapiRepository;

  AuthenticationBloc({@required this.authapiRepository})
      : assert(authapiRepository != null),
        super(AuthenticationUninitialized());

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await authapiRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authapiRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authapiRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
