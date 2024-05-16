import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ControlProvider extends ChangeNotifier {
  String? _control1;
  String? _control2;
  String? _control3;
  String? _fan;
  String? _humidity;
  String? _led1;
  String? _led2;
  String? _led3;
  String? _temperature;

  String? get control1 => _control1;

  String? get control2 => _control2;

  String? get control3 => _control3;

  String? get fan => _fan;

  String? get humidity => _humidity;

  String? get led1 => _led1;

  String? get led2 => _led2;

  String? get led3 => _led3;

  String? get temperature => _temperature;

  ControlProvider(){
    getData();
  }

  Future<void> updateControl1(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Control1': val});
    notifyListeners();
  }

  Future<void> updateControl2(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Control2': val});
    notifyListeners();
  }

  Future<void> updateControl3(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Control3': val});
    notifyListeners();
  }

  Future<void> updateLed1(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Led1': val});
    notifyListeners();
  }
  Future<void> updateLed2(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Led2': val});
    notifyListeners();
  }

  Future<void> updateFan(bool value) async {
    String val = value ? 'bat' : 'tat';
    _control1 = val;
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .update({'Fan': val});
    notifyListeners();
  }




  Future getData() async {
    print('Fetch');
    await FirebaseFirestore.instance
        .collection("User")
        .doc("Data")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> item =
          documentSnapshot.data() as Map<String, dynamic>;
          print(item.toString());
          _control1 = item['Control1'];
          _control2 = item['Control2'];
          _control3 = item['Control3'];
          _led1 = item['Led1'];
          _led2 = item['Led2'];
          _led3 = item['Led3'];
          _fan = item['Fan'];
          _humidity = item['Humidity'];
          _temperature = item['Temperature'];
    });
    notifyListeners();
  }
}
