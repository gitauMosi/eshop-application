import 'package:flutter/material.dart';

Widget headerWidget(BuildContext context) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ]),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Flat 50% discount on\nyour first order.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Image.asset(
          "assets/images/prom.png",
        )
      ],
    ),
  );
}
