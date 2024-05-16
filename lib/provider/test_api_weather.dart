import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchWeather() async {
  const double latitude = 21.0278; // Vĩ độ của Hà Nội
  const double longitude = 105.8342; // Kinh độ của Hà Nội
  final apiKey = 'e69a1e113677e05ca5db46d1825e23b4'; // Thay 'YOUR_API_KEY' bằng khóa API của bạn
  final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Khi server trả lời thành công, parse JSON
    return json.decode(response.body);
  } else {
    // Khi server không trả lời thành công, đưa ra ngoại lệ
    throw Exception('Failed to load weather data');
  }
}

