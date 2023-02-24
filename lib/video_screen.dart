import 'package:flutter/material.dart';
import 'package:youtube_clone/components.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/video_player/custom_video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var video = DB.video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AspectRatio(
            aspectRatio: 16 / 9,
            child: CustomVideoPlayer(),
          ),
          Expanded(
            child: ListView(
              children: [
                // title
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: Text(
                          'সীরাহ | রাসূলের ﷺ দেহের বর্ননা, নবুওয়াত ও রিসালাত লাভ, জিব্রাইলের আঃ সাথে সাক্ষাত | পর্ব - ০৪',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),

                // views
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '3,627 views • Premiered Jul 1, 2021 ',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '#shirat @Hzmohummad(s) #islamic',
                          style: TextStyle(
                            color: Color(0xff068BFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // button section
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 28, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildIcon(
                        'assets/icons/icon-like.png',
                        '25.6K',
                      ),
                      buildIcon(
                        'assets/icons/icon-dislike.png',
                        '65',
                      ),
                      buildIcon(
                        'assets/icons/icon-share.png',
                        'Share',
                      ),
                      buildIcon(
                        'assets/icons/icon-download.png',
                        'Download',
                      ),
                      buildIcon(
                        'assets/icons/icon-save.png',
                        'Save',
                        margin: 0.0,
                      ),
                    ],
                  ),
                ),

                // user tile
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffCECECE),
                      ),
                      bottom: BorderSide(
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://yt3.ggpht.com/gFUCcNt3vDqhE01l4anDMf6SWBIoZ1n7VvFfL4xoYblDlx_HI7IkJ3AYikno8XdE_kCaIeUJYQ=s68-c-k-c0x00ffffff-no-rj'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    title: const Text(
                      'Voice of Books',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      '289K subscibe',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff6C6C6C),
                      ),
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text(
                        'SUBSCRIBE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFF0000),
                        ),
                      ),
                    ),
                  ),
                ),

                // comments
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Comments ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '149',
                                    style: TextStyle(
                                      color: Color(0xff6C6C6C),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // avatar
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://yt3.ggpht.com/gFUCcNt3vDqhE01l4anDMf6SWBIoZ1n7VvFfL4xoYblDlx_HI7IkJ3AYikno8XdE_kCaIeUJYQ=s68-c-k-c0x00ffffff-no-rj'),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 13),

                            // comment text
                            const Expanded(
                              child: Text(
                                'জাযাকাল্লাহ ভাইয়া আপনার এই মেহনত আল্লাহ কবুল করুক সম্ভব হলে প্রতিদিন ১টা করে porbo দিয়েন',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // video section
                buildVideo(
                  thumbnail: video[0]['thumbnail'],
                  avatar: video[0]['avatar'],
                  title: video[0]['title'],
                  views: video[0]['views'],
                  date: video[0]['date'],
                ),
                buildVideo(
                  thumbnail: video[2]['thumbnail'],
                  avatar: video[2]['avatar'],
                  title: video[2]['title'],
                  views: video[2]['views'],
                  date: video[2]['date'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildIcon(iconUrl, label, {margin}) => Container(
        margin: EdgeInsets.only(right: margin ?? 36),
        child: Column(
          children: [
            Image.asset(
              iconUrl,
              width: 28,
              height: 28,
            ),
            const SizedBox(height: 4),
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
