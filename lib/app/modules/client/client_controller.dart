import 'package:mobx/mobx.dart';

import '../../models/client_model.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {

  var clientModel = ClientModel();

}