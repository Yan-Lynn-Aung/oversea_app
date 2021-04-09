import 'dart:async';

import 'package:oversea_app/bloc/auth_bloc/bloc/auth.dart';
import 'package:oversea_app/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oversea_app/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthapiRepository authapiRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authapiRepository,
    @required this.authenticationBloc,
  })  : assert(authapiRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token =
            await authapiRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
