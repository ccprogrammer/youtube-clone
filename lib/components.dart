import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/video_screen.dart';

buildScreen({appBar, body}) => NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        appBar,
      ],
      body: body,
    );

buildAppBar({
  required Widget logo,
  required List<Widget> action,
  required Widget explore,
  required List<Widget> category,
}) {
  return SliverAppBar(
    title: logo,
    actions: action,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  explore,
                  ...category,
                  const SizedBox(width: 12),
                ],
              ),
            ),
          )
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
      statusBarColor: Color(0xff121212),
    ),
    automaticallyImplyLeading: false,
  );
}

buildBody({required List<Widget> content}) {
  return ListView(
    padding: EdgeInsets.zero,
    children: content,
  );
}

buildVideo({thumbnail, avatar, title, views, date, video}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: const EdgeInsets.only(bottom: 8),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(
            () => VideoScreen(data: video),
            transition: Transition.noTransition,
          );
        },
        child: Column(
          children: [
            // thumbnail section
            Container(
              height: 215,
              decoration: BoxDecoration(
                color: const Color(0xff3B3B3B),
                image: thumbnail != null
                    ? DecorationImage(
                        image: NetworkImage(
                          thumbnail,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),

            // bottom section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  avatar != null
                      ? Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(avatar),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        )
                      : const SizedBox(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title != null
                            ? Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            date != null || views != null
                                ? Text(
                                    '$views views • $date  ago',
                                    style: const TextStyle(
                                      color: Color(0xff6C6C6C),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  title != null
                      ? const Icon(Icons.more_vert_rounded)
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

buildExplore() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffECECEC),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                buildAction('compass'),
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            margin: const EdgeInsets.only(left: 16),
            child: const VerticalDivider(
              color: Color(0xffCECECE),
              thickness: 1,
              width: 0,
            ),
          ),
        ],
      ),
    );

buildCategory(String text) {
  bool isAll = text == 'All';

  return Container(
    margin: const EdgeInsets.only(right: 4),
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: isAll ? const Color(0xff3B3B3B) : const Color(0xffECECEC),
      border: Border.all(
        color: isAll ? const Color(0xff6C6C6C) : const Color(0xffCECECE),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isAll ? Colors.white : Colors.black,
        fontSize: 12,
      ),
    ),
  );
}

buildShortsTab({required List<Widget> item}) {
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
                ...item,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

buildShorts({thumbnail, title, views}) {
  return Container(
    height: 250,
    width: 150,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: const Color(0xff3B3B3B),
      image: thumbnail != null
          ? DecorationImage(
              image: NetworkImage(thumbnail),
              fit: BoxFit.cover,
            )
          : null,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        thumbnail != null
            ? const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        const Spacer(),
        title != null
            ? Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 1,
                      ),
                    ]),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        views != null
            ? Text(
                views,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}

buildLogo() => Image.asset(
      'assets/icons/icon-logo.png',
      width: 90,
    );

buildAppBarDivider() => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        color: Color(0xffCECECE),
        thickness: 1,
        height: 0,
      ),
    );

buildAction(iconUrl) {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    child: Image.asset(
      'assets/icons/icon-$iconUrl.png',
      width: 24,
    ),
  );
}

buildBottomNavigationBar({required List<Widget> navItem}) {
  return BottomAppBar(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItem,
      ),
    ),
  );
}

buildNavItem({iconUrl, label, isFab = false}) {
  if (isFab) {
    return IconButton(
      iconSize: 40,
      icon: Image.asset(
        'assets/icons/icon-fab.png',
      ),
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      onPressed: () {},
    );
  }
  double height;
  double width;

  if (iconUrl == 'home') {
    height = 20.0;
    width = 20.0;
  } else if (iconUrl == 'shorts-black') {
    height = 26.0;
    width = 28.0;
  } else if (iconUrl == 'library') {
    height = 18.0;
    width = 20.0;
  } else {
    height = 24.0;
    width = 24.0;
  }

  return SizedBox(
    height: 50,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Image.asset(
            'assets/icons/icon-$iconUrl.png',
            height: height,
            width: width,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
