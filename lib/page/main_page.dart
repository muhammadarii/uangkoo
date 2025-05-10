import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/page/category_page.dart';
import 'package:uangkoo/page/home_page.dart';
import 'package:uangkoo/page/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  void onTapTaped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          (currentIndex == 0)
              ? CalendarAppBar(
                accent: Colors.green,
                backButton: false,
                locale: "id",
                onDateChanged: () {},
                firstDate: DateTime.now().subtract(Duration(days: 140)),
                lastDate: DateTime.now(),
              )
              : PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 16,
                  ),
                  child: Text(
                    "Categories",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(100),
              ),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (context) => TransactionPage()),
                )
                .then((value) {
                  setState(() {});
                });
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          shape: CircleBorder(),
        ),
      ),
      body: _children[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTapTaped(0);
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                onTapTaped(1);
              },
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}
