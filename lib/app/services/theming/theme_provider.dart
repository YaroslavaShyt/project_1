import 'package:flutter/material.dart';
import 'package:project_1/app/services/local_storage/keys.dart';
import 'package:project_1/app/services/theming/color_schemes.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';

class ThemeProvider extends ChangeNotifier {
  final ILocalStorage _localStorage;
  ThemeData _selectedTheme = light;
  late String _savedTheme;

  ThemeProvider({required ILocalStorage localStorage})
      : _localStorage = localStorage {
    _setTheme();
  }

  Future<void> _setTheme() async {
    await getSavedTheme();
    if (_savedTheme == "true") {
      _selectedTheme = dark;
    } else {
      _selectedTheme = light;
    }
  }

  Future<void> swapTheme() async {
    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await _localStorage.save(keySavedTheme, "false");
    } else {
      _selectedTheme = dark;
      await _localStorage.save(keySavedTheme, "true");
    }
    notifyListeners();
  }

  Future<void> getSavedTheme() async {
    _savedTheme = await _localStorage.read(keySavedTheme);
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
