import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                color: Colors.white.withOpacity(.3),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 15.0),
              SizedBox(height: 30.0),
              Text(
                'Loading, please wait..',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
