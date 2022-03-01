class RecyclableItem {
  String name;
  RecyclableItem({required this.name});
}

List<RecyclableItem> loadItemsList(){
  // add more potential/ popular items 
  var _items = <RecyclableItem>[
    // Plastic 
    RecyclableItem(name: "Anti-Freeze Bottle"),
    RecyclableItem(name: "Laundry Product"),
    RecyclableItem(name: "Lotion Bottle"),
    RecyclableItem(name: "Motor Oil Container"),
    RecyclableItem(name: "Plastic Bag"),
    RecyclableItem(name: "Plastic Container"),
    RecyclableItem(name: "Plastic Cups"),
    RecyclableItem(name: "Plastic Utensil"),
    RecyclableItem(name: "Shampoo Bottle"),
    RecyclableItem(name: "Plastic Soda Bottle"),
    RecyclableItem(name: "Water Jug"),
    RecyclableItem(name: "Milk Jug"),

    // Glass
    RecyclableItem(name: "Beer Bottle"),
    RecyclableItem(name: "Beverage Container"),
    RecyclableItem(name: "Catsup Bottle"),
    RecyclableItem(name: "Food Container"),
    RecyclableItem(name: "Juice Container"),
    RecyclableItem(name: "Glass Soda Bottle"),
    RecyclableItem(name: "Wine Bottle"),
    RecyclableItem(name: "Liquor Bottle"),

    // Metal
    RecyclableItem(name: "Aluminum"),
    RecyclableItem(name: "Bottle Cap"),
    RecyclableItem(name: "Empty Aerosol Cans"),
    RecyclableItem(name: "Metal Coat Hanger"),
    RecyclableItem(name: "Metal Food Can"),
    RecyclableItem(name: "Milk Can"),
    RecyclableItem(name: "Juice Can"),
    RecyclableItem(name: "Paint Can"),
    RecyclableItem(name: "Pet Food Can"),
    RecyclableItem(name: "Tin Can"),

    // Polystyrene
    RecyclableItem(name: "Styrofoam"),

    // Paper
    RecyclableItem(name: "Brochure"),
    RecyclableItem(name: "Cardboard"),
    RecyclableItem(name: "Catalog"),
    RecyclableItem(name: "Cereal Box"),  // w/o Liner
    RecyclableItem(name: "Computer Paper"),
    RecyclableItem(name: "Coupons"),
    RecyclableItem(name: "Paper Bag"),
    RecyclableItem(name: "Junk Mail"),
    RecyclableItem(name: "Magazine"),
    RecyclableItem(name: "Newspaper"),
    RecyclableItem(name: "Paper Carton"),
    RecyclableItem(name: "Paper Tube"),
    RecyclableItem(name: "Phone Book"),
    RecyclableItem(name: "Tissue Box"),
    RecyclableItem(name: "Envelope"),
    RecyclableItem(name: "Wrapping Paper"),
  ];
  return _items;
}