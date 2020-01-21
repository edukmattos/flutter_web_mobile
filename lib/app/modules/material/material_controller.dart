import 'package:mobx/mobx.dart';

part 'material_controller.g.dart';

class MaterialController = _MaterialBase with _$MaterialController;

abstract class _MaterialBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
