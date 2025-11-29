import 'package:flutter_core/core/models/boot_load.dart';

class AppEntity {
  final BootLoad bootLoad;

  AppEntity(this.bootLoad);

  @override
  String toString() {
    return 'AppEntity{bootLoad: $bootLoad}';
  }
}
