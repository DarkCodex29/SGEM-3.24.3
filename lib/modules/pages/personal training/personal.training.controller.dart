import 'dart:developer';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:sgem/config/api/api.maestro.detail.dart';
import 'package:sgem/config/api/api.personal.dart';

class PersonalSearchController {
  final TextEditingController codigoMCPController = TextEditingController();
  final TextEditingController documentoIdentidadController =
      TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();

  final PersonalService personalService = PersonalService();
  final MaestroDetalleService maestroDetalleService = MaestroDetalleService();

  bool showNewPersonalForm = false;
  bool showEditPersonalForm = false;
  bool showTrainingForm = false;
  bool isExpanded = true;

  List<Map<String, dynamic>> personalResults = [];
  List<Map<String, dynamic>> guardiaOptions = [];
  int? selectedGuardiaKey;

  Future<void> cargarGuardiaOptions() async {
    try {
      guardiaOptions = await maestroDetalleService.listarMaestroDetalle();
      log('Guardia opciones: $guardiaOptions');
    } catch (e) {
      log('Error cargando la data de guardia maestro: $e');
    }
  }

  Future<void> searchPersonal() async {
    String? codigoMcp =
        codigoMCPController.text.isEmpty ? null : codigoMCPController.text;
    String? numeroDocumento = documentoIdentidadController.text.isEmpty
        ? null
        : documentoIdentidadController.text;
    String? nombres =
        nombresController.text.isEmpty ? null : nombresController.text;
    String? apellidos =
        apellidosController.text.isEmpty ? null : apellidosController.text;

    try {
      personalResults = await personalService.listarPersonalEntrenamiento(
        codigoMcp: codigoMcp,
        numeroDocumento: numeroDocumento,
        nombres: nombres,
        apellidos: apellidos,
        inGuardia: selectedGuardiaKey,
        inEstado: null,
      );
      toggleExpansion();
      log('Response: $personalResults');
      log('Resultados obtenidos: ${personalResults.length}');
    } catch (e) {
      log('Error en la búsqueda: $e');
    }
  }

  Future<void> downloadExcel() async {
    var excel = Excel.createExcel();
  }

  void toggleExpansion() {
    isExpanded = !isExpanded;
  }

  void clearFields() {
    codigoMCPController.clear();
    documentoIdentidadController.clear();
    nombresController.clear();
    apellidosController.clear();
    selectedGuardiaKey = null;
  }

  void showNewPersonal() {
    showNewPersonalForm = true;
    showEditPersonalForm = false;
  }

  void showEditPersonal() {
    showNewPersonalForm = false;
    showEditPersonalForm = true;
  }

  void showTraining() {
    showNewPersonalForm = false;
    showEditPersonalForm = false;
    showTrainingForm = true;
  }
}
