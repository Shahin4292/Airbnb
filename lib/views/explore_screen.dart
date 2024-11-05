
import 'package:airbnb_app/component/search_bar_and_filter.dart';
import 'package:flutter/material.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  // final CollectionReference categoryCollection =
  // FirebaseFirestore.instance.collection("myAppCollection");
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
            children: [
            SearchBarAndFilter(),
              // StreamBuilder(stream: categoryCollection.snapshorts(), builder: (context, streamSnapshot){
              //   if(streamSnapshot.hasData){
              //     return Stack();
              //   }
              // })
        ],
      ),
    ),);
  }
}
