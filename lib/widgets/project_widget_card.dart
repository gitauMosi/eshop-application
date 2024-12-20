import 'package:flutter/material.dart';

class ProdutWidgetCard extends StatelessWidget {
  const ProdutWidgetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Stack(children: [
            Image.asset(
              "assets/images/prom.png",
              height: 150,
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline)))
          ]),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nike Shoe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text('\$344'),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 13,
                      ),
                      Text("4.4"),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
