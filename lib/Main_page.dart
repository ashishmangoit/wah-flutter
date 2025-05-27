import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_cubit/setting_cubit.dart';
import 'bloc/home_cubit/setting_state.dart';
import 'data/model/setting_model.dart';
import 'screens/Chat_Page.dart';
import 'screens/Communities_Page.dart';
import 'screens/Home_Page.dart';
import 'screens/MyCoupons_Page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  SettingsModel? settings;
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().fetchSettings();
  }

  // List of pages
  final List<Widget> _pages = [
    HomePage(),
    MycouponsPage(),
    ChatPage(),
    CommunitiesPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return Center(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: CircularProgressIndicator()));
        } else if (state is SettingsLoaded) {
          final footer = state.settings.footer;
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: _pages[_currentIndex], // show pages after data loaded
            bottomNavigationBar: SizedBox(
              height: footer.height,
              child: Padding(
                padding: EdgeInsets.all(footer.textPadding ?? 8.0),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  currentIndex: _currentIndex,
                  onTap: _onTabTapped,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.local_offer_outlined),
                      label: 'My Coupons',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people_outline),
                      label: 'Communities',
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is SettingsError) {
          return Center(child: Text('Error loading settings'));
        }
        // default fallback
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
