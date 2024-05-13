import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension MemoryImageExtension on String {
  Uint8List get toBytes => base64Decode(this);
}
