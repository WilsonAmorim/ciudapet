import 'package:cuidapet_mobile/app/modules/auth/home/auth_home_page.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_module.dart';
import 'package:cuidapet_mobile/app/modules/auth/register/register_module.dart';
import 'package:cuidapet_mobile/app/repositories/users/user_repository.dart';
import 'package:cuidapet_mobile/app/repositories/users/user_repository_impl.dart';
import 'package:cuidapet_mobile/app/services/users/user_service.dart';
import 'package:cuidapet_mobile/app/services/users/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(
        log: i(),
        restClient: i(),
      ),
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        log: i(),
        userRepository: i(),
        localStorage: i(),
        localSecureStorage: i(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => AuthHomePage(authStore: Modular.get())),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
  ];
}
