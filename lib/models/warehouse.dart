import 'dart:convert';

import 'package:flutter/foundation.dart';

class Warehouse {
  final String warehouseId;
  final String email;
  final String country;
  final num capacity;
  final List commodity;
  final num availableCapacity;
  Warehouse({
    required this.warehouseId,
    required this.country,
    required this.email,
    required this.capacity,
    required this.commodity,
    required this.availableCapacity,
  });

  Warehouse copyWith({
    String? warehouseId,
    String? country,
    String? email,
    num? capacity,
    List? commodity,
    num? availableCapacity,
  }) {
    return Warehouse(
      warehouseId: warehouseId ?? this.warehouseId,
      country: country ?? this.country,
      capacity: capacity ?? this.capacity,
      commodity: commodity ?? this.commodity,
      availableCapacity: availableCapacity ?? this.availableCapacity,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'warehouseId': warehouseId});
    result.addAll({'country': country});
    result.addAll({'email': email});
    result.addAll({'capacity': capacity});
    result.addAll({'commodity': commodity});
    result.addAll({'availableCapacity': availableCapacity});

    return result;
  }

  factory Warehouse.fromMap(Map<String, dynamic> map) {
    return Warehouse(
      warehouseId: map['warehouseId'] ?? '',
      country: map['country'] ?? '',
      email: map['email'] ?? '',
      capacity: map['capacity'] ?? 0,
      commodity: List.from(map['commodity']),
      availableCapacity: map['availableCapacity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Warehouse.fromJson(String source) =>
      Warehouse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Warehouse(warehouseId: $warehouseId, country: $country,email: $email, capacity: $capacity, commodity: $commodity, availableCapacity: $availableCapacity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Warehouse &&
        other.warehouseId == warehouseId &&
        other.country == country &&
        other.email == email &&
        other.capacity == capacity &&
        listEquals(other.commodity, commodity) &&
        other.availableCapacity == availableCapacity;
  }

  @override
  int get hashCode {
    return warehouseId.hashCode ^
        country.hashCode ^
        capacity.hashCode ^
        email.hashCode ^
        commodity.hashCode ^
        availableCapacity.hashCode;
  }
}
