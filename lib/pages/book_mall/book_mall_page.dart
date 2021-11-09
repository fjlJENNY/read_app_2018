import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
import 'package:read_app_2018/utils/webview_navigation.dart';

// # 商城

class BookMall extends StatefulWidget {
  BookMall({Key? key}) : super(key: key);

  @override
  _BookMallState createState() => _BookMallState();
}

class _BookMallState extends State<BookMall> {
  List<ImageSwiper> imageSwiperList = [];
  List<NavModel> navModelList = [];

  @override
  void initState() {
    super.initState();

    imageSwiperList = [
      ImageSwiper(
          title: 'swiper-1',
          type: 1,
          image:
              'https://cdn-obs-question.aegis-info.com/mall/newspaper/20211105_dab20fce-96be-4cd3-b6de-f10c5dcfe863.png',
          url: 'https://juejin.cn/post/6844903791427321863'),
      ImageSwiper(
          title: 'swiper-2',
          type: 1,
          image:
              'https://cdn-obs-question.aegis-info.com/mall/static/image/main_banner/20210630/合同审查@3x.png',
          url: 'https://juejin.cn/post/6844903792006135821'),
      ImageSwiper(
          title: 'swiper-3',
          type: 1,
          image:
              'https://cdn-obs-question.aegis-info.com/mall/newspaper/20211025_e71dcd09-7df1-4d13-a0f1-31cc60366d95.png',
          url: 'https://juejin.cn/post/6844903794703073287'),
    ];

    navModelList = [
      NavModel(
          image: 'access_alarm',
          type: 1,
          url: 'app://Leaderboard',
          title: "排行"),
      NavModel(
          image: 'access_alarm', type: 1, url: 'app://HotBoard', title: "热门"),
      NavModel(
          image: 'access_alarm', type: 1, url: 'app://NewBoard', title: "最新"),
      NavModel(
          image: 'access_alarm', type: 1, url: 'app://FullDone', title: "完结"),
      NavModel(
          image: 'access_alarm',
          type: 1,
          url: 'app://FemaleWatch',
          title: "女生"),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ListView(
          children: [
            _buildSwiperContainer(),
            _buildNavArea(),
          ],
        ),
      ),
    );
  }

  // 导航页
  Widget _buildNavArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navModelList.map(
          (NavModel navModel) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (navModel.type == 1) {
                    H5Page.navToWebview(
                      context,
                      url: navModel.url,
                      title: navModel.title,
                    );
                  }
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: _buildNavItem(navModel),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildNavItem(NavModel nav) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          IconData(0xeeaf, fontFamily: 'MaterialIcons'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(nav.title),
        ),
      ],
    );
  }

  // swiper
  Widget _buildSwiperContainer() {
    return SizedBox(
      height: 120,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(imageSwiperList[index].image, fit: BoxFit.fill);
        },
        itemCount: imageSwiperList.length,
        autoplay: true,
        autoplayDelay: 5000,
        duration: 5000,
        pagination: SwiperPagination(),
        onTap: (int index) {
          // 跳转到 webview
          if (imageSwiperList[index].type == 1) {
            H5Page.navToWebview(
              context,
              url: imageSwiperList[index].url,
              title: imageSwiperList[index].title,
            );
          }
        },
      ),
    );
  }
}

//  image = swiper
class ImageSwiper {
  ImageSwiper({
    required this.image,
    required this.type,
    required this.url,
    required this.title,
  });
  final String image;
  final int type;
  final String url;
  final String title;
}

class NavModel {
  NavModel({
    required this.image,
    required this.type,
    required this.url,
    required this.title,
  });
  final String image;
  final int type;
  final String url;
  final String title;
}
