import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video_player/video_player.dart';
import 'package:animate_do/animate_do.dart';

class TravelHome extends StatefulWidget {
  const TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  late PageController _pageController;
  int totalPage = 3;
  List<DocumentSnapshot> screens = [];
  bool isLoading = true;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance
        .collection('onboarding')
        .get()
        .then((snapshot) {
      setState(() {
        screens = snapshot.docs;
        totalPage = screens.length;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: screens.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = screens[index].data() as Map<String, dynamic>;
                    return Screen(
                      videoUrl: data['video_url'],
                      title: data['title'],
                      location: data['location'],
                      description: data['description'],
                      page: index + 1,
                      totalPage: totalPage,
                    );
                  },
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  left: 30,
                  child: currentPage == totalPage - 1
                      ? _buildGetStartedButton()
                      : _buildNextAndSkipButtons(),
                ),
              ],
            ),
    );
  }

  Widget _buildGetStartedButton() {
    return Container(
      height: 60,
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Align(
        child: Text(
          'Get Started',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildNextAndSkipButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            _pageController.jumpToPage(totalPage - 1); // Skip to last page
          },
          child: const Text('Skip', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            ); // Go to next page
          },
          child: const Text('Next', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class Screen extends StatelessWidget {
  final String videoUrl;
  final String title;
  final String location;
  final String description;
  final int page;
  final int totalPage;

  const Screen({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.location,
    required this.description,
    required this.page,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoBackground(videoUrl: videoUrl),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.3, 0.9],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      page.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/$totalPage',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 1200),
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FadeInUp(
                        delay: const Duration(milliseconds: 1400),
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 1200),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              location,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          child: Text(
                            description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoBackground extends StatefulWidget {
  final String videoUrl;

  const VideoBackground({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
