import 'dart:convert';

import 'package:flutter/foundation.dart';

class Business {
  final List countries;

  Business({
    required this.countries,
  });

  Business copyWith({
    List? countries,
  }) {
    return Business(
      countries: countries ?? this.countries,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'countries': countries});
  
    return result;
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      countries: List.from(map['countries']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) => Business.fromMap(json.decode(source));

  @override
  String toString() => 'Business(countries: $countries)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Business &&
      listEquals(other.countries, countries);
  }

  @override
  int get hashCode => countries.hashCode;
}
