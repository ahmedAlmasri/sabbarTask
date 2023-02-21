

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../bloc/main_state.dart';

class DriverStatusStepperWidget extends StatelessWidget {
  final RouteType _routeType;
  const DriverStatusStepperWidget({super.key, required RouteType routeType})
  : _routeType = routeType;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 10.0,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 2,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: 4,
            contentsBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.only(left: 12, bottom: 30),
                child: Text(
                  RouteType.values[index + 1].notificationTitle,
                  style: TextStyle(
                      color: _getStateColor(index)),
                ),
              );
            },
            indicatorBuilder: (_, index) {
              return DotIndicator(
                  color: _getStateColor(index),
                  child: Container());
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: _getStateColor(index),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStateColor(int index) {
    return index > _routeType.position ? Colors.white : Colors.black;
  }
}