import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/core/services/authservice/auth_service.dart';
import 'package:uoitc_new_app/features/auth/data/models/user_request.dart';
import 'package:uoitc_new_app/features/auth/data/repository/auth_repository.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_event.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const AuthState.loading()) {
    on<AuthEvent>(
      (AuthEvent event, emit) async {
        await event.map(login: (user_model) async {
          emit(const AuthState.loading());

          final response = await _authRepository.login(UserRequest(
              username: user_model.username, password: user_model.password));

          response.when(success: (data) {
            AuthService authService = AuthServiceImpl();
            authService.setUserName(data.name!);
            authService.setUserToken(data.jwt!);
            emit(
              AuthState.success(data),
            );
          }, failure: (err) {
            emit(AuthState.error(error: err.apiErrorModel.message!));
          });
        });
      },
    );
  }
}
