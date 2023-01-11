import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/profile/components/controller.dart';
import 'package:ecommerce_app/screens/profile/components/profile_menu.dart';
import 'package:ecommerce_app/screens/profile/components/profile_pic.dart';
import 'package:ecommerce_app/service/provider/profile_image_provider.dart';
import 'package:ecommerce_app/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  ProfileController profileController = ProfileController();
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
         Consumer<ProfileProvider>(builder:(context, value, child) {
          return  
             ProfilePic(
            value: value.pickImage,
          
            onPressed: (){
             Get.defaultDialog(
                    title: "On Select",
                    radius: 15,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            value.imageFromGallery(context);
                            print(value.pickImage);
                          },
                          icon: const Icon(
                            Icons.image,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            value.imageFromCamera(context);
                            print(value.pickImage);
                          },
                          icon: const Icon(
                            Icons.photo_camera,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  );
            },
          );
         },),
          const SizedBox(height: 10),
          ProfileMenu(
            text: myConstant.myAccount,
            icon: Icon(
              Icons.person_sharp,
              color: myConstant.kDarkBlueColor,
            ),
            press: () => {},
          ),
          ProfileMenu(
            text: myConstant.notification,
            icon: Icon(
              Icons.notifications,
              color: myConstant.kDarkBlueColor,
            ),
            press: () {},
          ),
          ProfileMenu(
            text: myConstant.settings,
            icon: Icon(Icons.settings, color: myConstant.kDarkBlueColor),
            press: () {},
          ),
          ProfileMenu(
            text: myConstant.helpCenter,
            icon: Icon(
              Icons.help_center_outlined,
              color: myConstant.kDarkBlueColor,
            ),
            press: () {},
          ),
          ProfileMenu(
            text: myConstant.logOut,
            icon: Icon(
              Icons.logout_sharp,
              color: myConstant.kDarkBlueColor,
            ),
            press: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyDialog(
                        title: "Log Out",
                        cancel: () {
                          Navigator.pop(context);
                        },
                        content: "Are you sure?",
                        comfirm: () async {
                          profileController.logOut(context);
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.clear();
                        });
                  });
            },
          ),
        ],
      ),
    );
  }
}
