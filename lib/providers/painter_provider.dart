import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final painterStateProvider = StateProvider<List<Offset>>((ref) {
  return <Offset>[];
});
