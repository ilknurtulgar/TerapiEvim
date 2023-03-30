import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state/base_state.dart';

class BaseView<T extends GetxController> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.getController,
    required this.onPageBuilder,
    required this.onModelReady,
    this.isPopIncluded = true,
    this.shouldDisposeAndDelete = true,
  }) : super(key: key);
  final T getController;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Function(T model) onModelReady;
  final bool isPopIncluded, shouldDisposeAndDelete;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends GetxController> extends BaseState<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.getController;
    Get.put(model);
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.shouldDisposeAndDelete) {
      model.dispose();
      Get.delete<T>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
