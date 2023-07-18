import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/utils/translation.dart';

enum LoadingState {
  loading,
  finished,
  error,
}

class LoadingLayout extends StatelessWidget {
  final LoadingState state;
  final Widget child;
  final double? fixedSize;

  const LoadingLayout({
    Key? key,
    required this.state,
    required this.child,
    this.fixedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoadingState.loading:
        return SizedBox(
          height: fixedSize,
          width: fixedSize,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitWave(
                  color: Constants.primaryOrange,
                  size: 20,
                ),
                const SizedBox(height: 8),
                Text(
                  Messages.loading.tr,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        );
      case LoadingState.finished:
        return child;
      case LoadingState.error:
        //TODO 錯誤畫面
        return SizedBox(
          height: fixedSize,
          width: fixedSize,
          child: Center(
            child: Column(
              children: [
                Text(Messages.error.tr),
              ],
            ),
          ),
        );
    }
  }
}
