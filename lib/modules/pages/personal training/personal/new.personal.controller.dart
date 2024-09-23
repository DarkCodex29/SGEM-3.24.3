import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sgem/config/api/api.personal.dart';

class NewPersonalController {
  final TextEditingController dniController = TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController puestoTrabajoController = TextEditingController();
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController apellidoPaternoController =
      TextEditingController();
  final TextEditingController apellidoMaternoController =
      TextEditingController();
  final TextEditingController gerenciaController = TextEditingController();
  final TextEditingController fechaIngresoController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController codigoLicenciaController =
      TextEditingController();
  final TextEditingController restriccionesController = TextEditingController();

  final PersonalService personalService = PersonalService();

  Future<void> buscarPersonalPorDni(String dni) async {
    try {
      final personal = await personalService.buscarPersonalPorDni(dni);

      // Manejar mapeo de datos correctamente desde el JSON recibido
      nombresController.text = personal['PrimerNombre'] ??
          '' + ' ' + (personal['SegundoNombre'] ?? '');
      puestoTrabajoController.text = personal['Cargo'] ?? '';
      codigoController.text = personal['CodigoMcp'] ?? '';
      apellidoPaternoController.text = personal['ApellidoPaterno'] ?? '';
      apellidoMaternoController.text = personal['ApellidoMaterno'] ?? '';
      gerenciaController.text = personal['Gerencia'] ?? '';
      fechaIngresoController.text = _parseJsonDate(personal['FechaIngreso']);
      areaController.text = personal['Area'] ?? '';
      codigoLicenciaController.text = personal['LicenciaCategoria'] ?? '';
      restriccionesController.text = personal['Restricciones'] ?? '';

      // Aquí puedes manejar el campo Estado que está anidado
      String estado = personal['Estado'] != null
          ? personal['Estado']['Nombre']
          : 'Desconocido';
      log('Estado del personal: $estado');
    } catch (e) {
      // Manejar errores en caso de fallos
      log('Error al buscar el personal: $e');
    }
  }

  // Función para manejar fechas en formato /Date(...)/
  String _parseJsonDate(String jsonDate) {
    if (jsonDate.isEmpty) return '';
    final timestamp = int.parse(jsonDate.replaceAll(RegExp(r'\D'), ''));
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.day}/${date.month}/${date.year}';
  }

  // Resetea los campos
  void resetControllers() {
    dniController.clear();
    nombresController.clear();
    puestoTrabajoController.clear();
    codigoController.clear();
    apellidoPaternoController.clear();
    apellidoMaternoController.clear();
    gerenciaController.clear();
    fechaIngresoController.clear();
    areaController.clear();
    codigoLicenciaController.clear();
    restriccionesController.clear();
  }
}
