import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/local_storage/secure_storage/secure_storage.dart';

@module
abstract class CoreModules {
  FlutterSecureStorage getFlutterSecureStorage() => FlutterSecureStorage(aOptions: SecureStorageImpl.androidOptions());
}
