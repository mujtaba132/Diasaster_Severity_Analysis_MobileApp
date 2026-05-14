import 'package:flutter/material.dart';
import 'package:fyp_project/Providers/BottomNavBar/BottomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List pages;
  const HomeScreen({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: pages[navProvider.currentIndex],

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: MoltenBottomNavigationBar(
            selectedIndex: navProvider.currentIndex,
            onTabChange: (index) {
              navProvider.changeIndex(index);
            },

            barHeight: 65,
            domeHeight: 25,
            domeWidth: 120,
            borderRaduis: BorderRadius.circular(25),

            barColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,

            domeCircleColor: Theme.of(context).primaryColor,

            tabs: [
              MoltenTab(
                icon: const Icon(Icons.home),
                selectedColor: Colors.white,
                unselectedColor: isDark ? Colors.grey[400]! : Colors.grey,
              ),
              MoltenTab(
                icon: const Icon(Icons.search),
                selectedColor: Colors.white,
                unselectedColor: isDark ? Colors.grey[400]! : Colors.grey,
              ),
              MoltenTab(
                icon: const Icon(Icons.person),
                selectedColor: Colors.white,
                unselectedColor: isDark ? Colors.grey[400]! : Colors.grey,
              ),
              MoltenTab(
                icon: const Icon(Icons.settings),
                selectedColor: Colors.white,
                unselectedColor: isDark ? Colors.grey[400]! : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
