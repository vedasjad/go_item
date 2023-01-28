import 'dart:convert';

class WarehouseCommodity {
  final String commodityName;
  final num quantity;

  WarehouseCommodity({
    required this.commodityName,
    required this.quantity,
  });

  WarehouseCommodity copyWith({
    String? commodityName,
    num? quantity,
  }) {
    return WarehouseCommodity(
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

  factory WarehouseCommodity.fromMap(Map<String, dynamic> map) {
    return WarehouseCommodity(
      commodityName: map['commodityName'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseCommodity.fromJson(String source) =>
      WarehouseCommodity.fromMap(json.decode(source));

  @override
  String toString() =>
      'WarehouseCommodity(commodityName: $commodityName, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WarehouseCommodity &&
        other.commodityName == commodityName &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => commodityName.hashCode ^ quantity.hashCode;
}
