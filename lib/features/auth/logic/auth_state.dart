
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/auth/data/models/user.dart';
part 'auth_state.freezed.dart';

@freezed
class  AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(User user) = Success;
  const factory AuthState.error({required String error}) = Error;
}