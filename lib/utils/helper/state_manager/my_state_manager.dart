import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// import '../../../config/routes.dart';

// mixin GoRouterStateMixin on GetxController {
//   GoException? get error => router.routerDelegate.currentConfiguration.error;
//   Object? get extra => router.routerDelegate.currentConfiguration.extra;
//   String get fullPath => router.routerDelegate.currentConfiguration.fullPath;
//   String get pathParameter =>
//       router.routerDelegate.currentConfiguration.uri.path;
//   Map<String, String> get queryParameters =>
//       router.routerDelegate.currentConfiguration.uri.queryParameters;
//   Uri? get uri => router.routerDelegate.currentConfiguration.uri;
// }

abstract class BindingInjection<T extends GetxController> extends Widget {
  final Bindings? binding;
  const BindingInjection({
    super.key,
    required this.binding,
  }) : assert(binding != null);
  @protected
  Widget build(BuildContext context);

  @override
  CustomStatelessElement createElement() =>
      CustomStatelessElement<T>(this, binding);
}

class CustomStatelessElement<T extends GetxController>
    extends ComponentElement {
  final Bindings? binding;

  /// Creates an element that uses the given widget as its configuration.
  CustomStatelessElement(BindingInjection super.widget, this.binding);

  @override
  Widget build() => GetBuilder<T>(
      initState: (_) => binding?.dependencies(),
      autoRemove: true,
      builder: (controller) {
        return (widget as BindingInjection).build(this);
      });

  @override
  void update(BindingInjection newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}
