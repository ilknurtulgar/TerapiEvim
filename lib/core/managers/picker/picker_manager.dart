import 'package:file_picker/file_picker.dart';

import '../firebase/crashlytics_manager.dart';

part 'i_picker.dart';

part 'picker.dart';

class PickerManager {
  static PickerManager? _instance;

  static PickerManager get instance {
    return _instance ??= PickerManager._init();
  }

  PickerManager._init();

  _IPicker filePicker = _Picker();
}
