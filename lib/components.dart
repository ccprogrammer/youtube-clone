import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/video_screen.dart';

buildVideo({thumbnail, avatar, title, views, date}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: const EdgeInsets.only(bottom: 8),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(
            () => const VideoScreen(),
            transition: Transition.noTransition,
          );
        },
        child: Column(
          children: [
            // thumbnail section
            thumbnail != null
                ? Container(
                    height: 215,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                          thumbnail,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(),
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

buildShorts({thumbnail, title, views}) {
  return Container(
    height: 250,
    width: 150,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: Colors.grey,
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

buildCategoryDivider() => Container(
      height: 20,
      margin: const EdgeInsets.only(right: 16),
      child: const VerticalDivider(
        color: Color(0xffCECECE),
        thickness: 1,
        width: 0,
      ),
    );

buildExplore({title}) => Container(
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
                buildIcon('compass'),
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

buildIcon(iconUrl) {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    child: Image.asset(
      'assets/icons/icon-$iconUrl.png',
      width: 24,
    ),
  );
}
