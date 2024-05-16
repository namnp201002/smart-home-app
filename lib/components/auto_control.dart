import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smart_home/static/app_colors.dart';

class AutoControl extends StatefulWidget {
  const AutoControl({super.key, required this.value});
  final bool value;

  @override
  State<AutoControl> createState() => _AutoControlState();
}

class _AutoControlState extends State<AutoControl> {  late bool value;
  @override
  void initState() {
    value = widget.value;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purplePrimaryColor2,
        border: value ? Border.all(
            width: 2,
            color: Colors.green
        ) : Border.all(
            width: 2,
            color: AppColors.purplePrimaryColor2
        )
        ,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Auto control mode:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const Spacer(),
            Switch(value: value, onChanged: (value) {
              setState(() {
                this.value = value;
              });
            })
          ],
        ),
      ),
    );
  }
}
