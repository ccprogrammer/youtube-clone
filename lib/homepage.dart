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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          buildAppBar(),
        ],
        body: buildBody(),
      ),
    );
  }

  buildAppBar() {
    return SliverAppBar(
      title: buildLogo(),
      actions: [
        buildIcon(barIcon[0]),
        buildIcon(barIcon[1]),
        buildIcon(barIcon[2]),
        buildIcon(barIcon[3]),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBarDivider(),
            buildCategoryTab(),
          ],
        ),
      ),
      // -------------------------------------
      elevation: 0,
      backgroundColor: Colors.white,
      floating: true,
      snap: true,
      pinned: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      automaticallyImplyLeading: false,
    );
  }

  buildCategoryTab() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildExplore(title: 'Explore'),

              // divider
              buildCategoryDivider(),

              // category
              buildCategory('All'),
              for (var item in category) buildCategory(item),

              const SizedBox(width: 12),
            ],
          ),
        ),
      );

  buildBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildVideo(
          thumbnail: video[0]['thumbnail'],
          avatar: video[0]['avatar'],
          title: video[0]['title'],
          views: video[0]['views'],
          date: video[0]['date'],
        ),
        buildVideo(
          thumbnail: video[1]['thumbnail'],
          avatar: video[1]['avatar'],
          title: video[1]['title'],
          views: video[1]['views'],
          date: video[1]['date'],
        ),
        buildShortsTab(),
        buildVideo(
          thumbnail: video[2]['thumbnail'],
          avatar: video[2]['avatar'],
          title: video[2]['title'],
          views: video[2]['views'],
          date: video[2]['date'],
        ),
      ],
    );
  }

  buildShortsTab() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shorts title
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/icon-shorts.png',
                  width: 24,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Shorts',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // shorts item
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
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
            ),
          ),
        ],
      ),
    );
  }
}
