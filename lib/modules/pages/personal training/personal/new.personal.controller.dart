import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sgem/config/api/api.personal.dart';
import 'package:sgem/shared/modules/personal.dart';

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
  final TextEditingController fechaIngresoMinaController =
      TextEditingController();
  final TextEditingController fechaRevalidacionController =
      TextEditingController();
  final TextEditingController operacionMinaController = TextEditingController();
  final TextEditingController zonaPlataformaController =
      TextEditingController();
  final TextEditingController restriccionesController = TextEditingController();

  final PersonalService personalService = PersonalService();
  Personal? personalData;

  Future<void> buscarPersonalPorDni(String dni) async {
    try {
      final personalJson = await personalService.buscarPersonalPorDni(dni);
      personalData = Personal.fromJson(personalJson);

      _llenarControladores(personalData!);
    } catch (e) {
      log('Error al buscar el personal: $e');
    }
  }

  void _llenarControladores(Personal personal) {
    dniController.text = personal.numeroDocumento;
    nombresController.text =
        '${personal.primerNombre} ${personal.segundoNombre}';
    puestoTrabajoController.text = personal.cargo;
    codigoController.text = personal.codigoMcp;
    apellidoPaternoController.text = personal.apellidoPaterno;
    apellidoMaternoController.text = personal.apellidoMaterno;
    gerenciaController.text = personal.gerencia;
    fechaIngresoController.text = _formatDate(personal.fechaIngreso!);
    areaController.text = personal.area;
    codigoLicenciaController.text = personal.licenciaCategoria;
    restriccionesController.text = personal.restricciones;
    operacionMinaController.text = personal.operacionMina;
    zonaPlataformaController.text = personal.zonaPlataforma;
    fechaIngresoMinaController.text = _formatDate(personal.fechaIngresoMina!);
    fechaRevalidacionController.text =
        _formatDate(personal.licenciaVencimiento!);
  }

  Future<void> registrarPersona() async {
    try {
      if (personalData != null) {
        personalData!
          ..primerNombre = nombresController.text.split(' ').first
          ..segundoNombre = nombresController.text.split(' ').length > 1
              ? nombresController.text.split(' ')[1]
              : ''
          ..cargo = puestoTrabajoController.text
          ..codigoMcp = codigoController.text
          ..apellidoPaterno = apellidoPaternoController.text
          ..apellidoMaterno = apellidoMaternoController.text
          ..gerencia = gerenciaController.text
          ..fechaIngreso = DateTime.now()
          ..area = areaController.text
          ..licenciaCategoria = codigoLicenciaController.text
          ..restricciones = restriccionesController.text
          ..operacionMina = operacionMinaController.text
          ..zonaPlataforma = zonaPlataformaController.text
          ..fechaIngresoMina = DateTime.parse(fechaIngresoMinaController.text)
          ..licenciaVencimiento =
              DateTime.parse(fechaRevalidacionController.text);

        final result =
            await personalService.registrarPersona(personalData!.toJson());
        log('Persona registrada exitosamente: ${result['Key']}');
      }
    } catch (e) {
      log('Error al registrar persona: $e');
    }
  }

  String _formatDate(DateTime date) {
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
    fechaIngresoMinaController.clear();
    fechaRevalidacionController.clear();
    operacionMinaController.clear();
    zonaPlataformaController.clear();
    restriccionesController.clear();
  }
}
