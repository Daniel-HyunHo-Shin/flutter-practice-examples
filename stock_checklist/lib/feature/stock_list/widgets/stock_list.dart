import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stock_checklist/feature/stock_list/widgets/stock_list_tile.dart';
import 'package:stock_checklist/feature/stock_list/mock_data/mock_stocks.dart';

class StockList extends ConsumerWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocks = ref.watch(stocksProvider);

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey[400],
        );
      },
      itemCount: stocks.length,
      itemBuilder: (ctx, index) {
        final stock = stocks[index];
        final formattedPrice =
            NumberFormat.simpleCurrency(locale: 'ko_KR').format(stock.price);

        return StockListTile(stock: stock, formattedPrice: formattedPrice);
      },
    );
  }
}
