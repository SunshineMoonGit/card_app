import 'dart:developer';

const String blank = '.                                    ';

void ssPrint(value, String path, [bool route = true]) {
  if (route) {
    log('$path.dart\n$value\n$blank\n ', name: '');
  } else {
    log('$path\n$value\n$blank\n ', name: '');
  }
}
