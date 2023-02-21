import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainInitState extends MainState {
  final LatLng pickupPosition;
  final LatLng driverPosition;
  final LatLng deliveryPosition;
  final RouteType routeType;

  MainInitState(
    this.pickupPosition,
    this.driverPosition,
    this.deliveryPosition,
    this.routeType,
  );
  @override
  List<Object?> get props => [
        pickupPosition,
        driverPosition,
        deliveryPosition,
        routeType,
      ];
}

class MainDeliveryState extends MainState {
  final RouteType routeType;

  MainDeliveryState(this.routeType);
  @override
  List<Object?> get props => [routeType];
}

enum RouteType { idle, nearPickup, arrivedPickup, nearDelivery , arrivedDelivery, completed }

extension RouteTypeExtension on RouteType {
  bool get isCompleted {
    return this == RouteType.completed;
  }
  String get notificationTitle {
    switch (this) {
      case RouteType.idle:
        return "";
      case RouteType.completed:
        return "";
      case RouteType.nearPickup:
        return "On the way";
      case RouteType.nearDelivery:
        return "Near delivery destination";
      case RouteType.arrivedPickup:
        return "Pickup delivery";
      case RouteType.arrivedDelivery:
        return "Delivered packages";
    }
  }

  String get notificationBody {
    switch (this) {
      case RouteType.idle:
        return "";
      case RouteType.completed:
        return "";
      case RouteType.nearPickup:
        return "On the way";
      case RouteType.nearDelivery:
        return "Near delivery destination";
      case RouteType.arrivedPickup:
        return "Pickup delivery";
      case RouteType.arrivedDelivery:
        return "Delivered packages";
    }
  }

  int get position {
    switch (this) {
      case RouteType.idle:
        return -1;
      case RouteType.nearPickup:
        return 0;
      case RouteType.arrivedPickup:
        return 1;
      case RouteType.nearDelivery:
        return 2;
      case RouteType.arrivedDelivery:
        return 3;
      case RouteType.completed:
        return -1;
    }
  }
}
