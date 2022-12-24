import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
// load the native library

final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open("libnative_opencv.so")
    : DynamicLibrary.process();

// define the native function
typedef _c_version = Pointer<Utf8> Function();
typedef _dart_version = Pointer<Utf8> Function();

// bind the native function
final _version = nativeLib.lookupFunction<_c_version, _dart_version>('version');

class NativeOpenCV {
  static const MethodChannel _channel = const MethodChannel('native_opencv');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  String cvVersion() {
    return _version().toDartString();
  }
}
