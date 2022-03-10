import 'package:cleantrash_app/screens/classified_type_pages/beer_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/glass_liquid_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/mail_paper_fullpage.Dart.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_food_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/metal_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/normal_paper_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paintcan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_book_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_box_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_cartons_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_egg_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/paper_wrapping_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_antifreeze_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_cup.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_disposable_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/styrofoam_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tissuesbox_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/wine_fullpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import './components/recyclable_item.dart';
import '../../components/bottom_nav_bar.dart';
import 'components/body.dart';
import '../badges/badges_page.dart';
import '../camera/camera.dart';
import '../settings/settings.dart';

import '../classified_type_pages/plastic_antifreeze_fullpage.dart';
import '../classified_type_pages/plastic_laundry_fullpage.dart';
import '../classified_type_pages/plastic_lotion_fullpage.dart';
import '../classified_type_pages/motor_oil_fullpage.dart';
import '../classified_type_pages/plastic_bag_fullpage.dart';
import '../classified_type_pages/plastic_bottle_fullpage.dart';
import '../classified_type_pages/plastic_utensils_fullpage.dart';
import '../classified_type_pages/plastic_shampoo_fullpage.dart';
import '../classified_type_pages/plastic_soda_fullpage.dart';
import '../classified_type_pages/plastic_water_jug_fullpage.dart'; 
import '../classified_type_pages/plastic_milk_jug_fullpage.dart'; 

import '../classified_type_pages/glass_catsup_fullpage.dart';
import '../classified_type_pages/glass_drink_fullpage.dart';
import '../classified_type_pages/glass_solid_food_fullpage.dart';
import '../classified_type_pages/glass_alcohol_fullpage.dart';

import '../classified_type_pages/metal_aluminum_fullpage.dart';
import '../classified_type_pages/metal_cap_fullpage.dart';
import '../classified_type_pages/metal_spray_fullpage.dart';
import '../classified_type_pages/metal_hanger_fullpage.dart';
import '../classified_type_pages/metal_food_fullpage.dart';
import '../classified_type_pages/paintcan_fullpage.dart';
import '../classified_type_pages/metal_drink_fullpage.dart';
import '../classified_type_pages/metal_pet_food_fullpage.dart';

import '../classified_type_pages/styrofoam_fullpage.dart';

import '../classified_type_pages/paper_bag_fullpage.dart';
import '../classified_type_pages/paper_box_fullpage.dart';
import '../classified_type_pages/normal_paper_fullpage.dart';
import '../classified_type_pages/paper_book_fullpage.dart';
import '../classified_type_pages/paper_cartons_fullpage.dart';
import '../classified_type_pages/tissuesbox_fullpage.dart';
import '../classified_type_pages/paper_wrapping_fullpage.dart';
import '../classified_type_pages/mail_paper_fullpage.Dart.dart';

import '../classified_type_pages/paper_egg_fullpage.dart';
import '../classified_type_pages/paper_frozen_fullpage.dart';

import '../classified_type_pages/cardboard_fullpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _locationMessage = '';
  String latitude = "";
  String longitude = "";

  @override
  void initState() {
    super.initState();
  }

  int _selectedItem = 0;

  void getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemarks[0];

    setState(() {
      _locationMessage = "${place.locality}, ${place.administrativeArea}";
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.camera_alt,
          Icons.assignment_turned_in,
          Icons.settings,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(elevation: 0, title: const Text("Search"), actions: <Widget>[
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
          icon: const Icon(Icons.search)),
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            Icon(Icons.location_on),
            Text(_locationMessage),
          ],
        ),
      ),
    ]);
  }
}

class DataSearch extends SearchDelegate<RecyclableItem> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, RecyclableItem(name: "null"));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // do something with result of selecting an item
    return Center(
        child: Text(
      query,
      style: const TextStyle(fontSize: 20),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final itemsList = query.isEmpty
        ? loadItemsList()
        : loadItemsList()
            .where((p) => p.name.toLowerCase().contains(query))
            .toList();

    Map<String, Widget> myRoutes = {
      'Anti-Freeze Bottle': PlasticAntifreezeFullPage(),
      'Laundry Product': PlasticLaundryFullPage(), 
      'Lotion Bottle': PlasticLotionFullPage(),
      'Motor Oil Container': MotorOilFullPage(),
      'Plastic Bag': PlasticBagFullPage(), 
      'Plastic Container': PlasticDisposableFullPage(),  // should I make this recyclable instead?
      'Plastic Cups': PlasticCupFullPage(),
      'Plastic Utensil': PlasticUtensilsFullPage(), 
      'Shampoo Bottle': PlasticShampooFullPage(),
      'Plastic Soda Bottle': PlasticSodaFullPage(), 
      'Water Jug': PlasticWaterJugFullPage(), 
      'Milk Jug': PlasticMilkJugFullPage(),
       
      // GLASS
      'Beer Bottle': BeerFullPage(),
      'Beverage Container': GlassDrinkFullPage(),
      'Catsup Bottle': GlassCatsupFullPage(),
      'Food Container':  GlassSolidFoodFullPage(),
      'Juice Container': GlassDrinkFullPage(),  // has soda bottle, remove that
      'Glass Soda Bottle':  GlassDrinkFullPage(), // ?? create glass soda bottle page
      'Wine Bottle': WineFullPage(),
      'Liquor Bottle': GlassAlcoholFullPage(),
 
      // METAL
      'Aluminum': AluminumFullPage(), 
      'Bottle Cap': MetalCapFullPage(),
      'Empty Aerosol Cans': MetalSprayFullPage(),
      'Metal Coat Hanger': MetalHangerFullPage(), 
      'Metal Food Can': MetalFoodFullPage(),
      'Milk Can': MetalDrinkFullPage(),  // create page
      'Juice Can': MetalDrinkFullPage(), 
      'Paint Can': PaintcanFullPage(),
      'Pet Food Can': MetalPetFoodFullPage(),  // separate page
      'Tin Can': MetalFullPage(),    // ?
      
      // Polystyrene
      'Styrofoam': StyrofoamFullPage(),
 
      // PAPER
      'Brochure': MailPaperFullPage(),    // brochure //
      'Cardboard': CardboardFullPage(),
      'catalog': MailPaperFullPage(),    // catalog 
      'Cereal Box': PaperboxFullPage(),     // cereal box  
      'Computer Paper':  NormalPaperFullPage(),
      'Coupons': MailPaperFullPage(),    // coupons
      'Paper Bag': PaperBagFullPage(), 
      'Junk Mail': MailPaperFullPage(),
      'Magazine': MailPaperFullPage(),    // magazine 
      'Newspaper': MailPaperFullPage(),  
      'Paper Carton': PaperCartonFullPage(),
      'Paper Tube': MailPaperFullPage(),    // paper tube
      'Phone Book': PaperBookFullPage(),
      'Tissue Box': TissueBoxFullPage(),
      'Envelope': MailPaperFullPage(),    // envelope 
      'Wrapping Paper': PaperWrappingFullPage(),
      
      'Egg Carton': PaperEggFullPage(),   // NOT ON LIST
      'Frozen Food Box': PaperFrozenFoodFullPage(),
    };


    return itemsList.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "No results found",
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () {
                  // showResults(context);
                  print(itemsList[index].name);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          myRoutes[itemsList[index].name] as Widget));
                
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(itemsList[index].name,
                        style: const TextStyle(fontSize: 20)),
                    const Divider()
                  ],
                )),
          );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    final _pageOptions = [
      HomeScreen(),
      CameraPage(),
      BadgesPage(),
      SettingsPage(),
    ];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => _pageOptions[index]));
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
