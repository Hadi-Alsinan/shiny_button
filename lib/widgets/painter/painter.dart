import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shine_button/providers/painter_provider.dart';
import 'package:shine_button/utils/painter/painter_controller.dart';
import 'package:shine_button/constants/constants.dart';
import 'package:shine_button/utils/painter/painter_utils.dart';

class Painter extends ConsumerStatefulWidget {
  const Painter({super.key});

  @override
  ConsumerState<Painter> createState() => _PainterState();
}

class _PainterState extends ConsumerState<Painter> {
  @override
  Widget build(BuildContext context) {
    var sumdgePoints = ref.watch(PainterWidgetProvider.painterStateProvider);
    return GestureDetector(
      onTapDown: PainterUtils(context: context, ref: ref).onTapDown,
      child: RepaintBoundary(
        child: CustomPaint(
          size: const Size(compnentWidth, compnentHeight),
          painter: SumdgePainter(
            points: sumdgePoints,
          ),
        ),
      ),
    );
  }

}
