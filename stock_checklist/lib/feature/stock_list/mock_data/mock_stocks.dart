import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_checklist/models/stock.dart';

final stocksProvider = Provider<List<Stock>>((ref) {
  return _stocks;
});

final _stocks = [
  Stock(
      symbol: '005930',
      company: '삼성전자',
      price: 70300,
      percentChangeToday: 10009.21),
  Stock(
      symbol: '373220',
      company: 'LG에너지솔루션',
      price: 578000,
      percentChangeToday: -5.45),
  Stock(
      symbol: '000660',
      company: 'SK하이닉스',
      price: 109200,
      percentChangeToday: -20.70),
  Stock(
      symbol: '005930',
      company: '삼성전자',
      price: 70300,
      percentChangeToday: 10.21),
  Stock(
      symbol: '373220',
      company: 'LG에너지솔루션',
      price: 578000,
      percentChangeToday: -5.45),
  Stock(
      symbol: '000660',
      company: 'SK하이닉스',
      price: 109200,
      percentChangeToday: -20.70),
  Stock(
      symbol: '005930',
      company: '삼성전자',
      price: 70300,
      percentChangeToday: 10.21),
  Stock(
      symbol: '373220',
      company: 'LG에너지솔루션',
      price: 578000,
      percentChangeToday: -5.45),
  Stock(
      symbol: '000660',
      company: 'SK하이닉스',
      price: 109200,
      percentChangeToday: -20.70),
  Stock(
      symbol: '005930',
      company: '삼성전자',
      price: 70300,
      percentChangeToday: 10.21),
  Stock(
      symbol: '373220',
      company: 'LG에너지솔루션',
      price: 578000,
      percentChangeToday: -5.45),
  Stock(
      symbol: '000660',
      company: 'SK하이닉스',
      price: 109200,
      percentChangeToday: -20.70),
];
