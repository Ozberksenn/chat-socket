import 'package:get/get.dart';

class Dictionary extends Translations {
  Map<String, Map<String, String>> map = {
    "tr": {
      "Enter": "Giriş",
    },
    "ru": {
      "Enter": "Giriş", //!
    },
  };

  @override
  Map<String, Map<String, String>> get keys => map;
}
