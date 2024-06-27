import 'package:flutter/material.dart';
import 'package:threads/features/models/darkmode_config_model.dart';
import 'package:threads/features/repos/darkmode_config_config.dart';

class DarkmodeConfigVm extends ChangeNotifier {
  final DarkmodeConfigRepository _repository;

  late final DarkmodeConfigModel _model = DarkmodeConfigModel(
    isdark: _repository.isDark(),
  );

  DarkmodeConfigVm(this._repository);

  void setDark(bool value) {
    _repository.setDark(value);
    _model.isdark = value;
    notifyListeners();
    print("DARK IS NOW $value");
  }

  bool get Dark => _model.isdark;
}
