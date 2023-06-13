// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Stock {
  final String symbol;
  final String company;
  final double price;
  final double percentChangeToday;
  Stock({
    required this.symbol,
    required this.company,
    required this.price,
    required this.percentChangeToday,
  });

  Stock copyWith({
    String? symbol,
    String? company,
    double? price,
    double? percentChangeToday,
  }) {
    return Stock(
      symbol: symbol ?? this.symbol,
      company: company ?? this.company,
      price: price ?? this.price,
      percentChangeToday: percentChangeToday ?? this.percentChangeToday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'symbol': symbol,
      'company': company,
      'price': price,
      'percentChangeToday': percentChangeToday,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      symbol: map['symbol'] as String,
      company: map['company'] as String,
      price: map['price'] as double,
      percentChangeToday: map['percentChangeToday'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stock.fromJson(String source) =>
      Stock.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Stock(symbol: $symbol, company: $company, price: $price, percentChangeToday: $percentChangeToday)';
  }

  @override
  bool operator ==(covariant Stock other) {
    if (identical(this, other)) return true;

    return other.symbol == symbol &&
        other.company == company &&
        other.price == price &&
        other.percentChangeToday == percentChangeToday;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        company.hashCode ^
        price.hashCode ^
        percentChangeToday.hashCode;
  }
}
