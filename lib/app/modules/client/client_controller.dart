import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {
  
  @observable
  String einSsa;
  @action
  changeEinSsa(String value) => einSsa = value;

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

  String validateEinSsa() {
    if (einSsa == null || einSsa.isEmpty) {
      return "Obrigatorio";
    } else if (einSsa.length < 11) {
      return "Invalido";
    } else if (einSsa.length == 11) {
      if (Validator.cpf(einSsa)) {
        return "CPF invalido";
      }
      return null;
    } else if (einSsa.length > 11 && einSsa.length < 14) {
      return "CNPJ invalido";
    } else if (einSsa.length == 14) {
      if (Validator.cnpj(einSsa)) {
        return "CNPJ invalido";
      }
      return null;
    } else {
      return "Invalido";
    }
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
    } else if (Validator.email(email)) {
      return "Invalido";
    }
    return null;
  }

  formIsValidOk() {
    //clientRepository.saveClient(name, email);
  }
}
