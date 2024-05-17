import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/provider/control_provider.dart';
import 'package:smart_home/static/app_colors.dart';

class DeviceControl extends StatefulWidget {
  // const DeviceControl({Key? key}) : super(key: key);
  const DeviceControl(
      {super.key,
      required this.icon,
      required this.value,
      required this.auto,
      required this.device,
      required this.updateAuto,required this.updateDevice});

  final String icon;
  final bool auto;
  final bool value;
  final String device;

  final Function(bool) updateAuto;
  final Function(bool) updateDevice;

  @override
  State<DeviceControl> createState() => _DeviceControlState();
}

class _DeviceControlState extends State<DeviceControl> {
  late bool auto;
  late bool value;
  late String device;
  late String icon;

  @override
  void initState() {
    auto = widget.auto;
    value = widget.value;
    device = widget.device;
    icon = widget.icon;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15),
      decoration: BoxDecoration(
        color: AppColors.purplePrimaryColor2,
        border: widget.value
            ? const GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  AppColors.cyan1,
                  AppColors.cyan2,
                  AppColors.cyan3
                ]),
                width: 2)
            : Border.all(width: 2, color: AppColors.purplePrimaryColor2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              device,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                const Text(
                  "Auto",
                  style: TextStyle(fontSize: 18, color: AppColors.grayText),
                ),
                Spacer(),
                Switch(
                    value: widget.auto,
                    onChanged: (value) {
                      widget.updateAuto(value);
                      context.read<ControlProvider>().getData();
                    })
              ],
            ),
            Row(
              children: [
                Text(
                  widget.value ? "On" : "Off",
                  style:
                      const TextStyle(fontSize: 18, color: AppColors.grayText),
                ),
                Spacer(),
                Switch(
                    value: widget.value,
                    onChanged: widget.auto
                        ? null
                        : (value) {
                            widget.updateDevice(value);
                            context.read<ControlProvider>().getData();
                          })
              ],
            )
          ],
        ),
      ),
    );
  }
}
