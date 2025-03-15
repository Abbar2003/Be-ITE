// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Courses/Course_page.dart';
import 'package:public_testing_app/src/widgets/TextFormField.dart';

// ignore: must_be_immutable
class AllCourses extends StatelessWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    List img = [
      'Flutter',
      'node',
      'React',
      'c++',
      'laravel',
      'php',
    ];
    List desc = [
      '55 videos',
      '36 videos',
      '45 videos',
      '36 videos',
      '20 videos',
      '25 videos',
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Text(
                    'Courses',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.height - 75) / (4 * 240),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(Course(
                        img: img[index],
                        desc: desc[index],
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Themes.colorScheme.primary),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF5F3FF),
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Image.asset(
                                  'assets/images/${img[index]}.png',
                                  height: 130,
                                  width: 140,
                                )),
                            Text(
                              '${img[index]}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '${desc[index]}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffC1DAF8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    'Hi , Programmer',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Themes.darkColorScheme.primary
                              : Themes.colorScheme.primary,
                          fontSize: MediaQuery.of(context).size.width / 15,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyTextFormField(
                    validate: (value) {
                      return null;
                    },
                    save: (value) {},
                    prefixIcon: const Icon(Iconsax.search_favorite),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
