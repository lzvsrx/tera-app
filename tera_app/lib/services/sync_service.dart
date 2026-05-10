import 'dart:convert';
import 'package:http/http.dart' as http;

class SyncService {
  static const String baseUrl = 'http://localhost:5000'; // Ajustar para o IP do servidor em produção

  static Future<bool> saveData(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/save'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print('Erro ao salvar dados: $e');
      return false;
    }
  }

  static Future<Map<String, dynamic>> loadData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/load'));
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return {};
    } catch (e) {
      print('Erro ao carregar dados: $e');
      return {};
    }
  }
}
