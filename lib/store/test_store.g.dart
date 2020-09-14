// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestStore on _TestStore, Store {
  final _$isShowLoadingAtom = Atom(name: '_TestStore.isShowLoading');

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  final _$_TestStoreActionController = ActionController(name: '_TestStore');

  @override
  void clickCategories(int index) {
    final _$actionInfo = _$_TestStoreActionController.startAction(
        name: '_TestStore.clickCategories');
    try {
      return super.clickCategories(index);
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading}
    ''';
  }
}
