// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'src/middlewares/is_userLogedIn_Middleware.dart';

import 'package:public_testing_app/src/views/auth/change_pass_screens/change_pass_screen.dart';
import 'package:public_testing_app/src/views/auth/log_in_screens/set_pass_screen.dart';
import 'package:public_testing_app/src/views/auth/log_in_screens/email_screen.dart';
import 'package:public_testing_app/src/views/auth/log_in_screens/login_pass_screen.dart';
import 'package:public_testing_app/src/views/auth/log_in_screens/verfication_screen.dart';
import 'package:public_testing_app/src/views/Introduction/IntroductionScreen.dart';
import 'package:public_testing_app/src/views/src/Home/second_Page/subjects.dart';
import 'package:public_testing_app/src/views/src/Home/first_Page/home.dart';
import 'package:public_testing_app/src/views/src/homepage_elements/Drawer_Elements.dart/edit_profile.dart';
import 'package:public_testing_app/src/views/src/Home_Page.dart';

class AppNavigation {
  static String intro = '/IntroductionScreens';
  static String email = '/EmailPageScreen';
  static String login = '/loginPassPageScreen';
  static String register = '/RegisterPassPageScreen';
  static String verify = '/VerificationPageScreen';
  static String homepage = '/StudentHomePageScreen';
  static String reset_pass = '/ChangePassPageScreen';
  static String home = '/Home';
  static String edit_profile = '/EditProfilePageScreen';
  static String subjects = '/SubjectsPageScreen';
  static String GiminiAI = '/Gimini';
  static String Onboard = '/onBoard';
  static String get getInitRoute => intro;

  static List<GetPage> routes = [
    GetPage(
      name: intro,
      page: () => const IntroductionScreens(),
      middlewares: [
        isDoctorMiddleware(),
      ],
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: email,
      page: () => const EmailScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: verify,
      page: () => const VerificationScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: homepage,
      page: () => const HomePage(),
      children: const [],
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: reset_pass,
      page: () => const ChangePassScreen(),
    ),
    GetPage(
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 2),
      name: home,
      page: () => const Home(),
    ),
    GetPage(
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      name: edit_profile,
      page: () => const EditProfile(),
    ),
    GetPage(
      transition: Transition.size,
      transitionDuration: const Duration(seconds: 2),
      name: subjects,
      page: () => Subjects(),
    ),
  ];
}
