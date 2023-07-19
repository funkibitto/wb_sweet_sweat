import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utils/logger.dart';

typedef void OnWidgetSizeOffsetChange(Size size, Offset offset);

class WidgetSizeRenderObject extends RenderProxyBox {
  final OnWidgetSizeOffsetChange onChange;
  Size? currentSize;
  Offset? currentOffset;

  WidgetSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();
    logger.d('performLayout');

    Size newSize = child!.size;
    Offset newPos = child!.localToGlobal(Offset.zero);
    // logger.d('newSize ${newSize}');
    if (currentSize != newSize || currentOffset != newPos) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          currentSize = newSize;
          currentOffset = newPos;
          onChange(newSize, newPos);
        },
      );
    }
  }
}

class WidgetSizeOffsetWrapper extends SingleChildRenderObjectWidget {
  final OnWidgetSizeOffsetChange onChange;

  const WidgetSizeOffsetWrapper({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return WidgetSizeRenderObject(onChange);
  }
}
