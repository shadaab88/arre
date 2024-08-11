


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/initial_binding.dart';
import '../comman_widgets/bottom_navigation_bar.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.customBottomNavigationBar,
        page: () => CustomBottomNavigationBar(),
        // transition: Transition.zoom,
        binding: InitialBinding()
    ),

  ];
}
