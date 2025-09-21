import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:wan_flutter/pages/web_view_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.h,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    color: Colors.lightBlue,
                  );
                },
                itemCount: 3,
                indicatorLayout: PageIndicatorLayout.NONE,
                autoplay: true,
                control: const SwiperControl(),
                // 左右控制
                pagination: const SwiperPagination(), // 底部滚动小圆点
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _listItemView();
                },
                itemCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItemView() {
    // 点击事件有两种实现方式： 1、 GestureDetector 2、InkWell()
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewPage(title: "首页跳转测试",);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        padding: EdgeInsets.only(
          top: 5.h,
          bottom: 5.h,
          left: 10.w,
          right: 10.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.8.r),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    "https://img1.baa.bitautotech.com/dzusergroupfiles/2024/03/20/c104babcd38445e0bab39502edb67ebd.jpg",
                    width: 30.r,
                    height: 30.r,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5.w),
                Text("作者", style: TextStyle(color: Colors.black)),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Text(
                    "2025-09-30",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "置顶",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷",
              style: TextStyle(color: Colors.black, fontSize: 15.sp),
            ),
            Row(
              children: [
                Text(
                  "分类",
                  style: TextStyle(color: Colors.green, fontSize: 12.sp),
                ),
                Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/img_collect_grey.png",
                  width: 30.r,
                  height: 30.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
