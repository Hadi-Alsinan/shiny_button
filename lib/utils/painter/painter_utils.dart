import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void onTapDown(BuildContext context, TapDownDetails details) {
  print('User has tapped down');
  final box = context.findRenderObject() as RenderBox;
  final point = box.globalToLocal(details.globalPosition);
  print(point);
}
