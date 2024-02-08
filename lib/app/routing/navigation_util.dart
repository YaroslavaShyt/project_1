import 'package:flutter/material.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';

class NavigationUtil implements INavigationUtil {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  // TODO: implement canPop
  bool get canPop => throw UnimplementedError();

  @override
  void navigateBack({data}) {
    // TODO: implement navigateBack
  }

  @override
  void navigateBackToStart() {
    // TODO: implement navigateBackToStart
  }

  @override
  void navigateBackUntilNamed(String named) {
    // TODO: implement navigateBackUntilNamed
  }

  @override
  Future<dynamic> navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  }) {
    throw UnimplementedError();
  }



  @override
  Future navigateToAndMakeRoot<T extends Object?>(String routeName, {data}) {
    // TODO: implement navigateToAndMakeRoot
    throw UnimplementedError();
  }

  @override
  Future navigateToAndReplace<T extends Object?>(String routeName, {data}) {
    // TODO: implement navigateToAndReplace
    throw UnimplementedError();
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
