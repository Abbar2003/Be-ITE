// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, unused_field

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/src/widgets/ElevatedButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';
import 'package:http/http.dart' as http;
import '../../models/SnackBar.dart';

class DrawersController extends GetxController {
  File? image;
  Uint8List? imageBytes; // Store the image bytes
  final Form_key = GlobalKey<FormState>();
  Widget? circleImage;
  // Called when the user click SAVE for saving changes :
  void SavePhoto() {
    if (Form_key.currentState!.validate()) {
      Form_key.currentState!.save();
      circleImage = const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
      update(['image']);

      if (Auth!.getString('user') == "active_student") {
        _uploadStudentImage();
      } else if (Auth!.getString('user') == "active_doctor") {
        _uploadDoctorImage();
      } else if (Auth!.getString('user') == "active_teacher") {
        _uploadTeacherImage();
      }
    }
  }

  // function called when the student Change his picture and save changes :
  Future<void> _uploadStudentImage() async {
    try {
      if (image == null) {
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-student-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['image']);
        Get.back();
        snackBar sb = snackBar(
          path: 'assets/images/check.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // function called when the Doctor Change his picture and save changes :
  Future<void> _uploadDoctorImage() async {
    try {
      if (image == null) {
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-doctor-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['image']);
        Get.back();
        snackBar sb = snackBar(
          path: 'assets/images/check.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // function called when the Teacher Change his picture and save changes :
  Future<void> _uploadTeacherImage() async {
    try {
      if (image == null) {
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-teacher-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['image']);
        Get.back();
        snackBar sb = snackBar(
          path: 'assets/images/check.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Viewing Bottom Sheet :
  Future PickImageFromSource(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.secondaryContainer
          : Themes.colorScheme.primaryContainer,
      context: context,
      builder: (ctx) => BottomSheet(),
    );
  }

  // function for selecting image from the user device depending on speciefic source :
  void selectImage(ImageSource source) async {
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      image = File(img.path);
      appData!.setString('image', image!.path);
      update(['image']);
    }
  }

  // bottom Sheet to choose image source : (Gallery || Camera):
  Widget BottomSheet() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              indent: Get.mediaQuery.size.width / 2.5,
              endIndent: Get.mediaQuery.size.width / 2.5,
              thickness: 2,
            ),
          ),
          Text(
            'Choose Your Profile Photo',
            style: Get.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyElevetedButton(
                  onTap: () => selectImage(ImageSource.camera),
                  width: 10,
                  height: 20,
                  BackColor: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.onPrimaryContainer
                      : Themes.colorScheme.onSecondaryContainer,
                  widget: Row(
                    children: [
                      Text(
                        'camera',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Iconsax.camera,
                        color: is_Dark!.getString('is_dark') == 'true'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyElevetedButton(
                  onTap: () => selectImage(ImageSource.gallery),
                  width: 10,
                  height: 20,
                  BackColor: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.onPrimaryContainer
                      : Themes.colorScheme.onSecondaryContainer,
                  widget: Row(
                    children: [
                      Text(
                        'gallery',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Iconsax.image,
                        color: is_Dark!.getString('is_dark') == 'true'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onInit() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    if (Auth!.getString("user") == "active_student") {
      getStudentPhoto();
    } else if (Auth!.getString("user") == "active_doctor") {
      getDoctorPhoto();
    } else if (Auth!.getString("user") == "active_teacher") {
      getTeacherPhoto();
    }
    super.onInit();
  }

  void getStudentPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-student-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      String updatedUrl =
          decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
      log(updatedUrl);
      if (decodedResponse["data"] != null) {
        appData!.setString('image', updatedUrl);
      } else {
        appData!.setString('image', 'null');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void getDoctorPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-doctor-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      String updatedUrl =
          decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
      log(updatedUrl);
      if (decodedResponse["data"] != null) {
        appData!.setString('image', updatedUrl);
      } else {
        appData!.setString('image', 'null');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void getTeacherPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-teacher-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      String updatedUrl =
          decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
      log(updatedUrl);
      if (decodedResponse["data"] != null) {
        appData!.setString('image', updatedUrl);
      } else {
        appData!.setString('image', 'null');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
