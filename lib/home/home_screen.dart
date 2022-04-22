import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const d = 1500;
const c = "click.wav";

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;

  var duration = d;
  final player = AudioCache(prefix: "audio/");

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(milliseconds: duration);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            playSound();

            duration = duration~/2;
            if(duration==0) duration = d;
            _animationController.duration = Duration(
                milliseconds: duration
            );
            setState(() {
              _animationController.repeat();
            });
          },
          child: SizedBox(
            height: 250,
            width: 250,
            child: Lottie.asset(
              "asset/domo.json",
              controller: _animationController
            ),
          ),
        ),
      ),
    );
  }

  void playSound(){
    player.play(c);
  }

}
