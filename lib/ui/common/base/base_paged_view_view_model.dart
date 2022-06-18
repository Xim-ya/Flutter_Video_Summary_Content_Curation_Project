import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class BasePagedViewViewModel extends GetxController
    with _CompositeDisposableMixin {
  /* PagedView 관련 값 */
  late final List<Widget> screenList;

  int screenIndex = 0; // PageScreen 초기 인덱스 값.

  PageController get pageController =>
      PageController(initialPage: screenIndex, keepPage: true);

  void routePageHandler() {
    pageController.animateToPage(screenIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  /**
   * 네트워크 통신 난발을 막기 위함.
   * API 쏘기 전에 loading(true) 로 lock 걸고 요청. 끝나면 loading(false) 로 lock 풀기
   *
   * [LoadingBarMixin] 쓰면 loading bar 자동으로 띄워줌
   */
  final loading = false.obs;

  /// 2022.04.04 추가 : WidgetsBindingObserver 관련 처리 추가.
  @override
  void onInit() {
    super.onInit();
  }

  /// 2022.04.04 추가 : WidgetsBindingObserver 관련 처리 추가.
  @override
  void onClose() {
    disposeAll();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

mixin _CompositeDisposableMixin {
  /**
   *  ChangeNotifier 모아놓았다가 onClose 에서 일괄적으로 dispose 시켜주기 위함
   * [ChangeNotifier] : PageController, ScrollController, TextEditingController 등등
   */
  final _changeNotifiers =
      CompositeDisposables<ChangeNotifier>(onClear: (e) => e.dispose());

  /**
   * Rx, Stream 리스너들 모아놓았다가 onClose 에서 일괄적으로 cancel 시켜주기 위함
   */
  final _subscriptions =
      CompositeDisposables<StreamSubscription>(onClear: (e) => e.cancel());

  /**
   * ever, debounce 모아놓았다가 onClose 에서 일괄적으로 dispose 시켜주기 위함
   */
  final _workers = CompositeDisposables<Worker>(onClear: (e) => e.dispose());

  void disposeAll() {
    _changeNotifiers.clearAll();
    _subscriptions.clearAll();
  }
}

class CompositeDisposables<T> {
  CompositeDisposables({required this.onClear});

  final _disposables = <T>[];

  final void Function(T) onClear;

  void add(T disposable) => _disposables.add(disposable);

  void clearAll() {
    for (final element in _disposables) {
      onClear(element);
    }
    _disposables.clear();
  }
}

extension DisposableExtension on ChangeNotifier {
  void bindTo(BasePagedViewViewModel viewModel) {
    viewModel._changeNotifiers.add(this);
  }
}

extension StreamSubscriptionExtension on StreamSubscription {
  void bindTo(BasePagedViewViewModel viewModel) {
    viewModel._subscriptions.add(this);
  }
}

extension WorkerExtension on Worker {
  void bindTo(BasePagedViewViewModel viewModel) {
    viewModel._workers.add(this);
  }
}
