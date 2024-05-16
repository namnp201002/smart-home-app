import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceControl extends StatefulWidget {

  // const DeviceControl({Key? key}) : super(key: key);
  const DeviceControl({super.key, required  this.value, required this.device});

   final bool value;
   final String device;

  @override
  State<DeviceControl> createState() => _DeviceControlState();
}

class _DeviceControlState extends State<DeviceControl> {
  late bool value;
  late String device;

  @override
  void initState() {
    value = widget.value;
    device = widget.device;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        // border: Border.all(
        //   color: AppColor.bluePrimaryColor2,
        //   width: 2,
        // )
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            "🥵",
            style: TextStyle(fontSize: 50),
          ),
          Text(
            device!,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "Off",
                style: TextStyle(fontSize: 25),
              ),
              Spacer(),

              Switch(value: value!, onChanged: (value) => true)
            ],
          )
        ],
      ),
    );
  }
}
