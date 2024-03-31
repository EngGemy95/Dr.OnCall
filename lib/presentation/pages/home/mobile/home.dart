import 'package:dr_on_call/presentation/resource_data/assets_manager.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:dr_on_call/presentation/resource_data/values_managers.dart';
import 'package:dr_on_call/presentation/widgets/custom_avatar.dart';
import 'package:dr_on_call/presentation/widgets/custom_reservation_card.dart';
import 'package:dr_on_call/presentation/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/doctors.dart';
import '../../../../config/route_manager.dart';
import '../../../resource_data/text_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List symptoms = ["Temperature", "Snuffle", "Fever", "Cough", "Cold"];
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg"
  ];

  final doctorsData = [
    DoctorModel(
      name: "Mohamed Gamal Mohamed Elaraby Soliman",
      specialty: 'The Complete Dart Developer Guide',
      img: ImageAssets.doctor1,
      star: 10,
    ),
    DoctorModel(
      name: "Amgad Mahmoud",
      specialty: 'Therapist',
      img: ImageAssets.doctor2,
      star: 2,
    ),
    DoctorModel(
      name: "Esraa",
      specialty: 'The doctor of children',
      img: ImageAssets.doctor3,
      star: 3,
    ),
    DoctorModel(
      name: "Yasser Elsayed",
      specialty: 'Android Developer',
      img: ImageAssets.doctor4,
      star: 5,
    ),
    DoctorModel(
      name: "Ziad Mohamed",
      specialty: 'The Complete Full Stack Developer Guide',
      img: ImageAssets.doctor2,
      star: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    int crossAxisCount = MediaQuery.of(context).size.width ~/ 200;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "Hello Alex",
                      textColor: ColorManager.black,
                      fontSize: AppSize.s25,
                      fontWeight: FontWeight.w500,
                    ),
                    const CircleAvatar(
                      radius: AppSize.s25,
                      backgroundImage: AssetImage(ImageAssets.doctors),
                    ),
                  ],
                ),
              ),
              customSizedBox(heightSize: AppSize.s30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customReservationCard(
                    containerColor: ColorManager.primary,
                    icon: Icon(
                      Icons.add,
                      color: ColorManager.primary,
                      size: AppSize.s35,
                    ),
                    iconColor: ColorManager.primary,
                    iconBackgroundColor: ColorManager.white,
                    textName: "Clinic Visit",
                    textNameColor: ColorManager.white,
                    subText: "Make an appointment",
                    subTextColor: ColorManager.white54,
                  ),
                  customReservationCard(
                    containerColor: ColorManager.white,
                    icon: Icon(
                      Icons.home,
                      color: ColorManager.primary,
                      size: AppSize.s35,
                    ),
                    iconColor: ColorManager.primary,
                    iconBackgroundColor: ColorManager.roseWhite,
                    textName: "Home Visit",
                    textNameColor: ColorManager.black,
                    subText: "Call the doctor home",
                    subTextColor: ColorManager.grey,
                  ),
                ],
              ),
              customSizedBox(heightSize: AppSize.s25),
              customText(
                text: "What are your symptoms ?",
                textColor: ColorManager.black54,
                fontWeight: FontWeight.w500,
                leftPadding: AppPadding.p15,
              ),
              customSizedBox(
                heightSize: AppSize.s70,
                widthSize: double.infinity,
                childWidget: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppMargin.m15, vertical: AppMargin.m10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p25),
                        decoration: BoxDecoration(
                            color: ColorManager.greyWhite,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            boxShadow: const [
                              BoxShadow(
                                color: ColorManager.black12,
                                blurRadius: AppSize.s4,
                                spreadRadius: AppSize.s2,
                              )
                            ]),
                        child: Center(
                          child: Text(
                            symptoms[index],
                            style: const TextStyle(
                              fontSize: AppSize.s16,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.black54,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              customSizedBox(heightSize: AppSize.s15),
              customText(
                text: "Doctors",
                textColor: ColorManager.black54,
                fontWeight: FontWeight.w500,
                leftPadding: AppPadding.p15,
              ),
              GridView.builder(
                padding: const EdgeInsets.all(AppPadding.p0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        RouteGenerator.getRoute(
                            const RouteSettings(name: Routes.appointment)),
                        (route) => false,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(AppMargin.m10),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p15),
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          boxShadow: const [
                            BoxShadow(
                              color: ColorManager.black12,
                              blurRadius: AppSize.s4,
                              spreadRadius: AppSize.s2,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customAvatar(
                              radius: AppSize.s35, imageName: imgs[index]),
                          customSizedBox(heightSize: AppSize.s15),
                          customText(
                            text: "Dr. Doctor Name",
                            textColor: ColorManager.black,
                            fontSize: AppSize.s16,
                            leftPadding: AppPadding.p5,
                            rightPadding: AppPadding.p5,
                            maxLine: 2,
                          ),
                          customText(
                            text: "Therapist",
                            textColor: ColorManager.grey,
                            fontSize: AppSize.s16,
                            leftPadding: AppPadding.p5,
                            rightPadding: AppPadding.p5,
                            maxLine: 1,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorManager.amber,
                              ),
                              customText(
                                text: "4.9",
                                textColor: ColorManager.black54,
                                fontSize: AppSize.s14,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
