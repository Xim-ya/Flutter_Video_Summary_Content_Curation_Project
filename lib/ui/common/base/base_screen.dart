import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_curation/ui/common/base/base_view_model.dart';

@immutable
abstract class BaseScreen<T extends BaseViewModel> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    return buildScreen(context);
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  Widget buildScreen(BuildContext context);
}
