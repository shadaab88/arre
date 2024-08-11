import 'dart:ui';

import 'package:arre/utils/asset_constants.dart';
import 'package:arre/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            color: Constants.appBarBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetConstants.arreLogo,
                      height: 18,
                    ),
        
                    const SizedBox(
                      height: 8,
                    ),
        
                    Image.asset(
                      AssetConstants.voiceLogo,
                      height: 15,
                    )
                  ],
                ),
              ),
        
              Row(
                children: [
                  Image.asset(
                    AssetConstants.bellIcon,
                    height: 33,
                    width: 33,
                  ),
        
                  const SizedBox(
                    width: 8,
                  ),
        
                  Image.asset(
                    AssetConstants.chatIcon,
                    height: 33,
                    width: 33,
                  ),
        
                  const SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    // return AppBar(
    //   backgroundColor: Constants.appBarBackgroundColor,
    //   titleSpacing: 10,
    //   centerTitle: false,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       bottom: Radius.circular(16),
    //     ),
    //   ),
    //   title: Column(
    //     children: [
    //       Image.asset(
    //         AssetConstants.arreLogo,
    //         height: 18,
    //       ),
    //
    //       const SizedBox(
    //         height: 8,
    //       ),
    //
    //       Image.asset(
    //         AssetConstants.voiceLogo,
    //         height: 15,
    //       )
    //     ],
    //   ),
    //   actions: [
    //     Image.asset(
    //       AssetConstants.bellIcon,
    //       height: 33,
    //       width: 33,
    //     ),
    //
    //     const SizedBox(
    //       width: 8,
    //     ),
    //
    //     Image.asset(
    //       AssetConstants.chatIcon,
    //       height: 33,
    //       width: 33,
    //     ),
    //
    //     const SizedBox(
    //       width: 8,
    //     ),
    //   ],
    // );
  }
}
