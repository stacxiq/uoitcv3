import 'package:hive/hive.dart';

abstract class AuthService {
  openAuthBox();
  setUserToken(String token);
  bool isAuthenticated();
  setUserName(String name);

  String getUsername();
  String getToken();

  logout();
  AuthService();

  factory AuthService.impl() {
    return AuthServiceImpl();
  }
}

class AuthServiceImpl extends AuthService {
  @override
  openAuthBox() async {
    await Hive.openBox('authBox');
  }

  @override
  setUserToken(String token) async {
    var box = Hive.box('authBox');
    box.put('token', token);
  }

  @override
  bool isAuthenticated() {
    var box = Hive.box('authBox');
    return box.get('token', defaultValue: null) == null ? false : true;
  }

  @override
  setUserName(String name) {
    // TODO: implement setUserName
    var box = Hive.box('authBox');
    box.put('username', name);
  }

  @override
  String getUsername() {
    // TODO: implement getUsername
    var box = Hive.box('authBox');
    return box.get('username', defaultValue: null) ?? 'مرحبا بك';
  }

  @override
  String getToken() {
    var box = Hive.box('authBox');
    return box.get('token', defaultValue: null) ?? '';
  }

  @override
  logout() {
    // TODO: implement logout
    var box = Hive.box('authBox');
    box.put('token', null);
    box.put('username', null);
    box.delete('token');
    box.delete('username');
    box.clear();
  }
}
