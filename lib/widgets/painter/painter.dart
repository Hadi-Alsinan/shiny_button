import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shine_button/providers/painter_provider.dart';
import 'package:shine_button/utils/painter/painter_utils.dart';
import 'package:shine_button/utils/painter/painter_controller.dart';
import 'package:shine_button/constants/constants.dart';

class Painter extends ConsumerStatefulWidget {
  const Painter({super.key});

  @override
  ConsumerState<Painter> createState() => _PainterState();
}

class _PainterState extends ConsumerState<Painter> {

  @override
  Widget build(BuildContext context) {
    var sumdgePoints = ref.watch(painterStateProvider);
    return GestureDetector(
      onTapDown: onTapDown,
      // onPanUpdate: onPanUpdate,
      // onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size(compnentWidth, compnentHeight),
          painter: SumdgePainter(
            points: sumdgePoints,
          ),
        ),
      ),
    );
  }

  void onTapDown(TapDownDetails details) {
    
    print('User has tapped down');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    ref.read(painterStateProvider.notifier).state = [
      ...ref.read(painterStateProvider),
      point
    ];
    print(point);
  }
}
