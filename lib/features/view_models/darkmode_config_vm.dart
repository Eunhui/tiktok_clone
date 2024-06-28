import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/models/darkmode_config_model.dart';
import 'package:threads/features/repos/darkmode_config_config.dart';

class DarkmodeConfigVm extends Notifier<DarkmodeConfigModel> {
  final DarkmodeConfigRepository _repository;

  DarkmodeConfigVm(this._repository);

  void setDark(bool value) {
    _repository.setDark(value);
    state = DarkmodeConfigModel(
      isdark: value,
    );
  }

  @override
  DarkmodeConfigModel build() {
    return DarkmodeConfigModel(
      isdark: _repository.isDark(),
    );
  }
}

final darkmodeConfigProvider =
    NotifierProvider<DarkmodeConfigVm, DarkmodeConfigModel>(
  () => throw UnimplementedError(),
);
