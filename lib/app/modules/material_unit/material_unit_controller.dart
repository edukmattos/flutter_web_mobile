import 'package:mobx/mobx.dart';

part 'material_unit_controller.g.dart';

class MaterialUnitController = _MaterialUnitBase with _$MaterialUnitController;

abstract class _MaterialUnitBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
