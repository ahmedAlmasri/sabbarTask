import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sabbar_task/src/di/injection.dart';
import 'package:sabbar_task/src/feature/main/presentation/bloc/main_bloc.dart';
import 'package:sabbar_task/src/feature/main/presentation/widget/sheet_tracker_widget.dart';

import '../../../../notification/notification_service.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';
import 'map_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc _mainBloc;
  late final NotificationService notificationService;
  GoogleMapController? _controller;
  @override
  void initState() {
    super.initState();
    _mainBloc = locator.get<MainBloc>();
    notificationService = NotificationService();
    notificationService.initializePlatformNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _mainBloc,
      child: BlocConsumer<MainBloc, MainState>(
        buildWhen: _buildWhen,
        listenWhen: _listenWhen,
        builder: _scaffold,
        listener: _listener,
      ),
    );
  }

  void _listener(BuildContext context, MainState state) async {
    if (state is MainDeliveryState) {
      await notificationService.showLocalNotification(
        id: Random().nextInt(1000),
        title: state.routeType.notificationTitle,
        body: state.routeType.notificationBody,
      );
    }else if(state is MainInitState) {
      await _controller?.moveCamera(
        CameraUpdate.newLatLngZoom(state.driverPosition, 13)
      );
    }
  }

  bool _buildWhen(MainState previous, MainState current) {
    return current is MainInitState;
  }

  bool _listenWhen(MainState previous, MainState current) {
    return current is MainDeliveryState || current is MainInitState;
  }

  Widget _scaffold(BuildContext context, MainState state) {
    if (state is MainInitState) {
     final sheetTrackWidget =  SheetTrackerWidget(
        routeType: state.routeType,
      );
      return Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: MapWidget(
                deliveryPosition: state.deliveryPosition,
                pickupPosition: state.pickupPosition,
                driverPosition: state.driverPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  _mainBloc.add(MainInitEvent());
                },
              ),
            ),
            sheetTrackWidget,
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
