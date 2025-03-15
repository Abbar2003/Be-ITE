// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:public_testing_app/src/views/src/Courses/vedioeSection.dart';
import 'package:public_testing_app/src/widgets/Material.dart';

// ignore: must_be_immutable
class Course extends StatelessWidget {
  Course({
    super.key,
    required this.img,
    required this.desc,
  });

  bool isVid = true;
  final String img;
  final String desc;
  List subtitle = [
    '22 min 50 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
  ];
  List videos = [
    'introducton to flutter',
    'basics in flutter',
    'widgets in flutter',
    'state less  widget',
    'state full widget',
    'layout in flutter',
    'design in flutter',
    'animations in flutter',
    'navigation in flutter',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          img,
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/$img.png'),
              ),
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 45,
                  color: Color(0xff674AEF),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '$img complete course',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            desc,
            style:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyMaterial(
                  text: 'Videos',
                  isVideosSeecton: true,
                ),
                MyMaterial(text: 'discryption', isVideosSeecton: false),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          VideoSection(),
        ]),
      ),
    );
  }
}
