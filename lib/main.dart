import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_application_1/battery_level_example.dart';
import 'package:flutter_application_1/example.dart';
import 'package:flutter_application_1/hello_world_bindings.dart';
import 'package:flutter_application_1/hwb_example.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final batteryLevel = await BatteryLevelExample.getBatteryLevel();
  // print("Battery Level: $batteryLevel");
  // runApp(const MyApp());

  final helloWorldBindings = HelloWorldBindings();
  
  runApp(HwbExample(helloWorldBindings: helloWorldBindings));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const Example());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => {
        print('${{SchedulerBinding.instance.schedulerPhase}}'),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Labelled Divider Example')),
      body: Column(
        children: [
          Text('Above the Divider'),
          LabeledDivider(
            label: 'Divider Label',
            thickness: 2.0,
            color: Colors.blue,
          ),
          Text('Below the Divider'),
          SizedBox(),
        ],
      ),
    );
  }
}

class LabeledDivider extends LeafRenderObjectWidget {
  final String label;
  final double thickness;
  final Color color;

  const LabeledDivider({
    super.key,
    required this.label,
    this.thickness = 1.0,
    this.color = Colors.black,
  });

  @override
  RenderLabeledDivider createRenderObject(BuildContext context) {
    return RenderLabeledDivider(
      label: label,
      thickness: thickness,
      color: color,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLabeledDivider renderObject,
  ) {
    renderObject
      ..label = label
      ..thickness = thickness
      ..color = color;

    // TODO: implement updateRenderObject
    // super.updateRenderObject(context, renderObject);
  }
}

class RenderLabeledDivider extends RenderBox {
  String _label;
  double _thickness;
  Color _color;
  late TextPainter _textPainter;

  RenderLabeledDivider({
    required String label,
    required double thickness,
    required Color color,
  }) : _label = label,
       _thickness = thickness,
       _color = color {
    _textPainter = TextPainter(textDirection: TextDirection.ltr);
  }

  set label(String value) {
    if (_label != value) {
      _label = value;
      markNeedsLayout();
      markNeedsSemanticsUpdate();
    }
  }

  set thickness(double value) {
    if (_thickness != value) {
      _thickness = value;
      markNeedsLayout();
    }
  }

  set color(Color value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  String get label => _label;

  @override
  void performLayout() {
    _textPainter.text = TextSpan(
      text: _label,
      style: TextStyle(color: _color),
    );
    _textPainter.layout();

    final double textHeight = _textPainter.size.height;
    size = constraints.constrain(
      Size(double.infinity, _thickness + textHeight),
    );
    // super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = _color;
    final double yCenter = offset.dy + size.height / 2;

    // Draw the line
    context.canvas.drawLine(
      offset,
      Offset(offset.dx + size.width, yCenter),
      paint,
    );

    // Draw the text
    final double textStart =
        offset.dx + (size.width - _textPainter.size.width) / 2;

    _textPainter.paint(
      context.canvas,
      Offset(textStart, yCenter - _textPainter.size.height / 2),
    );
    // TODO: implement paint
    super.paint(context, offset);
  }

  @override
  void dispose() {
    layer?.dispose();
    _textPainter.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    // TODO: implement describeSemanticsConfiguration
    super.describeSemanticsConfiguration(config);
    config
      ..isSemanticBoundary = true
      ..label = 'Divider with text: $label';
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    // Check if the incoming position is within the bounds of this render box
    final BoxHitTestEntry entry = BoxHitTestEntry(this, position);

    if (size.contains(position)) {
      result.add(entry);
      print('FL: Tapped');
      return true;
    }
    return false;
    // print('FL: Tapped ${result.toString()}');
    // return super.hitTest(result, position: position);
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    debugPrint('${{SchedulerBinding.instance.schedulerPhase}}');

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() {
            print('${SchedulerBinding.instance.schedulerPhase}');
            scheduleMicrotask(() async {
              debugPrint('1. ${{SchedulerBinding.instance.schedulerPhase}}');
              await Future.delayed(Duration.zero);
              debugPrint('2. ${{SchedulerBinding.instance.schedulerPhase}}');
            });
            setState(() {});
          });

    animation = Tween<double>(begin: 0, end: 500).animate(controller)
      ..addListener(() {});

    // controller.forward();

    SchedulerBinding.instance.addPersistentFrameCallback((_) {
      debugPrint(
        'Current Phase: ${{SchedulerBinding.instance.schedulerPhase}}',
      );
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      debugPrint(
        'Current Phase2: ${{SchedulerBinding.instance.schedulerPhase}}',
      );
    });
  }

  @override
  void dispose() {
    print('${SchedulerBinding.instance.schedulerPhase}');
    print('Disposed');
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          // height: 300,
          // width: 300,
          height: animation.value,
          width: animation.value,
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SecondScreen();
                  },
                ),
                (_) => false,
              );
            },
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
