import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/homescreen_controller.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  fetchData() async {
    await Provider.of<HomeScreenController>(context,listen: false).fetchData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
