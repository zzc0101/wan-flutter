import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebViewPage extends StatefulWidget {
  String? title;

  WebViewPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String? name;

  /// 在build之前的生命周期
  @override
  void initState() {
    super.initState();

    // 组件初始化完成后获取路由参数
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        name = map["name"];
        // 该方法用于刷新状态数据，如果使用了  StatelessWidget 则无法使用 setState()
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? "")),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(width: 200.w, height: 50.h, child: Text("返回")),
          ),
        ),
      ),
    );
  }
}
