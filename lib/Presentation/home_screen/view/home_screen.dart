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
    final homeScreenState = Provider.of<HomeScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text("SUPERHEROS",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: homeScreenState.superherosList?.length,
            itemBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Container(
                height: 200,width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey[100],
                ),
                child: ListTile(
                  leading: Container(child: Image.network(homeScreenState.superherosList?[index].url??"empty",fit: BoxFit.fill,)),
                 title:  Text(homeScreenState.superherosList?[index].name??"empty"),
                  subtitle:Text(homeScreenState.superherosList?[index].power??"empty"),
                  // ,
                )
              ),
            )

            ),
      ),
    );
  }
}
