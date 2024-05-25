import 'package:equatable/equatable.dart';

final class LocationResponseDto extends Equatable {
  final List<Location> locationList;
  const LocationResponseDto({required this.locationList});

  factory LocationResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list?=> LocationResponseDto(locationList: list.map((e) => Location.fromJson(e as Map<String,dynamic>)).toList()),
      _=>LocationResponseDto(locationList: [])
    };
  }

  List<Object?> get props => [locationList];
}

final class Location extends Equatable {
  final String name;
  final num id;

  Location({required this.name, required this.id});

  factory Location.fromJson(dynamic json) {
    return Location(name: json['name'], id: json['id']);
  }

  List<Object?> get props => [name,id];
}
