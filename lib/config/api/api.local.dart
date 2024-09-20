import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:88/api/Personal';

  // Método para obtener personal por documento
  Future<dynamic> obtenerPersonalPorDocumento(String documento) async {
    final url =
        Uri.parse('$baseUrl/ObtenerPersonalPorDocumento?documento=$documento');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error al obtener el personal');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para registrar una persona
  Future<void> registrarPersona(Map<String, dynamic> persona) async {
    final url = Uri.parse('$baseUrl/RegistrarPersona');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(persona),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Error al registrar la persona');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para actualizar una persona
  Future<void> actualizarPersona(Map<String, dynamic> persona) async {
    final url = Uri.parse('$baseUrl/ActualizarPersona');
    try {
      final response = await http.put(
        url,
        body: jsonEncode(persona),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Error al actualizar la persona');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para eliminar una persona
  Future<void> eliminarPersona(String documento) async {
    final url = Uri.parse('$baseUrl/EliminarPersona?documento=$documento');
    try {
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Error al eliminar la persona');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para listar el entrenamiento de personal
  Future<dynamic> listarPersonalEntrenamiento() async {
    final url = Uri.parse('$baseUrl/ListarPersonalEntrenamiento');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error al listar el entrenamiento de personal');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
