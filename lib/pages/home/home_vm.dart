import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan_flutter/datas/home_banner_data.dart';
import 'package:wan_flutter/datas/home_list_data.dart';
import 'package:wan_flutter/http/dio_instance.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerItemData>? bannerList;
  List<HomeListItemData>? listData;
  Dio dio = Dio();

  // async 表示当前函数为异步
  /// 获取首页 Banner 数据
  Future getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(response.data);
    if (bannerData.data != null && bannerData.data != null) {
      bannerList = bannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  /// 获取首页文章列表
  Future getHomeList() async {
    Response response = await DioInstance.instance().get(
      path: 'article/list/1/json',
    );
    HomeData homeData = HomeData.fromJson(response.data);
    print(homeData);
    if (homeData.data != null && homeData.data?.datas != null) {
      listData = homeData.data?.datas;
    } else {
      listData = [];
    }
    notifyListeners();
  }
}
