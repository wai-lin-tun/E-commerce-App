import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/profile/components/controller.dart';
import 'package:ecommerce_app/screens/profile/components/setting.dart';
import 'package:ecommerce_app/widgets/profile_menu.dart';
import 'package:ecommerce_app/screens/profile/components/profile_pic.dart';
import 'package:ecommerce_app/service/provider/profile_image_provider.dart';
import 'package:ecommerce_app/widgets/dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
     final appLocalization =  AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<ProfileProvider>(
              builder: (context, value, child) {
                return ProfilePic(
                  value: value.pickImage,
                  onPressed: () {
                    Get.defaultDialog(
                      title: appLocalization!.onSelect,
                      radius: 15,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              value.imageFromGallery(context);
                            },
                            icon: const Icon(
                              Icons.image,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              value.imageFromCamera(context);
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
              },
            ),
            const SizedBox(height: 10),
            ProfileMenu(
              text: appLocalization!.myAccount,
              icon: Icon(
                Icons.person_sharp,
                color: myConstant.kDarkBlueColor,
              ),
              press: () => {},
            ),
            ProfileMenu(
              text: appLocalization.notification,
              icon: Icon(
                Icons.notifications,
                color: myConstant.kDarkBlueColor,
              ),
              press: () {},
            ),
            ProfileMenu(
              text: appLocalization.settings,
              icon: Icon(Icons.settings, color: myConstant.kDarkBlueColor),
              press: () {
                Get.to(() => const Setting());
              },
            ),
            ProfileMenu(
              text: appLocalization.helpCenter,
              icon: Icon(
                Icons.help_center_outlined,
                color: myConstant.kDarkBlueColor,
              ),
              press: () {

              },
            ),
            ProfileMenu(
              text: appLocalization.logOut,
              icon: Icon(
                Icons.logout_sharp,
                color: myConstant.kDarkBlueColor,
              ),
              press: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyDialog(
                          title: appLocalization.logOut,
                          cancel: () {
                            Navigator.pop(context);
                          },
                          content: appLocalization.areYouSure,
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
      ),
    );
  }
}
