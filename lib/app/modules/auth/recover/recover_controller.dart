import 'package:mobx/mobx.dart';

part 'recover_controller.g.dart';

class RecoverController = _RecoverBase with _$RecoverController;

abstract class _RecoverBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
