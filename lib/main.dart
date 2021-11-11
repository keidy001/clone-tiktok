import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'tiktok',
        debugShowCheckedModeBanner: false,
        home: MyStatefulWidget());
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HommePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/tiktok_add.png',
              height: 25,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Inbox',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HommePage extends StatelessWidget {
  HommePage({Key? key}) : super(key: key);
  final List<Map> tiktokdata = [
    {
      "video": "assets/videos/video1.mp4",
    },
    {
      "video": "assets/videos/video2.mp4",
    },
    {
      "video": "assets/videos/video3.mp4",
    },
    {
      "video": "assets/videos/video4.mp4",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        scrollDirection: Axis.vertical,
        viewportFraction: 1.0,
      ),
      items: tiktokdata.map((con) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: Color(0xFF141518),
              child: Stack(
                children: [videoContent(linkVideo: con['video']), supContent()],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class videoContent extends StatefulWidget {
  const videoContent({Key? key, required this.linkVideo}) : super(key: key);
  final String linkVideo;
  @override
  _videoContentState createState() => _videoContentState(this.linkVideo);
}

class _videoContentState extends State<videoContent> {
  late VideoPlayerController _controller;
  final String linkVideo;

  _videoContentState(this.linkVideo);
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(linkVideo)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class supContent extends StatelessWidget {
  const supContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 40),
          //color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Following',
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'For you',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  //color: Colors.black.withOpacity(0.1),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '@TpTiktokTest_115',
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'No great gift has man to lay down his life love',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Original Sound - extremesports_95',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 80,
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'assets/images/tiktok_icon.png',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '25.0K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '156',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            MdiIcons.share,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '123',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedLogo(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage("assets/images/disc_icon.png"),
          ),
        ),
        child: Image.asset('assets/images/tiktok_icon.png'),
      ),
    );
  }
}
