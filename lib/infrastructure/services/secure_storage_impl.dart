import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/secure_storage.dart';

class SecureStorageImpl implements ISecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl() : _storage = FlutterSecureStorage();

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const IOSOptions _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  AndroidOptions? get _android => Platform.isAndroid ? _androidOptions : null;
  IOSOptions? get _ios =>
      (Platform.isIOS || Platform.isMacOS) ? _iosOptions : null;

  @override
  Future<void> write(String key, String value) async => await _storage.write(
    key: key,
    value: value,
    aOptions: _android,
    iOptions: _ios,
  );

  @override
  Future<String?> read(String key) async =>
      await _storage.read(key: key, aOptions: _android, iOptions: _ios);

  @override
  Future<void> delete(String key) async =>
      await _storage.delete(key: key, aOptions: _android, iOptions: _ios);

  @override
  Future<void> clear() async =>
      await _storage.deleteAll(aOptions: _android, iOptions: _ios);
}
