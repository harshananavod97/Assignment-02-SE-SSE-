import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/provider/menu_provider.dart';
import 'package:harshna_project/screens/Modifier%20Screen/modifer_Screen.dart';
import 'package:provider/provider.dart';



class MenuItemScreen extends StatelessWidget {
  final String menuEntityId;
  final String selectedMenuItem;

  const MenuItemScreen({
    Key? key,
    required this.menuEntityId,
    required this.selectedMenuItem,
  }) : super(key: key);


   @override
  Widget build(BuildContext context) {

    return _buildItemDetails(menuEntityId, selectedMenuItem, context);
  }

  Widget _buildItemDetails(
      String menuEntityId, String selectedMenuItem, BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (ctx, provider, _) {
        final items = provider.getCategoriesByItemiD(menuEntityId);
        final item = items.first;

        return LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600; 

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModifierScreen(
                        selectedMenuItem: selectedMenuItem,
                        items: items,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isWideScreen
                              ? Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.blue,
                                )
                              : Container(
                                  width: 75,
                                  height: 75,
                                  color: Colors.blue,
                                ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title?.en ?? 'Untitled',
                                  style: TextStyle(
                                      fontSize: isWideScreen ? 20 : 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  item.description?.en ?? 'No description',
                                  style: TextStyle(
                                      fontSize: isWideScreen ? 16 : 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Price: \₹${selectedMenuItem == 'Delivery' ? item.priceInfo.price.deliveryPrice : selectedMenuItem == 'Dinning' ? item.priceInfo.price.tablePrice : item.priceInfo.price.pickupPrice}',
                                      style: TextStyle(
                                        fontSize: isWideScreen ? 16 : 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                      width: isWideScreen ? 25 : 20,
                                    ),
                                    item.metaData.isDealProduct == null
                                        ? Container()
                                        : item.metaData.isDealProduct!
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.PromotionColor,
                                                    borderRadius:
                                                        BorderRadius.circular(20)),
                                                height: isWideScreen ? 25 : 20,
                                                width: 150,
                                                child: Center(
                                                  child: Text("Promotions Available"),
                                                ),
                                              )
                                            : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isWideScreen ? 12 : 15),
                      child: Divider(),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

 
}
