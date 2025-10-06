import 'package:dio/dio.dart';
import 'package:wan_flutter/http/dio_instance.dart';
import 'package:wan_flutter/repository/datas/home_banner_data.dart';
import 'package:wan_flutter/repository/datas/home_list_data.dart';

class Api {
  static Api instance = Api._();

  Api._();

  // async 表示当前函数为异步
  /// 获取首页 Banner 数据
  Future<List<HomeBannerData?>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    return bannerData.bannerList;
  }

  /// 获取首页文章列表
  Future<List<HomeListItemData>?> getHomeList() async {
    Response response = await DioInstance.instance().get(
      path: 'article/list/1/json',
    );
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  /// 获取首页置顶数据
  Future<List<HomeListItemData>?> getHomeTopList() async {
    Response response = await DioInstance.instance().get(
      path: 'article/top/json',
    );
    HomeTopListData homeTopData = HomeTopListData.fromJson(response.data);
    return homeTopData.topList;
  }
}
