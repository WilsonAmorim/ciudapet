import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LocalStorage _localStorage;
  @readonly
  UserModel? _userLogged;

  _AuthStoreBase({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @action
  Future<void> loadUserLogged() async {
    // useario logado
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);
    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }
    // deslocgado
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        await _localStorage.clear();
        _userLogged = UserModel.empty();
      }
    });
  }

  Future<void> logout() async {
    await _localStorage.clear();
    _userLogged = UserModel.empty();
  }
}
