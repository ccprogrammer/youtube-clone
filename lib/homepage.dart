import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/components.dart';
import 'package:youtube_clone/data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var category = DB.category;
  var barIcon = DB.barIcon;
  var video = DB.video;
  var shorts = DB.shorts;
  var nav = DB.nav;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: buildScreen(
        appBar: buildAppBar(
          logo: buildLogo(),
          action: [
            buildAction('screenshare'),
            buildAction('notif'),
            buildAction('search'),
            buildAction('avatar'),
          ],
          explore: buildExplore(),
          category: [
            buildCategory('All'),
            for (var item in category) buildCategory(item),
          ],
        ),
        body: buildBody(
          content: [
            buildVideo(
              thumbnail: video[0]['thumbnail'],
              title: video[0]['title'],
              avatar: video[0]['avatar'],
              date: video[0]['date'],
              views: video[0]['views'],
              video: video[0],
            ),
            buildVideo(
              thumbnail: video[1]['thumbnail'],
              title: video[1]['title'],
              avatar: video[1]['avatar'],
              date: video[1]['date'],
              views: video[1]['views'],
              video: video[1],
            ),
            buildShortsTab(
              item: [
                buildShorts(
                  thumbnail: shorts[0]['thumbnail'],
                  title: shorts[0]['title'],
                  views: shorts[0]['views'],
                ),
                buildShorts(
                  thumbnail: shorts[1]['thumbnail'],
                  title: shorts[1]['title'],
                  views: shorts[1]['views'],
                ),
                buildShorts(
                  thumbnail: shorts[2]['thumbnail'],
                  title: shorts[2]['title'],
                  views: shorts[2]['views'],
                ),
              ],
            ),
            buildVideo(
              thumbnail: video[2]['thumbnail'],
              title: video[2]['title'],
              avatar: video[2]['avatar'],
              date: video[2]['date'],
              views: video[2]['views'],
              video: video[2],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(
        navItem: [
          buildNavItem(iconUrl: nav[0]['iconUrl'], label: nav[0]['label']),
          buildNavItem(iconUrl: nav[1]['iconUrl'], label: nav[1]['label']),
          buildNavItem(isFab: true),
          buildNavItem(iconUrl: nav[2]['iconUrl'], label: nav[2]['label']),
          buildNavItem(iconUrl: nav[3]['iconUrl'], label: nav[3]['label']),
        ],
      ),
    );
  }
}
