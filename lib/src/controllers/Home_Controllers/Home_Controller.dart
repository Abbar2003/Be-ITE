// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/views/src/Home/fourth_Page/FilesTypes.dart';
import 'package:public_testing_app/src/views/src/Home/second_Page/subjects.dart';

import '../../views/src/Home/third_Page/subjectType.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //? Data for Viewing page :
  ScrollController scrollController = ScrollController();
  List<String> years = ['First Year', 'Second Year', 'Third Year'];
  List<String> photo_paths_of_years = [
    'assets/images/data-scientist.png',
    'assets/images/engineer.png',
    'assets/images/coordinator.png'
  ];
  List<String> numbers_of_years = ['1.', '2.', '3.'];

  //? recent files :
  List<File> recentFiles = [];

  //? THeoritical SUBJECTS and DOCTORS  names :
  List<String> name_of_th_subjects = [];
  List<List<dynamic>> doctors_theoritical = [];

  //? Practical SUBJECTS and DOCTORS  names :
  List<String> name_of_pr_subjects = [];
  List<String> doctor_practical = [];

  //? circle indicaters :
  Widget? circleAddMySubject;
  Widget? circleViewSubject;
  Widget? circleViewFilesTypes;

  // this function for fetching the subjects :
  void viewSubjectsOfTheYear(int yearNumber) async {
    // update the button to CircularProgressIndicator while fetching data :
    circleViewSubject = const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
    update(["viewSubject"]);

    //! send request to server for fetching Theoritical Subjects :
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8000/api/year-subjects-theoretical/$yearNumber');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      List<dynamic> TheoriticalSubjects = decodedResponse["data"];
      // IF the response status are correct we will save the subjects names and its doctors :
      if (decodedResponse["status"] == 200) {
        name_of_th_subjects = [];
        doctors_theoritical = [];
        for (int i = 0; i < TheoriticalSubjects.length; i++) {
          final Map<String, dynamic> TH_S = TheoriticalSubjects[i];

          TH_S.forEach(
            (key, value) {
              if (key == "name") {
                name_of_th_subjects.add(value);
              } else if (key == "doctors") {
                doctors_theoritical.add(value);
              }
            },
          );
        }
      } else {
        throw FileNotFoundException(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    //! send request to server for fetching Practical Subjects :
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8000/api/year-subjects-practical/$yearNumber');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      List<dynamic> PracticalSubjects = decodedResponse["data"];

      // IF the response status are correct we will save the subjects names and its teachers :
      if (decodedResponse["status"] == 200) {
        name_of_pr_subjects = [];
        doctor_practical = [];
        for (int i = 0; i < PracticalSubjects.length; i++) {
          final Map<String, dynamic> PR_S = PracticalSubjects[i];

          PR_S.forEach(
            (key, value) {
              if (key == "name") {
                name_of_pr_subjects.add(value);
              } else if (key == "teacher") {
                if (value == null) {
                  doctor_practical.add('');
                } else {
                  doctor_practical.add(value);
                }
              }
            },
          );
        }
      } else {
        throw FileNotFoundException(response.body);
      }
      //disActive the circleViewSubject cause the response are proccessed successfuly :
      circleViewSubject = null;
      update(["viewSubject"]);
      // go to the subjects screen and passing subjects to it :
      Get.to(
        () => Subjects.subject(
          id: yearNumber,
          subjects: name_of_th_subjects,
          years: years,
        ),
      );
      //? save theoritical subjects :
      appData!.setStringList(
          'Subjects_Of_The_Year_Theoritical', name_of_th_subjects);
      //? save theoritical subjects :
      appData!
          .setStringList('Subjects_Of_The_Year_Practical', name_of_pr_subjects);
    } catch (e) {
      log(e.toString());
    }
  }

  // this function for adding the subjects choosed from student to be hisSubjects :
  void addToMySubjects(String subject) {
    // circleAddMySubject = const SizedBox(
    //   width: 25,
    //   height: 25,
    //   child: CircularProgressIndicator(
    //     color: Colors.white,
    //     strokeWidth: 2,
    //   ),
    // );
    // update(["addIcon"]);
  }
  // this function for viewing the theoritical part of the subject and practical part if it is exist :
  void viewSubjectTypes(int index, String subject) {
    final sub_just_th = doctors_theoritical.length - doctor_practical.length;

    String teacher = '';
    List<dynamic> doctors = [];
    for (int i = 0; i < name_of_th_subjects.length; i++) {
      if (subject == name_of_th_subjects[i]) {
        for (int j = 0; j < doctors_theoritical.length; j++) {
          if (j == i) {
            doctors = doctors_theoritical[j];
            break;
          }
        }
        for (int j = 0; j < doctor_practical.length; j++) {
          if (j == (i - sub_just_th)) {
            teacher = doctor_practical[j];
            break;
          }
        }
        break;
      }
      log(doctors_theoritical.toString());
    }
    Get.to(
      () => Subjecttype(
        index: index + 1,
        subjectName: subject,
        teacher: teacher,
        doctors: doctors,
      ),
    );
  }

  // this function to check if the subjects has practical part or not :
  bool isHasPractical(String subjectName) {
    List<String> Practicals =
        appData!.getStringList('Subjects_Of_The_Year_Practical')!;
    if (Practicals.contains(subjectName)) {
      return true;
    }
    return false;
  }

  // this function for viewing fileTypes for the speciefic part of the subject :
  void viewFilesTypes() {
    Get.to(() => const Filestypes());
  }

  // this function for auto scrolling for years cards in home :
  void listenToScrollMoment() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 3 * 10),
          curve: Curves.linear,
        );
      },
    );
  }

  @override
  void onInit() async {
    appData!.setBool('isSeeAll', false);
    listenToScrollMoment();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
