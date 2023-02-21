import 'package:flutter/material.dart';

class SheetDeliveredWidget extends StatelessWidget {
  const SheetDeliveredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ratingStars(context),
        _timing(context),
        _pricing(context),
      ],
    );
  }

  Widget _ratingStars(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(46.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            size: 40,
            color: index < 2 ? Colors.deepOrange : Colors.white,
            Icons.star,
            shadows: const [Shadow(color: Colors.black, blurRadius: 1.0)],
          );
        }),
      ),
    );
  }

  Widget _timing(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 46, right: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Pickup Time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("10:00 PM"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text(
                "Delivery Time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("10:30 PM"),
            ],
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }

  Widget _pricing(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                "\$300.00",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Submit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 60),
                      Icon(Icons.arrow_forward),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
