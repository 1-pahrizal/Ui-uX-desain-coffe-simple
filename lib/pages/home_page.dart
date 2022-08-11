// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopi/util/coffe_title.dart';
import 'package:kopi/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of Coffe types
  final List coffeType = [
    // [coffe type, IsSelected ]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Hitam',
      false,
    ],
    [
      'Susu',
      false,
    ],
  ];
  //user tappe on coffe types
  void coffeTypeSelected(int index) {
    setState(() {
      // this For loop menjadi false
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(children: [
        // find teh best coffe
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Temukan Kopi Favorit Kamu",
              style: TextStyle(
                fontSize: 40,
              )),
        ),

        SizedBox(height: 25),
        // Seacty barr
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari Kopi Terbaikmu',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                )),
          ),
        ),
        SizedBox(height: 25),

        //Horizontal Listview off kopi
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeType.length,
            itemBuilder: (context, index) {
              return CoffeType(
                coffeType: coffeType[index][0],
                isSelected: coffeType[index][1],
                onTap: () {
                  coffeTypeSelected(index);
                },
              );
            },
          ),
        ),

        //Horizontal
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CoffeTitle(
              coffeImagePath: 'assets/images/coklat.jpg',
              coffeName: 'Coklat',
              cofferPrice: '14.000',
            ),
            CoffeTitle(
              coffeImagePath: 'assets/images/cappucino.jpg',
              coffeName: 'Capucino',
              cofferPrice: '28.000',
            ),
            CoffeTitle(
              coffeImagePath: 'assets/images/hangat.jpg',
              coffeName: 'Kopi  Hangat',
              cofferPrice: '30.000',
            ),
            CoffeTitle(
              coffeImagePath: 'assets/images/cappucino.jpg',
              coffeName: 'Coklat Special',
              cofferPrice: '35.000',
            ),
          ],
        ))
      ]),
    );
  }
}
