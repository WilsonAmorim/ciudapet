import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widgets/messages.dart';
import 'package:cuidapet_mobile/app/services/users/user_service.dart';
import 'package:mobx/mobx.dart';
part 'register_controle.g.dart';

class RegisterControle = _RegisterControleBase with _$RegisterControle;

abstract class _RegisterControleBase with Store {
  final UserService _userService;
  final AppLogger _log;

  _RegisterControleBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> register(
      {required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Messages.info(
          'Enviamos um e-mail de confirmação, por favor olhe sua caixa de e-mail');
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert('E-mail já utilizado, por favor escolha outro');
    } catch (e, s) {
      _log.error('Erro ao registrar usuário', e, s);
      Loader.hide();
      Messages.alert('Erro ao registrar usuário');
    }
  }
}
