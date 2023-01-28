import 'dart:convert';

class CommodityList {
  final String commodityName;
  final String quantity;

  CommodityList({
    required this.commodityName,
    required this.quantity,
  });

  CommodityList copyWith({
    String? commodityName,
    String? quantity,
  }) {
    return CommodityList(
      commodityName: commodityName ?? this.commodityName,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'commodityName': commodityName});
    result.addAll({'quantity': quantity});
  
    return result;
  }

  factory CommodityList.fromMap(Map<String, dynamic> map) {
    return CommodityList(
      commodityName: map['commodityName'] ?? '',
      quantity: map['quantity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommodityList.fromJson(String source) => CommodityList.fromMap(json.decode(source));

  @override
  String toString() => 'CommodityList(commodityName: $commodityName, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CommodityList &&
      other.commodityName == commodityName &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => commodityName.hashCode ^ quantity.hashCode;
}
