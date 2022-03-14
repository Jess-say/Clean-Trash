import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/classified_type_pages/beer_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/booklet_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/cardboard_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/coupons_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/envelope_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_alcohol_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_catsup_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_drink_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_soda_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_solid_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/magazine_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/mail_paper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_aluminum_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_cap_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_drink_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_hanger_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_milk_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_pet_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_spray2_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_spray_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/motor_oil_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/newspaper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/normal_paper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paintcan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_bag_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_book_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_cartons_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_egg_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_frozen_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_tube_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_wrapping_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_antifreeze_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_bag_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_bottle_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_cup.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_laundry_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_lotion_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_milk_jug_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_shampoo_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_soda_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_utensils_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_water_jug_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/styrofoam_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tincan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tissuesbox_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/wine_fullpage.dart';
import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cleantrash_app/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print("settings name");
    print(settings.name);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/antifreeze':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticAntifreezeFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/laundry_product':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticLaundryFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_lotion_bottle':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticLotionFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/motor_oil_container':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MotorOilFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_bag':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticBagFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_bottle':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticBottleFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_cup':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticCupFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_utensil':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticUtensilsFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_shampoo':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticShampooFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_soda':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticSodaFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_water_jug':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticWaterJugFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/plastic_milk_jug':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PlasticMilkJugFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
///////////////////////////////////
      case '/glass_beer':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BeerFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_solid_food':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => GlassSolidFoodFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_drink':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => GlassDrinkFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_catsup':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => GlassCatsupFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_soda':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => GlassSodaFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_wine':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => WineFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/glass_alchohol':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => GlassAlcoholFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_aluminum':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => AluminumFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_cap':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalCapFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_spray_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalSprayFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_hanger':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalHangerFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_food_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalFoodFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_milk_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MilkCanFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_drink':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalDrinkFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paint_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaintcanFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/metal_pet_food_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MetalPetFoodFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/tin_can':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => TincanFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/styrofoam':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => StyrofoamFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_booklet':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BookletFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/cardboard':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => CardboardFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_box':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperBookFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/normal_paper':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => NormalPaperFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/coupons':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => CouponsFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_bag':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperBagFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/mail_paper':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MailPaperFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/magazine':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MagazineFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/newspaper':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => NewspaperFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_carton':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperCartonFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_tube':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperTubeFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_book':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperBagFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/tissue_box':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => TissueBoxFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/envelope':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => EnvelopeFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_wrapping_paper':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperWrappingFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_egg_carton':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperEggFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      case '/paper_frozen_food':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PaperFrozenFoodFullPage(
                    recyclable: args,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
