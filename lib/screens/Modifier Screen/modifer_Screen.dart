import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/models/menu_Items_Model.dart';
import 'package:harshna_project/provider/menu_provider.dart';
import 'package:harshna_project/screens/Modifier%20Screen/widgets/AddCartButtons.dart';
import 'package:harshna_project/screens/Modifier%20Screen/widgets/CheckBoxOption.dart';
import 'package:harshna_project/screens/Modifier%20Screen/widgets/ItemUpperSection.dart';
import 'package:harshna_project/screens/Modifier%20Screen/widgets/Tab_Widgets.dart';
import 'package:harshna_project/screens/Modifier%20Screen/widgets/ToppingItemScreen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ModifierScreen extends StatefulWidget {
  final List<Item> items;
  String selectedMenuItem;
  ModifierScreen(
      {super.key, required this.items, required this.selectedMenuItem});

  @override
  State<ModifierScreen> createState() => _ModifierScreenState();
}

class _ModifierScreenState extends State<ModifierScreen>
    with SingleTickerProviderStateMixin {
  int? selectedCheckboxIndex;
  int cartcount = 1;
  late TabController _tabController;

  List<Topping> toppings = [
    Topping(name: 'Beef', quantity: 0),
    Topping(name: 'Smoked Beef', quantity: 0),
    Topping(name: 'Mozarella Cheese', quantity: 0),
    Topping(name: 'Mushroom', quantity: 0),
    Topping(name: 'Paprika', quantity: 0),
  ];

  List<Topping> chosse = [
    Topping(name: 'Classic Thin', quantity: 0),
    Topping(name: 'New York Style Crus', quantity: 0),
    Topping(name: 'Detroit Style', quantity: 0),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      toppings[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (toppings[index].quantity > 0) {
        toppings[index].quantity--;
      }
    });
  }

  void _chooseincrementQuantity(int index) {
    setState(() {
      chosse[index].quantity++;
    });
  }

  void _choosedecrementQuantity(int index) {
    setState(() {
      if (chosse[index].quantity > 0) {
        chosse[index].quantity--;
      }
    });
  }

  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(builder: (ctx, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.ScafholdColor,
        body: LayoutBuilder(builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          final item = widget.items.isNotEmpty ? widget.items.first : null;

          if (item == null) {
            // No data available, show message
            return const Center(
              child: Text(
                'No Data ',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Upper Section
                  ItemUpperSection(
                      isWideScreen: isWideScreen, item: item, widget: widget),
                  const SizedBox(height: 20),

                  //Tab Bar Section

                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.PRIMARY_COLOR,
                    labelColor: AppColors.PRIMARY_COLOR,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: 'Ingredients'),
                      Tab(text: 'Nutritional'),
                      Tab(text: 'Instructions'),
                      Tab(text: 'Allergies'),
                    ],
                  ),

//Tab Bar Screens

                  Container(
                    height: isWideScreen ? 210 : 180,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        IngredientsTabView(
                          item: item,
                          isWideScreen: isWideScreen,
                        ),
                        NutritionalView(isWideScreen: isWideScreen, item: item),
                        const Text('No Instructions Available'),
                        const Text('No Allergy Information Available')
                      ],
                    ),
                  ),

                  //Toppings Section

                  Text(
                    'Toppings',
                    style: TextStyle(
                        color: AppColors.normalTextColor,
                        fontSize: isWideScreen ? 20 : 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: isWideScreen ? 250 : 300,
                    child: ListView.builder(
                      itemCount: toppings.length,
                      itemBuilder: (context, index) {
                        return ToppingItem(
                          toppingName: toppings[index].name,
                          quantity: toppings[index].quantity,
                          onIncrement: () => _incrementQuantity(index),
                          onDecrement: () => _decrementQuantity(index),
                        );
                      },
                    ),
                  ),

                  //Choose Size Section

                  Text(
                    'Choose Size',
                    style: TextStyle(
                        color: AppColors.normalTextColor,
                        fontSize: isWideScreen ? 20 : 15,
                        fontWeight: FontWeight.w400),
                  ),

                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxOption(
                          index: 0,
                          title: 'Small',
                          selectedCheckboxIndex: selectedCheckboxIndex,
                          onTap: (index) {
                            setState(() {
                              selectedCheckboxIndex = index;
                            });
                          },
                        ),
                        CheckboxOption(
                          index: 1,
                          title: 'Medium',
                          selectedCheckboxIndex: selectedCheckboxIndex,
                          onTap: (index) {
                            setState(() {
                              selectedCheckboxIndex = index;
                            });
                          },
                        ),
                        CheckboxOption(
                          index: 2,
                          title: 'Large',
                          selectedCheckboxIndex: selectedCheckboxIndex,
                          onTap: (index) {
                            setState(() {
                              selectedCheckboxIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  //Use Topping Section Again
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: chosse.length,
                      itemBuilder: (context, index) {
                        return ToppingItem(
                          toppingName: chosse[index].name,
                          quantity: chosse[index].quantity,
                          onIncrement: () => _chooseincrementQuantity(index),
                          onDecrement: () => _chooseincrementQuantity(index),
                        );
                      },
                    ),
                  ),

                  //Add Comment Section
                  Text(
                    'Add Comments (Optional)',
                    style: TextStyle(
                        color: AppColors.normalTextColor,
                        fontSize: isWideScreen ? 20 : 15,
                        fontWeight: FontWeight.w400),
                  ),

                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: 'Write here',
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                      maxLines: 10,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
//Add Cart Button  And Add item Count Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AddCartCount(
                        onDecrement: () {
                          setState(() {
                            cartcount > 1 ? cartcount-- : cartcount;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            cartcount++;
                          });
                        },
                        quantity: cartcount,
                        toppingName: '',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AddToCartButton(
                        cartcount: cartcount,
                        item: item,
                        selectedMenuItem: widget.selectedMenuItem,
                        onTap: () {
                          provider.totalItemPrice(
                            widget.selectedMenuItem == 'Delivery'
                                ? item.priceInfo.price.deliveryPrice *
                                    cartcount.toDouble()
                                : widget.selectedMenuItem == 'Dinning'
                                    ? item.priceInfo.price.tablePrice *
                                        cartcount.toDouble()
                                    : item.priceInfo.price.pickupPrice *
                                        cartcount.toDouble(),
                          );
                          provider.itemCountAdd(cartcount);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Item added to cart successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
