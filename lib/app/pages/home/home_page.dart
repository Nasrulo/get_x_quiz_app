import 'package:bmi_calculator/app/pages/home/controller.dart';
import 'package:bmi_calculator/app/pages/rezult/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/calculate_widget.dart';
import '../widgets/gender_container_widget.dart';
import '../widgets/weight_age_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff211834),
      appBar: AppBar(
        backgroundColor: Color(0xff211834),
        title: Center(child: Text('Bmi Calcultar')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderContainerWidget(
                  tus: _homeController.maleColor.value,
                  onTap: () => _homeController.changeMaleColor(),
                  title: 'Male',
                  icon: Icons.male,
                ),
                SizedBox(
                  width: 20,
                ),
                GenderContainerWidget(
                  tus: _homeController.femaleColor.value,
                  onTap: () => _homeController.changeFemaleColor(),
                  title: 'FeMale',
                  icon: Icons.female,
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _homeController.heightValue.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    max: 220,
                    min: 70,
                    value: _homeController.heightValue.value,
                    thumbColor: Colors.red,
                    onChanged: (adanJildirdy) {
                      _homeController.heightValue.value = adanJildirdy;
                    },
                  ),
                ],
              ),
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeightAgeWidget(
                    tag1: '3',
                    tag2: '4',
                    title: 'Weight',
                    middleTitle: _homeController.weight.value.toString(),
                    remove: () => _homeController.weightMinus(),
                    add: () => _homeController.weightPlus(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  WeightAgeWidget(
                    tag1: '1',
                    tag2: '2',
                    title: 'age',
                    middleTitle: _homeController.age.value.toString(),
                    remove: () => _homeController.ageMinus(),
                    add: () => _homeController.agePlus(),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: CalculateWidget(
        text: 'Calculate',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                height: _homeController.heightValue.value,
                weight: _homeController.weight.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
