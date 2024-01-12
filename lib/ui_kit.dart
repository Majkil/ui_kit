library ui_kit;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:go_router/go_router.dart';

import 'dart:math' as math;

import 'package:ui_kit/src/style/styles.dart';

part 'src/widgets/pie_chart.dart';
part 'src/widgets/dashboard_gauges.dart';
part 'src/widgets/buttons.dart';
part 'src/widgets/cards.dart';
part 'src/widgets/tiles.dart';
part 'src/style/style_helpers.dart';
part 'src/widget_helpers/app_painter.dart';
part 'src/widget_helpers/math_helper.dart';
part 'src/widget_helpers/size_helper.dart';
part 'src/widget_helpers/dashboard_painter.dart';
part 'src/widget_helpers/text_helper.dart';
part 'src/setup/config.dart';
part 'wrappers/buttons_wrapper.dart';
part 'wrappers/cards_wrapper.dart';
part 'wrappers/tiles_wrapper.dart';
