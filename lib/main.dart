import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/component/routes/routes.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/controller.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:opt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD4yKqQwnhGa2lTJ2zkOC-Al1pknM7l5sw",
          appId: "1:684836141637:android:1299a6983a9f7757a6812c",
          projectId: "e-gaming-db", messagingSenderId: ''),
  );
  Get.put(DrawsScreenController());
  // Get.put(EditUserScreenController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      initialRoute: RoutesName.splashScreen,
      getPages: AppPages.routes,
    );
  }
}
