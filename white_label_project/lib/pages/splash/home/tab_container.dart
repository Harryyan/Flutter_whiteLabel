import 'package:flutter/material.dart';
import 'package:white_label_project/models/home_entity.dart';

import '../../../constant/constant.dart';
import '../../../data_source/API.dart';
import '../../../data_source/mock_request.dart';
import '../../../widgets/radius_img.dart';
import '../../../widgets/video_widget.dart';

class TabContainer extends StatefulWidget {
  final String name;

  const TabContainer({Key? key, required this.name}) : super(key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  List<Movie> list = [];
  String? name;
  var api = API();

  @override
  void initState() {
    super.initState();

    if (list.isEmpty) {
      fetchAllMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name == 'Tab1') {
      return _loginContainer(context);
    }

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(builder: (BuildContext context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          key: PageStorageKey<String>(widget.name),
          slivers: <Widget>[
            SliverOverlapInjector(
              // This is the flip side of the SliverOverlapAbsorber above.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    ((BuildContext context, int index) {
              return _getContent(list, index);
            }), childCount: list.length)),
          ],
        );
      }),
    );
  }

  void fetchAllMovies() async {
    var request = MockRequest();
    var result = await request.get(API.HOME_PAGE);
    var resultList = result['subjects'];
    list = resultList.map<Movie>((item) => Movie.fromMap(item)).toList();

    setState(() {});
  }

  double singleLineImgHeight = 180.0;
  double contentVideoHeight = 350.0;

  _getItemCenterImg(Movie item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: RadiusImg.get(item.images?.large, null,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
              )),
        ),
        Expanded(
          child:
              RadiusImg.get(item.casts[1].avatars?.medium, null, radius: 0.0),
        ),
        Expanded(
          child: RadiusImg.get(item.casts[2].avatars?.medium, null,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)))),
        )
      ],
    );
  }

  _getContentVideo(int index) {
    if (!mounted) {
      return Container();
    }
    return VideoWidget(
      index == 1 ? Constant.URL_MP4_DEMO_0 : Constant.URL_MP4_DEMO_1,
      showProgressBar: false,
      previewImgUrl: '',
    );
  }

  _loginContainer(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            '${Constant.ASSETS_IMG}ic_new_empty_view_default.png',
            width: 120.0,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
            child: Text(
              'Login and Check',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 35.0, right: 35.0, top: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
            ),
            onTap: () {
              // MyRouter.push(context, MyRouter.searchPage, '...');
            },
          )
        ],
      ),
    );
  }

  Widget _getContent(List<Movie> items, int index) {
    Movie item = items[index];
    bool showVideo = index == 1 || index == 3;

    return Container(
      height: showVideo ? contentVideoHeight : singleLineImgHeight,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(
          left: Constant.MARGIN_LEFT,
          right: Constant.MARGIN_RIGHT,
          top: Constant.MARGIN_RIGHT,
          bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(item.casts[0].avatars?.medium),
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(item.title),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
                child: showVideo
                    ? _getContentVideo(index)
                    : _getItemCenterImg(item)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 15.0, top: showVideo ? 10 : 0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      '${Constant.ASSETS_IMG}ic_vote.png',
                      width: 25.0,
                      height: 25.0,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      '3',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      '${Constant.ASSETS_IMG}ic_notification_tv_calendar_comments.png',
                      width: 20.0,
                      height: 20.0,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      '10',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      '${Constant.ASSETS_IMG}ic_status_detail_reshare_icon.png',
                      width: 25.0,
                      height: 25.0,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      '5',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
