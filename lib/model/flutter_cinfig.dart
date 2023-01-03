import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseConfig with ChangeNotifier {

  FirebaseConfig(){
    // _init();
  }
  init() async {
    if (_config != null) {
      return;
    }
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    _config = remoteConfig;
    await remoteConfig.fetchAndActivate();
    notifyListeners();
  }
  static FirebaseRemoteConfig? _config;

  FirebaseRemoteConfig? get firebase => _config;

}