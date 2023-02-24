import 'package:flutter/material.dart';
import 'package:youtube_clone/components.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/video_player/flick_youtube.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.data});
  final dynamic data;

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
          FlickYoutube(data: widget.data),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // title
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.data['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),

                // views
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text(
                    '${widget.data['views']} views • ${widget.data['date']} ',
                    style: const TextStyle(
                      color: Color(0xff6C6C6C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
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
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(widget.data['avatar']),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    title: Text(
                      '${widget.data['author']}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      '${widget.data['subscribers']} subscribers',
                      style: const TextStyle(
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
                                      'https://cdn-brilio-net.akamaized.net/community/2018/12/19/15748/image_1545037500_5c1766bccf125.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 13),

                            // comment text
                            const Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse metus nulla.',
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
                  thumbnail: video[2]['thumbnail'],
                  avatar: video[2]['avatar'],
                  title: video[2]['title'],
                  views: video[2]['views'],
                  date: video[2]['date'],
                ),
                buildVideo(
                  thumbnail: video[1]['thumbnail'],
                  avatar: video[1]['avatar'],
                  title: video[1]['title'],
                  views: video[1]['views'],
                  date: video[1]['date'],
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
