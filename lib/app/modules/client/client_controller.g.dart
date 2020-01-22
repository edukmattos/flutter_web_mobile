// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientController on _ClientBase, Store {
  Computed<bool> _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid)).value;

  final _$einSsaAtom = Atom(name: '_ClientBase.einSsa');

  @override
  String get einSsa {
    _$einSsaAtom.context.enforceReadPolicy(_$einSsaAtom);
    _$einSsaAtom.reportObserved();
    return super.einSsa;
  }

  @override
  set einSsa(String value) {
    _$einSsaAtom.context.conditionallyRunInAction(() {
      super.einSsa = value;
      _$einSsaAtom.reportChanged();
    }, _$einSsaAtom, name: '${_$einSsaAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_ClientBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_ClientBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$clientsAtom = Atom(name: '_ClientBase.clients');

  @override
  ObservableFuture<List<ClientModel>> get clients {
    _$clientsAtom.context.enforceReadPolicy(_$clientsAtom);
    _$clientsAtom.reportObserved();
    return super.clients;
  }

  @override
  set clients(ObservableFuture<List<ClientModel>> value) {
    _$clientsAtom.context.conditionallyRunInAction(() {
      super.clients = value;
      _$clientsAtom.reportChanged();
    }, _$clientsAtom, name: '${_$clientsAtom.name}_set');
  }

  final _$_ClientBaseActionController = ActionController(name: '_ClientBase');

  @override
  dynamic changeEinSsa(String value) {
    final _$actionInfo = _$_ClientBaseActionController.startAction();
    try {
      return super.changeEinSsa(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_ClientBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_ClientBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }
}
