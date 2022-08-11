import 'package:flutter/material.dart';

class CoffeTitle extends StatelessWidget {
  final String coffeImagePath;
  final String coffeName;
  final String cofferPrice;

  CoffeTitle({
    required this.coffeImagePath,
    required this.coffeName,
    required this.cofferPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          children: [
            ///coffe Imagaes
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeImagePath),
            ),

            //coffe name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'With Cappucino',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            ///Belanja
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\Rp' + cofferPrice),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
