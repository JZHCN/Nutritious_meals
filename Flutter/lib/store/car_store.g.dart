// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarStore on CarStoreBase, Store {
  late final _$carListAtom =
      Atom(name: 'CarStoreBase.carList', context: context);

  @override
  List<dynamic> get carList {
    _$carListAtom.reportRead();
    return super.carList;
  }

  @override
  set carList(List<dynamic> value) {
    _$carListAtom.reportWrite(value, super.carList, () {
      super.carList = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: 'CarStoreBase.isSelected', context: context);

  @override
  List<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(List<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$isSelectedAllAtom =
      Atom(name: 'CarStoreBase.isSelectedAll', context: context);

  @override
  bool get isSelectedAll {
    _$isSelectedAllAtom.reportRead();
    return super.isSelectedAll;
  }

  @override
  set isSelectedAll(bool value) {
    _$isSelectedAllAtom.reportWrite(value, super.isSelectedAll, () {
      super.isSelectedAll = value;
    });
  }

  late final _$totalAtom = Atom(name: 'CarStoreBase.total', context: context);

  @override
  List<double> get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(List<double> value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$resTotalAtom =
      Atom(name: 'CarStoreBase.resTotal', context: context);

  @override
  double get resTotal {
    _$resTotalAtom.reportRead();
    return super.resTotal;
  }

  @override
  set resTotal(double value) {
    _$resTotalAtom.reportWrite(value, super.resTotal, () {
      super.resTotal = value;
    });
  }

  late final _$getCarAsyncAsyncAction =
      AsyncAction('CarStoreBase.getCarAsync', context: context);

  @override
  Future<void> getCarAsync(int id) {
    return _$getCarAsyncAsyncAction.run(() => super.getCarAsync(id));
  }

  late final _$setTotalAsyncAction =
      AsyncAction('CarStoreBase.setTotal', context: context);

  @override
  Future setTotal(int quantity, int index) {
    return _$setTotalAsyncAction.run(() => super.setTotal(quantity, index));
  }

  late final _$CarStoreBaseActionController =
      ActionController(name: 'CarStoreBase', context: context);

  @override
  dynamic changeSelectedAll(dynamic value) {
    final _$actionInfo = _$CarStoreBaseActionController.startAction(
        name: 'CarStoreBase.changeSelectedAll');
    try {
      return super.changeSelectedAll(value);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carList: ${carList},
isSelected: ${isSelected},
isSelectedAll: ${isSelectedAll},
total: ${total},
resTotal: ${resTotal}
    ''';
  }
}
