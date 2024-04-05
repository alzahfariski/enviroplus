import 'package:enviroplus/utils/permissions/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:enviroplus/app.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(PermissionManager());
  runApp(const App());
}
