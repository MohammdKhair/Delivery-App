import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppLottie.loading, height: 250, width: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppLottie.offline, height: 250, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppLottie.server, height: 250, width: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppLottie.noData,
                            height: 250, width: 250, repeat: false))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppLottie.loading, height: 250, width: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppLottie.offline, height: 250, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppLottie.server, height: 250, width: 250))
                : widget;
  }
}
