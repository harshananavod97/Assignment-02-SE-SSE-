import 'package:flutter/material.dart';
import 'package:harshna_project/models/menu_model.dart';
import 'package:harshna_project/provider/menu_provider.dart';

class MenuScreen extends StatelessWidget {
  final MenuProvider provider;
  final String menuId;
  final ValueChanged<String> onMenuSelected;
  final ValueChanged<Menu?> onMenuToggle;

  MenuScreen({
    required this.provider,
    required this.menuId,
    required this.onMenuSelected,
    required this.onMenuToggle,
  });

  @override
  Widget build(BuildContext context) {
    return provider.menus.isEmpty
        ? Container()
        : Container(
            height: 50,
            child: LayoutBuilder(
              builder: (ctx, constraints) {
                final isSmallScreen = constraints.maxWidth < 600;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.menus.length,
                  itemBuilder: (ctx, index) {
                    final menu = provider.menus[index];
                    bool isSelected = menuId == menu.menuID;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 6.0 : 8.0,
                        vertical: isSmallScreen ? 4.0 : 8.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          onMenuToggle(isSelected
                              ? null
                              : menu); 
                          onMenuSelected(
                              menu.menuID);
                        },
                        child: Chip(
                          backgroundColor:
                              isSelected ? Colors.green : Colors.white,
                          label: Text(
                            menu.title ?? 'No Title',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 14,
                            ),
                          ),
                          deleteIcon: isSelected
                              ? Icon(
                                  Icons.close,
                                  size: isSmallScreen ? 18 : 24,
                                )
                              : null,
                          onDeleted: isSelected
                              ? () {
                                  provider.removeMenu(menu);
                                  onMenuSelected(
                                      'all'); 
                                }
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(isSmallScreen ? 10 : 15),
                          ),
                          side: BorderSide(
                            color: isSelected ? Colors.green : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
  }
}
