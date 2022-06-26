import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  final loading = false.obs;

  /// 2022.04.04 추가 : ViewModel에서 사용하는 데이터를 refresh하는데 쓰이는 함수.
  void refreshData() => {};
}
