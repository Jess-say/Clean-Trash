import 'dart:convert';

import 'package:cleantrash_app/item_api.dart';
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
import 'package:cleantrash_app/screens/classified_type_pages/plastic_antifreeze_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_cup.dart';
import 'package:cleantrash_app/screens/classified_type_pages/plastic_disposable_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/styrofoam_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tincan_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/tissuesbox_fullpage.dart';
import 'package:cleantrash_app/screens/classified_type_pages/wine_fullpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './components/recyclable_item.dart';
import '../../components/bottom_nav_bar.dart';
import 'components/body.dart';
import '../badges/badges_page.dart';
import '../camera/camera.dart';
import '../settings/settings.dart';
import '../Login/user/database.dart';
import 'package:cleantrash_app/screens/home/user_list.dart';
import 'package:cleantrash_app/model/users.dart';

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
import '../classified_type_pages/mail_paper_fullpage.dart';

import '../classified_type_pages/paper_egg_fullpage.dart';
import '../classified_type_pages/paper_frozen_fullpage.dart';

import '../classified_type_pages/cardboard_fullpage.dart';

// import 'package:cleantrash_app/item_api.dart';

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
    return StreamProvider<List<User>>.value(
      initialData: [],
      value: DatabaseService().users,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            const Body(),
            UserList(),
          ],
        ),
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
    String url;  // ?? need
    String item_name =  "";
    var Data;
    final itemsList = query.isEmpty
        ? loadItemsList()
        : loadItemsList()
            .where((p) => p.name.toLowerCase().contains(query))
            .toList();

    Map<String, String> myRoutes = {
      'Anti-Freeze Bottle': '/antifreeze',
      'Laundry Product': '/laundry_product', 
      'Lotion Bottle': '/plastic_lotion_bottle',
      'Motor Oil Container': '/motor_oil_container',
      'Plastic Bag': '/plastic_bag', 
      'Plastic Container': '/plastic_bottle',  // should I make this recyclable instead?
      'Plastic Cups': '/plastic_bottle',
      'Plastic Utensil': '/plastic_utensil', 
      'Shampoo Bottle': '/plastic_shampoo',
      'Plastic Soda Bottle': '/plastic_soda', 
      'Water Jug': '/plastic_water_jug', 
      'Milk Jug': '/plastic_milk_jug',
       
      // // GLASS
      'Beer Bottle': '/glass_beer',
      'Beverage Container': '/glass_drink',
      'Catsup Bottle': '/glass_catsup',
      'Food Container':  '/glass_solid_food',
      'Juice Container': '/glass_drink',
      'Glass Soda Bottle':  '/glass_soda',
      'Wine Bottle': '/glass_wine',
      'Liquor Bottle': '/glass_alchohol',
 
      // // METAL
      'Aluminum': '/metal_aluminum', 
      'Bottle Cap': '/metal_cap',
      'Empty Aerosol Cans': '/metal_spray_can',
      'Metal Coat Hanger': '/metal_hanger', 
      'Metal Food Can': '/metal_food_can',
      'Milk Can': '/metal_milk_can',
      'Juice Can': '/metal_drink', 
      'Paint Can': '/paint_can',
      'Pet Food Can': '/metal_pet_food_can',  // separate page
      'Tin Can': '/tin_can',    
      
      // // Polystyrene
      'Styrofoam': '/styrofoam',
 
      // // PAPER
      'Brochure': '/paper_booklet',    // brochure
      'Cardboard': '/cardboard',
      'Catalog': '/paper_booklet',    // catalog
      'Cereal Box': '/paper_box',     // cereal box
      'Computer Paper':  '/normal_paper',
      'Coupons': '/coupons',
      'Paper Bag': '/paper_bag', 
      'Junk Mail': '/mail_paper',
      'Magazine': '/magazine',
      'Newspaper': '/newspaper',
      'Paper Carton': '/paper_carton',
      'Paper Tube': '/paper_tube',
      'Phone Book': '/paper_book',
      'Tissue Box': '/tissue_box',
      'Envelope': '/envelope',
      'Wrapping Paper': '/paper_wrapping_paper',
      
      'Egg Carton': '/paper_egg_carton',   // NOT ON LIST
      'Frozen Food Box': '/paper_frozen_food',
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
                onTap: () async {
                  // print("HEYEEYEYE");
                  // List<String> split_item = (itemsList[index].name).split(" ");
                  // for (var i = 0; i < split_item.length-1; i++) {
                  //   item_name += split_item[i];
                  //   item_name += "%20";
                  // }
                  // item_name += split_item[split_item.length-1];

                  // url = 'http://localhost:5000/check_if_recyclable/' + item_name;
                  // print(url);
                  // print("heyyy");
                  // var parsed_url = Uri.parse(url); 
                  // print(parsed_url);
                  // showResults(context);
                  // print(itemsList[index].name);
                  // Data  = await getdata(parsed_url);
                  
                  // var decoded_data = jsonDecode(Data);
                  // print(Data);
                  // String item_name_text = decoded_data["item"];
                  // print("item name text "+ item_name_text);
                  String chosen_item = myRoutes[itemsList[index].name].toString();

                  // test code to check that argument works 
                  if (itemsList[index].name == "Egg Carton" || itemsList[index].name == "Frozen Food Box") {
                    Navigator.of(context).pushNamed(chosen_item, arguments: "False");
                  } else {
                    Navigator.of(context).pushNamed(chosen_item, arguments: "True");
                  }
                  
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         myRoutes[itemsList[index].name] as Widget));
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
