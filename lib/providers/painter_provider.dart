import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PainterWidgetProvider {
  // a provider that will be used to store the points to render the sumdges
  static final painterStateProvider = StateProvider<List<Offset>>((ref) {
    return <Offset>[];
  });
}
