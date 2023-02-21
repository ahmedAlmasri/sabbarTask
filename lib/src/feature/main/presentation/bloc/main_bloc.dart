import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sabbar_task/src/feature/main/presentation/bloc/main_event.dart';
import 'package:sabbar_task/src/feature/main/presentation/bloc/main_state.dart';
import 'package:sabbar_task/src/feature/main/presentation/widget/markers.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  var _routerType = RouteType.idle;
  MainBloc()
      : super(MainInitState(
          pickupMarker.center,
          deliveryRoute.first,
          deliveryMarker.center,
          RouteType.idle,
        )) {
    _routerType = RouteType.idle;
    on<MainInitEvent>(_onInit);
  }

  void _onInit(MainInitEvent event, Emitter<MainState> emitter) async {
    _routerType = RouteType.nearPickup;
    await _trackRoute(
      emitter,
      pickupRoute,
      pickupMarker.center,
      RouteType.nearPickup,
      RouteType.arrivedPickup,
    );
    await _trackRoute(
      emitter,
      deliveryRoute,
      deliveryMarker.center,
      RouteType.nearDelivery,
      RouteType.arrivedDelivery,
    );
    await Future.delayed(const Duration(seconds: 1));
    emitter(MainInitState(
      pickupMarker.center,
      deliveryRoute.last,
      deliveryMarker.center,
      RouteType.completed,
    ));
  }

  Future<void> _trackRoute(
    Emitter<MainState> emitter,
    List<LatLng> route,
    LatLng destination,
    RouteType nearRouteType,
    RouteType arrivedRouteType,
  ) async {
    var isNearReached = false;
    var isArrivedReached = false;
    for (var element in route) {
      await Future.delayed(const Duration(milliseconds: 200));
      final distance = _calculateDistance(destination, element);
      if (distance <= 100 && !isArrivedReached) {
        emitter(MainDeliveryState(arrivedRouteType));
        isArrivedReached = true;
        _routerType = arrivedRouteType;
      } else if (distance <= 5000 && !isNearReached) {
        emitter(MainDeliveryState(nearRouteType));
        _routerType = nearRouteType;
        isNearReached = true;
      }
      emitter(MainInitState(
        pickupMarker.center,
        element,
        deliveryMarker.center,
        _routerType,
      ));
    }
  }

  double _calculateDistance(LatLng origin, LatLng destination) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((destination.latitude - origin.latitude) * p) / 2 +
        c(origin.latitude * p) *
            c(destination.latitude * p) *
            (1 - c((destination.longitude - origin.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a)) * 1000;
  }
}
