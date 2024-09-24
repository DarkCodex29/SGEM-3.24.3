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
  Map<String, dynamic> additionalData = {};

  Future<void> buscarPersonalPorDni(String dni) async {
    try {
      final personal = await personalService.buscarPersonalPorDni(dni);

      nombresController.text =
          '${personal['PrimerNombre'] ?? ''} ${personal['SegundoNombre'] ?? ''}';
      puestoTrabajoController.text = personal['Cargo'] ?? '';
      codigoController.text = personal['CodigoMcp'] ?? '';
      apellidoPaternoController.text = personal['ApellidoPaterno'] ?? '';
      apellidoMaternoController.text = personal['ApellidoMaterno'] ?? '';
      gerenciaController.text = personal['Gerencia'] ?? '';
      fechaIngresoController.text = _parseJsonDate(personal['FechaIngreso']);
      areaController.text = personal['Area'] ?? '';
      codigoLicenciaController.text = personal['LicenciaCategoria'] ?? '';
      restriccionesController.text = personal['Restricciones'] ?? '';

      additionalData = {
        "TipoPersona": personal['TipoPersona'] ?? '',
        "InPersonalOrigen": personal['InPersonalOrigen'] ?? 0,
        "FechaIngresoMina": personal['FechaIngresoMina'] ?? '',
        "LicenciaConducir": personal['LicenciaConducir'] ?? '',
        "OperacionMina": personal['OperacionMina'] ?? '',
        "ZonaPlataforma": personal['ZonaPlataforma'] ?? '',
        "UsuarioRegistro": personal['UsuarioRegistro'] ?? '',
        "Estado": personal['Estado'] ?? {},
        "Eliminado": personal['Eliminado'] ?? '',
        "MotivoElimina": personal['MotivoElimina'] ?? '',
        "UsuarioElimina": personal['UsuarioElimina'] ?? '',
      };

      String estado = personal['Estado'] != null
          ? personal['Estado']['Nombre']
          : 'Desconocido';
      log('Estado del personal: $estado');
    } catch (e) {
      log('Error al buscar el personal: $e');
    }
  }

  Future<void> registrarPersona() async {
    try {
      final data = {
        "Key": 0,
        "TipoPersona": additionalData['TipoPersona'] ?? "",
        "InPersonalOrigen": additionalData['InPersonalOrigen'] ?? 0,
        "FechaIngresoMina": additionalData['FechaIngresoMina'] ?? "",
        "LicenciaConducir": additionalData['LicenciaConducir'] ?? "",
        "OperacionMina": additionalData['OperacionMina'] ?? "",
        "ZonaPlataforma": additionalData['ZonaPlataforma'] ?? "",
        "Restricciones": restriccionesController.text,
        "UsuarioRegistro": additionalData['UsuarioRegistro'] ?? "",
        "UsuarioModifica": "",
        "CodigoMcp": codigoController.text,
        "NombreCompleto":
            '${nombresController.text} ${apellidoPaternoController.text} ${apellidoMaternoController.text}',
        "Cargo": puestoTrabajoController.text,
        "NumeroDocumento": dniController.text,
        "Guardia": {"Key": 0, "Nombre": ""},
        "Estado": additionalData['Estado'] ?? {"Key": 0, "Nombre": ""},
        "Eliminado": additionalData['Eliminado'] ?? '',
        "MotivoElimina": additionalData['MotivoElimina'] ?? '',
        "UsuarioElimina": additionalData['UsuarioElimina'] ?? '',
        "ApellidoPaterno": apellidoPaternoController.text,
        "ApellidoMaterno": apellidoMaternoController.text,
        "PrimerNombre": nombresController.text.split(' ')[0],
        "SegundoNombre": nombresController.text.split(' ').length > 1
            ? nombresController.text.split(' ')[1]
            : '',
        "FechaIngreso": DateTime.now().toIso8601String(),
        "LicenciaCategoria": codigoLicenciaController.text,
        "LicenciaVencimiento":
            DateTime.now().add(const Duration(days: 365)).toIso8601String(),
        "Gerencia": gerenciaController.text,
        "Area": areaController.text
      };

      final result = await personalService.registrarPersona(data);
      log('Persona registrada exitosamente: ${result['Key']}');
    } catch (e) {
      log('Error al registrar persona: $e');
    }
  }

  String _parseJsonDate(String jsonDate) {
    if (jsonDate.isEmpty) return '';
    final timestamp = int.parse(jsonDate.replaceAll(RegExp(r'\D'), ''));
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.day}/${date.month}/${date.year}';
  }

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
