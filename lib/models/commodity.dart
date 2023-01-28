import 'dart:convert';

class Commodity {
  final String commodityName;
  final num volume;
  final String category;
  Commodity({
    required this.commodityName,
    required this.volume,
    required this.category,
  });

  Commodity copyWith({
    String? commodityName,
    num? volume,
    String? category,
  }) {
    return Commodity(
      commodityName: commodityName ?? this.commodityName,
      volume: volume ?? this.volume,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'commodityName': commodityName});
    result.addAll({'volume': volume});
    result.addAll({'category': category});
  
    return result;
  }

  factory Commodity.fromMap(Map<String, dynamic> map) {
    return Commodity(
      commodityName: map['commodityName'] ?? '',
      volume: map['volume'] ?? 0,
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Commodity.fromJson(String source) => Commodity.fromMap(json.decode(source));

  @override
  String toString() => 'Commodity(commodityName: $commodityName, volume: $volume, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Commodity &&
      other.commodityName == commodityName &&
      other.volume == volume &&
      other.category == category;
  }

  @override
  int get hashCode => commodityName.hashCode ^ volume.hashCode ^ category.hashCode;
}
