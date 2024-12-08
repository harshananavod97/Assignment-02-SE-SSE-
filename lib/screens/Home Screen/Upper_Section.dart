import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpperSection extends StatelessWidget {
  final bool isSmallScreen;
  final String selectedMenuItem;
  final Function(String) onMenuItemSelected;

  UpperSection({
    required this.isSmallScreen,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  Color _getIconColor(String buttonName) {
    return selectedMenuItem == buttonName ? Colors.green : Colors.black;
  }

  final Map<String, String> _iconPaths = {
    'Delivery': 'assets/icons/Delivery.svg',
    'Dinning': 'assets/icons/Dinning.svg',
    'Cart': 'assets/icons/cart.svg',
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: isSmallScreen ? 10 : 20),
            child: Container(
              height: isSmallScreen ? 150 : 250,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(bottom: isSmallScreen ? 5 : 13),
                child: Positioned.fill(
                  child: Image.asset(
                    'assets/images/backgroud_image.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: isSmallScreen ? 16 : 24,
            bottom: isSmallScreen ? 70 : 78,
            child: Text(
              'Welcome to\nEl Cabanyal',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 24 : 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: isSmallScreen ? 5 : 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onMenuItemSelected('Delivery');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: _buildIcon(
                        'Delivery',
                        isSmallScreen ? 30 : 40,
                        isSmallScreen ? 30 : 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onMenuItemSelected('Dinning');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: _buildIcon(
                        'Dinning',
                        isSmallScreen ? 30 : 40,
                        isSmallScreen ? 30 : 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onMenuItemSelected('Cart');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: _buildIcon(
                        'Cart',
                        isSmallScreen ? 30 : 40,
                        isSmallScreen ? 30 : 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String buttonName, double width, double height) {
    return SvgPicture.asset(
      _iconPaths[buttonName]!,
      width: width,
      height: height,
      color: _getIconColor(buttonName),
    );
  }
}
