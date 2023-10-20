import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class StorageService extends GetxService {
  static StorageService get() => Get.find();

  late GetStorage box;

  String get languageCode => box.read(StorageKeys.languageCode) ?? "";
  set languageCode(String value) =>
      writeStorage(StorageKeys.languageCode, value);

  String get countryCode => box.read(StorageKeys.countryCode) ?? "";
  set countryCode(String value) => writeStorage(StorageKeys.countryCode, value);

  int get tenantId => box.read(StorageKeys.tenantId) ?? 0;
  set tenantId(int value) => writeStorage(StorageKeys.tenantId, value);

  String get tenant => box.read(StorageKeys.tenant) ?? "";
  set tenant(String value) => writeStorage(StorageKeys.tenant, value);

  String get token => box.read(StorageKeys.token) ?? "";
  set token(String value) => writeStorage(StorageKeys.token, value);

  String get lang => box.read(StorageKeys.lang) ?? "tr";
  set lang(String value) => writeStorage(StorageKeys.lang, value);

  String get endPoint => box.read(StorageKeys.endPoint) ?? "";
  set endPoint(String value) => writeStorage(StorageKeys.endPoint, value);

  String get country => box.read(StorageKeys.country) ?? "";
  set country(String value) => writeStorage(StorageKeys.country, value);

  String get logoUrl => box.read(StorageKeys.logoUrl) ?? "";
  set logoUrl(String value) => writeStorage(StorageKeys.logoUrl, value);

  String get version => box.read(StorageKeys.version) ?? "";
  set version(String value) => writeStorage(StorageKeys.version, value);

  int get userId => box.read(StorageKeys.userId) ?? 0;
  set userId(int value) => writeStorage(StorageKeys.userId, value);

  int get clientId => box.read(StorageKeys.clientId) ?? 0;
  set clientId(int value) => writeStorage(StorageKeys.clientId, value);

  String get userName => box.read(StorageKeys.userName) ?? "";
  set userName(String value) => writeStorage(StorageKeys.userName, value);

  int get companyId => box.read(StorageKeys.companyId) ?? 0;
  set companyId(int value) => writeStorage(StorageKeys.companyId, value);

  String get company => box.read(StorageKeys.company) ?? "";
  set company(String value) => writeStorage(StorageKeys.company, value);

  int get departmentId => box.read(StorageKeys.departmentId) ?? 0;
  set departmentId(int value) => writeStorage(StorageKeys.departmentId, value);

  String get department => box.read(StorageKeys.department) ?? "";
  set department(String value) => writeStorage(StorageKeys.department, value);

  String get departmentGroup => box.read(StorageKeys.departmentGroup) ?? "";
  set departmentGroup(String value) =>
      writeStorage(StorageKeys.departmentGroup, value);

  String get registerId => box.read(StorageKeys.registerId) ?? "";
  set registerId(String value) => writeStorage(StorageKeys.registerId, value);

  String get email => box.read(StorageKeys.email) ?? "";
  set email(String value) => writeStorage(StorageKeys.email, value);

  String get picture => box.read(StorageKeys.picture) ?? "";
  set picture(String value) => writeStorage(StorageKeys.picture, value);

  String get allowNotification =>
      box.read(StorageKeys.allowNotification) ?? "true";
  set allowNotification(String value) =>
      writeStorage(StorageKeys.allowNotification, value);

  bool get darkTheme => box.read(StorageKeys.darkTheme) ?? false;
  set darkTheme(bool value) => writeStorage(StorageKeys.darkTheme, value);

  String get dictionary => box.read(StorageKeys.company) ?? "";
  set dictionary(String value) => writeStorage(StorageKeys.dictionary, value);

  String get menu => box.read(StorageKeys.menu) ?? "";
  set menu(String value) => writeStorage(StorageKeys.menu, value);

  Future<StorageService> init() async {
    box = GetStorage();

    String? savedLanguageCode = box.read(StorageKeys.languageCode);

    if (savedLanguageCode == "" || savedLanguageCode == null) {
      var deviceLocale = Get.deviceLocale;
      if (deviceLocale != null) {
        languageCode = deviceLocale.languageCode;
        countryCode = deviceLocale.countryCode ?? "";
      } else {
        languageCode = "en";
        countryCode = "GB";
      }
    }

    box.listenKey("languageCode", (value) {
      updateLocale(value.toLowerCase());
    });
    return this;
    // box = GetStorage();
    // await box.initStorage;

    // writeStorage("tenantId", 1);
    // writeStorage("companyId", 1);

    // findAppLocale();

    // languageCode = box.read(StorageKeys.lang);
    // countryCode = box.read(StorageKeys.country);

    // //initializeDateFormatting(Get.locale?.languageCode ?? "en");

    // box.listenKey("lang", (value) {
    //   //initializeDateFormatting(Get.locale?.languageCode ?? "en");
    //   languageCode = value.toLowerCase();
    //   updateLocale(value.toLowerCase());
    // });
    // return this;
  }

  void writeStorage(String key, dynamic value) {
    //if (value != null)
    box.write(key, value);
  }

  readStorage(String key) => box.read(key);

  void deleteStorage(String key) => box.remove(key);

  void clearStorage() => box.erase();

  Future findAppLocale() async {
    // Get.deviceLocale with problem in iOS
    // Not return countryCode, only return languageCode
    // On the first load of the Application
    // (flutter problem, not GetX)
    final String? appLocale = readStorage("lang");
    if (appLocale == "" || appLocale == null) {
      var deviceLocale = Get.deviceLocale;
      if (deviceLocale!.languageCode == "tr") {
        writeStorage(StorageKeys.lang, "tr");
      } else {
        writeStorage(StorageKeys.lang, "en");
      }
    }
  }

  String userLocale() {
    String? userLocale = readStorage(StorageKeys.lang);
    if (userLocale == null) {
      return readStorage(StorageKeys.lang).toString();
    } else {
      return userLocale;
    }
  }

  void updateLocale(String locale) async {
    if (locale.toLowerCase() == "tr") {
      countryCode = "TR";
    } else if (locale.toLowerCase() == "de") {
      countryCode = "DE";
    } else if (locale.toLowerCase() == "ru") {
      countryCode = "RU";
    } else {
      countryCode = "GB";
    }
    Get.updateLocale(Locale(languageCode, countryCode));
    Intl.defaultLocale = "${languageCode}_$countryCode";
    Get.offAllNamed("/");
  }
}

// storage keys.
abstract class StorageKeys {
  static const String tenantId = "tenantId";
  static const String tenant = "tenant";
  static const String token = "token";
  static const String lang = "lang";
  static const String endPoint = "endPoint";
  static const String country = "country";
  static const String logoUrl = "logoUrl";
  static const String languageCode = "languageCode";
  static const String countryCode = "countryCode";

  static const String registerId = "registerId";
  static const String userId = "userId";
  static const String userName = "userName";
  static const String userCode = "userCode";
  static const String email = "email";
  static const String companyId = "companyId";
  static const String company = "company";
  static const String department = "department";
  static const String departmentId = "departmentId";
  static const String departmentGroup = "departmentGroup";
  static const String picture = "picture";
  static const String version = "version";

  static const String allowNotification = "allowNotification";
  static const String darkTheme = "darkTheme";
  static const String dictionary = "dictionary";
  static const String menu = "menu";

  static const String room = "room";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String clientName = "clientName";
  static const String checkIn = "checkIn";
  static const String checkOut = "checkOut";
  static const String clientId = "clientId";
  static const String ruserId = "ruserId";
  static const String reservationId = "reservationId";
  static const String phone = "phone";
  static const String bdate = "bdate";
  static const String password = "password";
  static const String member = "member";
}
