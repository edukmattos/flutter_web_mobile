import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/auth/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  
  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String password;
  @action
  changePassword(String value) => password = value;

  @computed
  bool get formIsValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return "Obrigatorio";
    } else if (Validator.email(email)) {
      return "Invalido";
    }
    return null;
  }
  
  String validatePassword() {
    if (password == null || password.isEmpty) {
      return "Obrigatorio";
    } else if (password.length < 3) {
      return "Maior que 03 caracteres";
    }
    return null;
  }

  formIsValidOk() {
    //loginRepository.saveLogin(name, email);
  }

  //allLogins() {
  //  _loginRepository.allLogins()
  //    .then((data) => logins = data);
  //    print(logins);
  //}

}

