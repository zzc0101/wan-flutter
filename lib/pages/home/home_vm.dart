import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan_flutter/repository/api.dart';
import 'package:wan_flutter/repository/datas/home_banner_data.dart';
import 'package:wan_flutter/repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerData?>? bannerList;
  List<HomeListItemData>? listData = [];
  Dio dio = Dio();

  // async 表示当前函数为异步
  /// 获取首页 Banner 数据
  Future getBanner() async {
    List<HomeBannerData?>? list = await Api.instance.getBanner();
    bannerList = list ?? [];
    notifyListeners();
  }

  Future initListData() async {
    await getTopList();
    await getHomeList();
  }

  /// 获取首页文章列表
  Future getHomeList() async {
    List<HomeListItemData>? list = await Api.instance.getHomeList();
    listData?.addAll(list ?? []);
    notifyListeners();
  }

  /// 获取首页置顶数据
  Future getTopList() async {
    List<HomeListItemData>? list = await Api.instance.getHomeTopList();
    listData?.clear();
    listData?.addAll(list ?? []);
  }
}
