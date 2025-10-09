import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_flutter/pages/tab_page.dart';
import 'package:wan_flutter/pages/web_view_page.dart';

// 路由管理类
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(TabPage());
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: "首页跳转测试"));
    }
    return pageRoute(
      Scaffold(
        body: SafeArea(child: Center(child: Text("路由： ${settings.name} 不存在"))),
      ),
    );
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

// 路由地址
class RoutePath {
  // 首页
  static const String tab = "/";

  // 网页页面
  static const String webViewPage = "/web_view_page";
}
