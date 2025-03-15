// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Home_Controllers/Home_Controller.dart';
import 'package:public_testing_app/src/views/src/Home/third_Page/subjectTypeCard.dart';

import '../../../../../main.dart';
import '../../../../models/Themes.dart';

class Subjecttype extends StatelessWidget {
  const Subjecttype(
      {super.key,
      required this.subjectName,
      required this.index,
      required this.teacher,
      required this.doctors});

  final String teacher;
  final List<dynamic> doctors;
  final String subjectName;
  final int index;

  @override
  Widget build(BuildContext context) {
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);
    final controller = Get.put(HomeController());

    List<Widget> thP = [
      SubjectTypeCard(
        Type: 'Theoritical :',
        Doctors_Names: doctors,
        path: 'assets/images/design.png',
      ),
    ];

    if (controller.isHasPractical(subjectName)) {
      thP = [
        SubjectTypeCard(
          Type: 'Theoritical :',
          Doctors_Names: doctors,
          path: 'assets/images/design.png',
        ),
        const SizedBox(height: 20),
        SubjectTypeCard(
          Type: 'Practical :',
          Doctors_Names: teacher,
          path: 'assets/images/responsibility.png',
        ),
      ];
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background.withOpacity(.9)
            : Colors.white,
        // AppBar decoration:
        appBar: AppBar(
          backgroundColor: is_Dark!.getString('is_dark') == 'true'
              ? Themes.darkColorScheme.background
              : Themes.colorScheme.primaryContainer,
          title: Text(
            '$index. $subjectName',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: width / 20,
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.primary
                      : Themes.colorScheme.primary,
                ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: width,
              height: width / 12,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.green.withGreen(255)
                        : Colors.blue.withBlue(255),
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 1),
                    blurRadius: 7,
                  )
                ],
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Themes.darkColorScheme.background
                    : Themes.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...thP,
          ],
        ),
      ),
    );
  }
}
