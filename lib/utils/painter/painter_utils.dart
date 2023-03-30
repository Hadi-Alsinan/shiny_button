
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shine_button/providers/painter_provider.dart';

class PainterUtils {
  final BuildContext context;
  final WidgetRef ref;
  const PainterUtils({required this.context, required this.ref});
  // a function that will be called when the user taps down on the button that gets the offset points ands add it in the painterStateProvider
  void onTapDown(TapDownDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    ref.read(PainterWidgetProvider.painterStateProvider.notifier).state = [
      ...ref.read(PainterWidgetProvider.painterStateProvider),
      point
    ];
    print(point);
  }
}
