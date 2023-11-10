import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/add_users/bindings.dart';
import 'package:e_gamming_matcher/pages/add_users/view.dart';
import 'package:e_gamming_matcher/pages/all_users/bindings.dart';
import 'package:e_gamming_matcher/pages/all_users/view.dart';
import 'package:e_gamming_matcher/pages/home_screen/bindings.dart';
import 'package:e_gamming_matcher/pages/home_screen/view.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/bindings.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/view.dart';
import 'package:e_gamming_matcher/pages/matching_screens/view.dart';
import 'package:e_gamming_matcher/pages/search/bindings.dart';
import 'package:e_gamming_matcher/pages/search/view.dart';
import 'package:e_gamming_matcher/pages/splash_screen/bindings.dart';
import 'package:e_gamming_matcher/pages/splash_screen/view.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),

    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),

    GetPage(
      name: RoutesName.addUserScreen,
      page: () => AddUserScreen(),
      binding: AddUserScreenBindings(),
    ),
    GetPage(
      name: RoutesName.matchScreen,
      page: () => MatchingScreenView(),
    ),
    GetPage(
      name: RoutesName.allUsersScreen,
      page: () => AllUserScreen(),
      binding: AllUserScreenBindings(),
    ),
    GetPage(
      name: RoutesName.editUserScreen,
      page: () => EditUserScreen(id: ''),
      binding: EditUserScreenBindings(),
    ),

    GetPage(
      name: RoutesName.searchScreen,
      page: () => SearchScreen(),
      binding: SearchBindings(),
    ),
  ];
}
