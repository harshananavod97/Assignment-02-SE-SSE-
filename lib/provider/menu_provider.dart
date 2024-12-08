import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:harshna_project/models/catergory_model.dart';
import 'package:harshna_project/models/menu_Items_Model.dart';
import 'package:harshna_project/models/menu_model.dart';
import 'package:harshna_project/models/model_modifier.dart';
import 'package:logger/logger.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> _menus = []; 
  List<Categorys> _categories = []; 
  List<Item> _items = []; 
  List<ModifierGroup> _modifiers = [];

  Menu? _selectedMenu; 
  Menu? get selectedMenu => _selectedMenu;
  List<Menu> get menus => _menus;
  List<Categorys> get categories => _categories;
  List<Item> get items => _items;
  List<ModifierGroup> get modifiers => _modifiers;


  Future<void> loadMenuDataFromAssets() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/menu_data.json');
      final Map<String, dynamic> data = json.decode(response);

      final List<dynamic> menuList = data['Result']['Menu'] ?? [];
      final List<dynamic> categoryList = data['Result']['Categories'] ?? [];
      final List<dynamic> itemList = data['Result']['Items'] ?? [];
      final List<dynamic> modifierList = data['Result']['ModifierGroups'] ?? [];

    
      _menus = menuList.map((json) => Menu.fromJson(json)).toList();
      _categories =
          categoryList.map((json) => Categorys.fromJson(json)).toList();
      _items = itemList.map((json) => Item.fromJson(json)).toList();
      _modifiers =
          modifierList.map((json) => ModifierGroup.fromJson(json)).toList();

 
      notifyListeners();
    } catch (error) {
      print("Error loading data: $error");
      throw error;
    }
  }

 //Menu Screen Menu Remove Function
  void removeMenu(Menu menu) {
    _menus.remove(menu);
    if (_selectedMenu == menu) {
      _selectedMenu = null; 
    }
    notifyListeners(); 
  }

  //Get Catergories By MenuID
  List<Categorys> getCategoriesByMenuId(String menuId) {
    if (menuId == 'all') {
      return _categories;
    }
    return _categories.where((category) => category.menuId == menuId).toList();
  }

  //Get Items Base On Catergories
  List<Item> getCategoriesByItemiD(String itemId) {
    return _items.where((item) => item.menuItemId == itemId).toList();
  }

  double TotalItemPrice = 0.0;
  double totalItemCount = 0;

//Adding Count 
  void itemCountAdd(int count) {
    totalItemCount = totalItemCount + count;
    notifyListeners();
  }

//Adding Total Cart Price
  void totalItemPrice(double price) {
    TotalItemPrice = TotalItemPrice + price;
  }
}
