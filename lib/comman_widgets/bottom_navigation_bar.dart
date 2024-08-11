import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:arre/comman_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

import '../controller/main_controller.dart';
import '../view/home_screen.dart';
import '../utils/asset_constants.dart';
import '../utils/constants.dart';



class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});


  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  List page = [
    HomeScreen(),
    const Center(
      child: Text(
        "second screen",
        style: TextStyle(
          color: Constants.black,
          fontSize: 22
        ),
      ),
    ),
    const Center(
      child: Text(
          "third screen",
        style: TextStyle(
            color: Constants.black,
            fontSize: 22
        ),
      ),
    ),
    const Center(
      child: Text(
          "fourth screen",
        style: TextStyle(
            color: Constants.black,
            fontSize: 22
        ),
      ),
    ),

    const Center(
      child: Text(
          "fifth screen",
        style: TextStyle(
            color: Constants.black,
            fontSize: 22
        ),
      ),
    ),
  ];

  MainController mainController = Get.find();



  String selectedVideo = "";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0,0),
          child: Container(
            color: Constants.appBarBackgroundColor,
          ),
        ),
        body: Obx(() =>
          Stack(
            children: [

              page[mainController.currentIndex.value],

              const CustomAppBar(),

              Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomNaviationBar(context)
              ),

            ],
          ),
        ),

      ),
    );
  }

  Widget buildMiniPlayer(BuildContext context) {
    return Obx(() =>
      GestureDetector(

        onVerticalDragUpdate: (details) {
          setState(() {

            if(mainController.playerMinHeight.value <= 60.0){
              mainController.playerMinHeight.value -= details.primaryDelta!;
            }

            if(mainController.playerMinHeight.value >= 60.0){
              mainController.playerMinHeight.value = 60.0;
            }

            if (mainController.playerMinHeight.value < 1.0) {
              mainController.playerMinHeight.value = 60.0;
              mainController.playingMedia.value = "";
            }
          });
        },
        child: Offstage(
          offstage: (mainController.playingMedia.value == "")?true:false,
          child: Miniplayer(
            // controller: miniPlayerController,
            minHeight: mainController.playerMinHeight.value,
            maxHeight: mainController.playerMinHeight.value,
            backgroundColor: Constants.transparent,


            builder: (height, percentage) {

              return Container(
                decoration: const BoxDecoration(
                  color: Constants.miniPlayerBgColor,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(child: Container()),

                    Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Music ${mainController.playingMedia.value} is playing right now',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Constants.white
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),

                                const Flexible(
                                  child: Text(
                                    "@ShellyShah",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Constants.musicSubtitleColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Image.asset(
                          AssetConstants.heartIconImage,
                          height: 32
                        ),

                        const SizedBox(
                          width: 12,
                        ),

                        Image.asset(
                            AssetConstants.playButtonIconImage,
                            height: 32
                        ),

                        const SizedBox(
                          width: 12,
                        ),

                        Image.asset(
                            AssetConstants.playListIconImage,
                            height: 32
                        ),

                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),

                    Expanded(child: Container()),
                    const LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Constants.progressIndicatorColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Constants.progressIndicatorFillColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomNaviationBar(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Obx(() =>
          Container(
              decoration: BoxDecoration(
                color: (mainController.playingMedia.value == "")?Constants.appBarBackgroundColor:Constants.miniPlayerBgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),

              ),
              height: (mainController.playingMedia.value == "")?80:140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Obx(() =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      buildMiniPlayer(context),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mainController.currentIndex.value = 0;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetConstants.homeIcon,
                                    height: 30,
                                    color: (mainController.currentIndex.value == 0)
                                        ?Constants.selectedColor:Constants.desableColor,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mainController.currentIndex.value = 1;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetConstants.searchIcon,
                                    height: 30,
                                    color: (mainController.currentIndex.value == 1)
                                        ?Constants.selectedColor:Constants.desableColor,
                                  ),


                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mainController.currentIndex.value = 2;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetConstants.micCircleIcon,
                                    height: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mainController.currentIndex.value = 3;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetConstants.usersIcon,
                                    width: 30,
                                    color: (mainController.currentIndex.value == 3)
                                        ?Constants.selectedColor:Constants.desableColor,
                                  ),


                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mainController.currentIndex.value = 4;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetConstants.avatarIcon,
                                    width: 30,
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
