import 'package:flutter/material.dart';
import 'package:harshna_project/provider/menu_provider.dart';
import 'package:harshna_project/screens/Menu%20Item%20Screen/menu_Item_Screen.dart';

class CategoryScreen extends StatelessWidget {
  final MenuProvider provider;
  final String selectedMenuItem;
  final String menuId;

  CategoryScreen({required this.provider, required this.selectedMenuItem,required this.menuId});

  @override
  Widget build(BuildContext context) {
 
    if (provider.categories.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    final categoriesToDisplay = provider.getCategoriesByMenuId(menuId);

    if (categoriesToDisplay.isEmpty) {
      return Center(child: Text('No Categories'));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: categoriesToDisplay.length,
        itemBuilder: (ctx, index) {
          final category = categoriesToDisplay[index];
          String title = category.title.en ?? '';

          return Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                
                for (int i = 0; i < category.menuEntities.length; i++)
                  MenuItemScreen(
                    menuEntityId: category.menuEntities[i].id,
                    selectedMenuItem: selectedMenuItem,
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
