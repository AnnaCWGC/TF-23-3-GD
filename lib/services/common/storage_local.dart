import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hcp_test/modules/home/models/daily_model.dart';
import 'package:hcp_test/services/app_core.dart';

class StorageLocal {
  final GetStorage storage = GetStorage(AppCoreUrl.storageLocal);
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<String> readSecureStorage(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  Future<void> writeSecureStorage(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
}
