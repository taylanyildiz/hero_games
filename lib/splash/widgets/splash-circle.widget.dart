import 'dart:math';
import 'package:flutter/material.dart';
import '/gen/assets.gen.dart';

class SplashCircle extends StatefulWidget {
  const SplashCircle({
    super.key,
  });

  @override
  State<SplashCircle> createState() => _State();
}

class _State extends State<SplashCircle> with TickerProviderStateMixin {
  late AnimationController scaleAnimController;
  double get scaleValue => scaleAnimController.value;

  late AnimationController shadowAnimController;
  double get shadowAnimValue => shadowAnimController.value;

  @override
  void initState() {
    scaleAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    shadowAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    scaleAnimController.forward().orCancel.then((value) {
      shadowAnimController.repeat();
    });
    super.initState();
  }

  @override
  void dispose() {
    shadowAnimController.dispose();
    scaleAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: shadowAnimController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(Curves.elasticInOut.transform(scaleValue))
                ..rotateZ(
                  pi * .1 * sin(pi * shadowAnimValue),
                ),
              child: child,
            );
          },
          child: const _ShadowCircleBox(),
        ),
        Hero(tag: "logo", child: Assets.images.logo.image(width: 280.0)),
      ],
    );
  }
}

class _ShadowCircleBox extends StatelessWidget {
  const _ShadowCircleBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: .4, color: Colors.orange),
      ),
    );
  }

  List<BoxShadow> get boxShadow => const [
        BoxShadow(
          color: Colors.orange,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        )
      ];
}
