import 'package:flutter/material.dart';

class SearchBarAndFilter extends StatelessWidget {
  const SearchBarAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(blurRadius: 7, color: Colors.black38),
                  ]),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.search,size: 32,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
