import 'package:flutter/material.dart';

import '../../../common/label.dart';
import '../../../models/stock.dart';

class StockListTile extends StatelessWidget {
  const StockListTile({
    super.key,
    required this.stock,
    required this.formattedPrice,
  });

  final Stock stock;
  final String formattedPrice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stock.company,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            stock.symbol,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
      trailing: Wrap(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formattedPrice,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            Label(percent: stock.percentChangeToday),
          ],
        ),
      ]),
    );
  }
}
