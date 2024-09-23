import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class PersonalService {
  final String baseUrl =
      'https://chinalco-dev-sgm-backend-g0bdc2cze6afhzg8.canadaeast-01.azurewebsites.net/api';

  Future<Map<String, dynamic>> buscarPersonalPorDni(String dni) async {
    final url =
        '$baseUrl/Personal/ObtenerPersonalPorDocumento?numeroDocumento=$dni';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Personal encontrado con DNI $dni');
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al buscar personal con DNI $dni');
    }
  }

  Future<Map<String, dynamic>> registrarPersona(
      Map<String, dynamic> data) async {
    final url = '$baseUrl/Personal/RegistrarPersona';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('Persona registrada correctamente');
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al registrar persona');
    }
  }

  Future<Map<String, dynamic>> actualizarPersona(
      Map<String, dynamic> data) async {
    final url = '$baseUrl/Personal/ActualizarPersona';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      log('Persona actualizada correctamente');
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al actualizar persona');
    }
  }

  Future<void> eliminarPersona(String id) async {
    final url = '$baseUrl/Personal/EliminarPersona?id=$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Persona eliminada correctamente');
    } else {
      throw Exception('Error al eliminar persona');
    }
  }
}
