import 'package:flutter/cupertino.dart';
import 'package:wan_flutter/repository/api.dart';
import 'package:wan_flutter/repository/datas/common_website_data.dart';
import 'package:wan_flutter/repository/datas/search_hot_keys_data.dart';

class HotKeyViewModel with ChangeNotifier {
  List<CommonWebsiteData>? websiteList;

  List<SearchHotKeysData>? keyList;

  /// 获取数据
  Future initData() async {
    getWebsiteList().then((value) {
      getSearchHotKeys().then((value) {
        notifyListeners();
      });
    });
  }

  /// 获取常用网站
  Future getWebsiteList() async {
    websiteList = await Api.instance.getWebsiteList();
    notifyListeners();
  }

  /// 获取搜索热点
  Future getSearchHotKeys() async {
    keyList = await Api.instance.getSearchHotKeys();
    notifyListeners();
  }
}
