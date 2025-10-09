import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wan_flutter/pages/hot_key/hot_key_vm.dart';

class HotKeyPage extends StatefulWidget {
  @override
  State createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<HotKeyPage> {
  HotKeyViewModel viewModel = HotKeyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  // 标题
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 0.5.r, color: Colors.grey),
                        bottom: BorderSide(width: 0.5.r, color: Colors.grey),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 6.h,
                      bottom: 6.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "搜索热词",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Image.asset(
                          "assets/images/icon_search.png",
                          width: 30.r,
                          height: 30.r,
                        ),
                      ],
                    ),
                  ),
                  // 搜索热词列表
                  Consumer<HotKeyViewModel>(
                    builder: (context, vm, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                // 主轴的间距
                                mainAxisSpacing: 8.r,
                                // 最大横幅范围
                                maxCrossAxisExtent: 120.w,
                                // 宽高比
                                childAspectRatio: 3,
                                crossAxisSpacing: 10.r,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5.r,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              child: Text(vm.keyList?[index].name ?? ''),
                            );
                            // return;
                          },
                          itemCount: vm.keyList?.length ?? 0,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
