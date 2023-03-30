import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state/base_state.dart';

class BaseView<T extends GetxController> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
    this.isPopIncluded = true,
  }) : super(key: key);
  final T viewModel;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Function(T model) onModelReady;
  final Function(T model)? onDispose;
  final bool isPopIncluded;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends GetxController> extends BaseState<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
