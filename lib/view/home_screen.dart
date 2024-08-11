import 'package:arre/controller/main_controller.dart';
import 'package:arre/utils/asset_constants.dart';
import 'package:arre/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comman_widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {


  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,

      body: SingleChildScrollView(
        child: Column(
          children: [

            // SizedBox(
            //   height: 65,
            // ),

            ListView.separated(
              itemCount: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return buildMediaCard(context, index);
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 16,
                  color: Constants.black,
                );
              },
            ),

          ],
        )
      ),
    );
  }

  Widget buildMediaCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {

        if(mainController.playingMedia.value == (index + 1).toString()){
          // mainController.playingMedia.value = "";
        }else {
          mainController.playingMedia.value = (index + 1).toString();
          mainController.playerMinHeight.value = 60;
        }

      },
      child: Container(
        height: 219,
        color: Colors.white,
        child: Image.asset(
          AssetConstants.mediaImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
