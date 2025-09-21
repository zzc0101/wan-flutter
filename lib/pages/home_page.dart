import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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
                itemBuilder: (context, ubdex) {
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
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              "https://img1.baa.bitautotech.com/dzusergroupfiles/2024/03/20/c104babcd38445e0bab39502edb67ebd.jpg",
            width: 30.r,
            height: 30.r,),
            Text("作者"),
            Expanded(child: SizedBox()),
            Text("2025-09-30"),
            Text("置顶"),
          ],
        ),
        Text("保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷保时捷"),

        Row(children: [
          Text("分类"),
        ],)
      ],
    );
  }
}
