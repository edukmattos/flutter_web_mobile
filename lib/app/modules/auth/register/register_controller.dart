import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {

  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @computed
  bool get formIsValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "Obrigatorio";
    } else if (name.length < 3) {
      return "Maior que 03 caracteres";
    }
    return null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return "Obrigatorio";
    } else if (!email.contains("@")) {
      return "Invalido";
    }
    return null;
  }

  formIsValidOk() {
    
  }
}
