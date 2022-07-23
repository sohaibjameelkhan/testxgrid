import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testscreen/main.dart';

import '../../configurations/colors.dart';
import '../../configurations/theme_notifier.dart';
import '../Widgets/buttton_Widget.dart';
import '../Widgets/test_card_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool darkmode = false;

  @override
  void initState() {
    // TODO: implement initState
    checkDarkMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CupertinoSwitch(
              value: darkmode,
              onChanged: (value) async {
                if (darkmode == true) {
                  theme.changeTheme('light');
                  darkmode = false;
                  setState(() {});
                } else {
                  theme.changeTheme('dark');
                  darkmode = true;
                  setState(() {});
                }
              },
            ),
            Icon(
              Icons.person,
              size: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "John Doe",
                  style: TextStyle(
                      fontSize: 25,
                      color: theme.currentTheme == "light"
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "JohnDoe@gmail.com",
                  style: TextStyle(
                      fontSize: 16,
                      color: theme.currentTheme == "light"
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: ButtonWidget(
                text: "Upgrade to PRO",
                backgroundCOlor: AppColors.appcolor,
                textColor: AppColors.blackColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            testCardWidget(
              text: "Privacy Policy",
              icon: Icon(Icons.privacy_tip_outlined),
            ),
            SizedBox(
              height: 15,
            ),
            testCardWidget(
              text: "Purchase History",
              icon: Icon(Icons.history),
            ),
            SizedBox(
              height: 15,
            ),
            testCardWidget(
              text: "Help & Support",
              icon: Icon(Icons.help_outline_sharp),
            ),
            SizedBox(
              height: 15,
            ),
            testCardWidget(
              text: "Settings",
              icon: Icon(Icons.settings),
            ),
            SizedBox(
              height: 15,
            ),
            testCardWidget(
              text: "Invite a Friend",
              icon: Icon(Icons.person_add),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: ButtonWidget(
                text: "Logout",
                backgroundCOlor:
                    theme.currentTheme == "light" ? Colors.black : Colors.white,
                textColor:
                    theme.currentTheme == "light" ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkDarkMode() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('theme') == 'dark') {
      darkmode = true;
      setState(() {});
    } else {
      darkmode = false;
      setState(() {});
    }

    // currentTheme = _prefs.getString('theme') ?? 'system';
    // notifyListeners();
  }
}
