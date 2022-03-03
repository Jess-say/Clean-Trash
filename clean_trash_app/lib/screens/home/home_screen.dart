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
import '../classified_type_pages/plastic_bottle_fullpage.dart';

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
                  //showResults(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PlasticBottleFullPage()));
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
