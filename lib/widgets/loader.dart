import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

abstract class LoaderArtesanal {
  static void showLoader() {
    showCupertinoDialog(
      context: Get.context!,
      builder: (_) => WillPopScope(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                height: double.infinity,
                color: Colors.grey.shade200.withOpacity(0.1),
              ),
            ),
            const Center(
              child: SpinKitCubeGrid(
                color: Color(0xFF0FDBCA),
                size: 50.0,
                duration: Duration(seconds: 1),
              ),
            ),
          ],
        ),
        onWillPop: () async => false,
      ),
    );
  }

  static closeLoader() {
    Get.back();
  }
}
