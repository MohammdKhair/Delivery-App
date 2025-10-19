// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/function/checkinternet.dart';

import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    // try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.statusCode);
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    // } catch (_) {
    //   return const Left(StatusRequest.serverException);
    // }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        if (response.statusCode == 200) {
          print(response.statusCode);
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
