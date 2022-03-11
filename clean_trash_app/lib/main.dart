import 'package:cleantrash_app/route_generator.dart';
import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'Login/login_page.dart';
//import 'user/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home/home_screen.dart';

import 'package:cleantrash_app/screens/classified_type_pages/beer_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/booklet_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/coupons_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/envelope_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_liquid_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_soda_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/magazine_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/mail_paper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_milk_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/newspaper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/normal_paper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paintcan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_book_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_box_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_cartons_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_egg_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_tube_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_wrapping_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_bottle_page.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_cup.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_disposable_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/styrofoam_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tincan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tissuesbox_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/wine_fullpage.dart';

import 'package:cleantrash_app/screens/classified_type_pages/plastic_antifreeze_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_laundry_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_lotion_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/motor_oil_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_bag_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_bottle_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_utensils_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_shampoo_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_soda_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_water_jug_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_milk_jug_fullpage.dart'; 

import 'package:cleantrash_app/screens/classified_type_pages/glass_catsup_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_drink_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_solid_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_alcohol_fullpage.dart';

import 'package:cleantrash_app/screens/classified_type_pages/metal_aluminum_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_cap_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_spray_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_hanger_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paintcan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_drink_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_pet_food_fullpage.dart';


import 'package:cleantrash_app/screens/classified_type_pages/paper_egg_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_frozen_fullpage.dart';

import 'package:cleantrash_app/screens/classified_type_pages/cardboard_fullpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.green,
        ),
        //home: LoginPage(),
        //home: HomeScreen(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}