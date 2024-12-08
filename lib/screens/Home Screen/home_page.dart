import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/models/menu_model.dart';
import 'package:harshna_project/provider/menu_provider.dart';
import 'package:harshna_project/screens/Category%20Screen/Catergory_Screen.dart';
import 'package:harshna_project/screens/Home%20Screen/Upper_Section.dart';
import 'package:harshna_project/screens/Menu%20Screen/menu_Screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  Menu? _selectedMenu;
  String menuId = 'all';
  String _selectedMenuItem = 'Delivery';
  String _selectedMeal = 'Lunch';

  final Map<String, String> _mealTimes = {
    'Lunch': '10am - 5pm',
    'Breakfast': '5am - 10am',
  };

  @override
  void initState() {
    super.initState();
    _selectedMeal = 'Lunch'; 
  }

  void _onMenuItemSelected(String menuItem) {
    setState(() {
      _selectedMenuItem = menuItem;
    });
  }

  void _openMenuSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double modalWidth = constraints.maxWidth < 600
                ? constraints.maxWidth
                : 600; 

            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  width: modalWidth,
                  child: Column(
                    children: [
                    
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select menu",
                              style: TextStyle(
                                fontSize: constraints.maxWidth < 600 ? 16 : 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(
                                    context); 
                              },
                            ),
                          ],
                        ),
                      ),
                   
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: _mealTimes.entries.map((entry) {
                            return ListTile(
                              title: Text(
                                '${entry.key} · ${entry.value}',
                                style: TextStyle(
                                  fontSize:
                                      constraints.maxWidth < 600 ? 14 : 16,
                                ),
                              ),
                              trailing: Radio<String>(
                                value: entry.key,
                                groupValue:
                                    _selectedMeal, 
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedMeal = value!;

                                    _onMenuItemSelected(value);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedMeal =
                                      entry.key;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      // Done Button
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // Close the bottom sheet after 'Done' button is pressed
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Done",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (ctx, provider, _) {
        return Scaffold(
          body: Column(
            children: [
              //Upper Section of Home Page
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 600;
                  
                  return UpperSection(
                    isSmallScreen: isSmallScreen,
                    selectedMenuItem: _selectedMenuItem,
                    onMenuItemSelected: _onMenuItemSelected,
                  );
                },
              ),

              //Menu Selection And Search Bar

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmallScreen = constraints.maxWidth < 600;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:
                              _openMenuSelector, 
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$_selectedMeal Menu', // Display the selected meal type
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.black),
                          iconSize: isSmallScreen ? 24 : 40,
                        ),
                      ],
                    );
                  },
                ),
              ),

              //Menu Screen

              MenuScreen(
                provider: provider,
                menuId: menuId,
                onMenuSelected: (newMenuId) {
                  setState(() {
                    menuId = newMenuId;
                  });
                },
                onMenuToggle: (menu) {
                  setState(() {
                    _selectedMenu = menu;
                  });
                },
              ),

            

              CategoryScreen(
                menuId: menuId,
                provider: provider,
                selectedMenuItem: _selectedMenuItem,
              )
            ],
          ),

//Cart Count And Price Section Showing Botom Of Page

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: provider.totalItemCount != 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Bucket ${provider.totalItemCount}Items₹${provider.TotalItemPrice}',
                            style: const TextStyle(color: AppColors.Kwhite),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.PRIMARY_COLOR),
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'View Basket',
                            style: TextStyle(
                                color:
                                    AppColors.PRIMARY_COLOR.withOpacity(0.2)),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          ),
        );
      },
    );
  }
}
