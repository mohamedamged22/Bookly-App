import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final Price? listPrice;
  final Price? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    listPrice:
        json['listPrice'] != null ? Price.fromJson(json['listPrice']) : null,
    retailPrice:
        json['retailPrice'] != null
            ? Price.fromJson(json['retailPrice'])
            : null,
    buyLink: json['buyLink'] as String?,
    offers:
        json['offers'] != null
            ? (json['offers'] as List).map((e) => Offer.fromJson(e)).toList()
            : null,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'listPrice': listPrice?.toJson(),
    'retailPrice': retailPrice?.toJson(),
    'buyLink': buyLink,
    'offers': offers?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [
    country,
    saleability,
    isEbook,
    listPrice,
    retailPrice,
    buyLink,
    offers,
  ];
}


class Price extends Equatable {
  final double? amount;
  final String? currencyCode;

  const Price({this.amount, this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: (json['amount'] as num?)?.toDouble(),
        currencyCode: json['currencyCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };

  @override
  List<Object?> get props => [amount, currencyCode];
}


class Offer extends Equatable {
  final int? finskyOfferType;
  final Price? listPrice;
  final Price? retailPrice;

  const Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json['finskyOfferType'] as int?,
        listPrice: json['listPrice'] != null ? Price.fromJson(json['listPrice']) : null,
        retailPrice: json['retailPrice'] != null ? Price.fromJson(json['retailPrice']) : null,
      );

  Map<String, dynamic> toJson() => {
        'finskyOfferType': finskyOfferType,
        'listPrice': listPrice?.toJson(),
        'retailPrice': retailPrice?.toJson(),
      };

  @override
  List<Object?> get props => [finskyOfferType, listPrice, retailPrice];
}
