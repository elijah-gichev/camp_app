import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/main/main_screen_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  void _onPageSelected(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenView(page: _pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _onPageSelected,
        currentIndex: _pageIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.secondaryText,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: AppStrings.money,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: AppStrings.shifts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
