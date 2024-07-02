import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slogan_app/widgets/HomeWidgets/daily_exercises_widgets.dart';

import '../widgets/HomeWidgets/calorie_calculator.dart';
import '../widgets/HomeWidgets/home_page.dart';
import '../widgets/drawer_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isPlaying) {
      _initAudioPlayer();
    }
  }

  void _initAudioPlayer() async {
    await _audioPlayer.setSourceAsset('sounds/See You Again.mp3');
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        _audioPlayer.play(AssetSource('sounds/lovely.mp3'));
      }
    });
    _audioPlayer.play(AssetSource('sounds/See You Again.mp3'));
    setState(() {
      _isPlaying = true;
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const DailyExercisesWidgets(),
    const CalCalculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerWidgets(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "SOLGAN",
          style: TextStyle(
            fontSize: 30,
            color: Colors.green,
            fontFamily: "SpaceMono",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;

          setState(() {});
        },
        selectedLabelStyle: TextStyle(fontSize: 10.sp),
        unselectedLabelStyle: TextStyle(fontSize: 7.sp),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Daily Exercises',
            icon: Icon(
              Icons.sports,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calorie Calculator',
            icon: Icon(
              Icons.calculate_outlined,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
