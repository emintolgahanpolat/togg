import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togg/locator.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext, T, Widget?) builder;
  final Function(T)? onModelReady;

  const BaseView({Key? key, required this.builder, this.onModelReady})
      : super(key: key);
  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  final T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
