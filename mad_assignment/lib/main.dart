import 'package:flutter/material.dart';
import 'package:mad_assignment/about.dart' show AboutScreen;
import 'package:mad_assignment/home.dart';
import 'package:mad_assignment/list.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.list), text: 'List'),
                Tab(icon: Icon(Icons.info), text: 'About'),
              ],
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.teal,
            ),
          ),
          body: TabBarView(
            children: [HomeScreen(), ListScreen(), AboutScreen()],
          ),
        ),
      ),
    );
  }
}
