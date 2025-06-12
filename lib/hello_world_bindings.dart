import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

import 'package:path/path.dart' as path;


typedef HelloWorldFunc = Pointer<Utf8> Function();
typedef HelloWorld = Pointer<Utf8> Function();

class HelloWorldBindings {
  HelloWorldBindings();

   DynamicLibrary _openLibrary() {
    final executableDir = File(Platform.resolvedExecutable).parent;
    final libraryPath = path.join(
      executableDir.path,
      'Frameworks', // or 'Resources' depending on your Xcode setup
      'libhello_world.dylib',
    );
    print('Trying to open library at: $libraryPath');
    return DynamicLibrary.open(libraryPath);
  }


  String libraryPath = path.join(
      Directory.current.path,
      'macos', 'Runner', 'libhello_world.dylib'
    );

  

  String helloWorld() {
    print('Library Path: $libraryPath');

    // final  _lib = DynamicLibrary.open(libraryPath);
        final _lib = _openLibrary();

    final HelloWorld helloWorld = _lib.lookup<NativeFunction<HelloWorldFunc>>('hello_world').asFunction();

    return helloWorld().toDartString();
  }
}
