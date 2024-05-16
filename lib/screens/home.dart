import 'package:flutter/cupertino.dart';
import 'package:smart_home/components/device_control.dart';
import 'package:smart_home/screens/temperature.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Column(
     children: [
       SizedBox(height: 20,),
       Temperature(),
       Row(
         children: [
           Expanded(flex: 1,child: DeviceControl(device: "Fan", value: true,)),
           SizedBox(width: 10,),
           Expanded(flex: 1,child: DeviceControl(device: "Bulb", value: false,))

         ],
       )
     ],
    );
  }
}
