import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key,required this.onPressed, required this.value}) : super(key: key);
   final GestureTapCallback onPressed;
   // ignore: prefer_typing_uninitialized_variables
   final  value;
  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
         Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: value != null
              ? CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(value),
                )
              : SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Center(
                      child: Image.asset(myConstant.placeholderImage),
                    ),
                  ),
                ),
        ),
          Positioned(
              right: -16,
              bottom: 0,
              child:SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: const Color(0xFFF5F6F9),
                      ),
                      onPressed: onPressed,
                      child: const Icon(
                        Icons.camera_enhance,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ),
        ],
      ),
    );
  }
}


//                   showDialog(context: context, builder: (BuildContext context){
// return MyDialog(title: title, cancel: cancel, comfirm: comfirm, content: content)
//                   });