import 'package:flutter/material.dart';
import 'package:sabbar_task/src/feature/main/presentation/widget/driver_status_stepper_widget.dart';
import 'package:sabbar_task/src/feature/main/presentation/widget/sheet_delivered_widget.dart';
import '../bloc/main_state.dart';

class SheetTrackerWidget extends StatelessWidget {
  final RouteType _routeType;
  const SheetTrackerWidget({super.key, required RouteType routeType})
      : _routeType = routeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            alignment: Alignment.topCenter,
            children: [
              _getDriverImage(context),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  children: [
                    _getDriverName(context),
                    _routeType.isCompleted
                        ? const SheetDeliveredWidget()
                        : DriverStatusStepperWidget(
                            routeType: _routeType,
                          ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _getDriverImage(BuildContext context) {
    return const Positioned(
      top: -60,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/cat.jpeg"),
        radius: 50,
      ),
    );
  }

  Widget _getDriverName(BuildContext context) {
    return const Text(
      "Ahmad Almasri",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
