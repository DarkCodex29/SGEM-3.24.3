import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sgem/config/api/api.maestro.detail.dart';
import 'package:sgem/config/api/api.personal.dart';
import 'package:sgem/shared/modules/personal.dart';

class PersonalSearchController extends GetxController {
  final codigoMCPController = TextEditingController();
  final documentoIdentidadController = TextEditingController();
  final nombresController = TextEditingController();
  final apellidosController = TextEditingController();

  final personalService = PersonalService();
  final maestroDetalleService = MaestroDetalleService();

  var showNewPersonalForm = false.obs;
  var showEditPersonalForm = false.obs;
  var showTrainingForm = false.obs;
  var isExpanded = true.obs;

  var personalResults = <Personal>[].obs;
  var guardiaOptions = <Map<String, dynamic>>[].obs;
  var selectedGuardiaKey = RxnInt();

  @override
  void onInit() {
    cargarGuardiaOptions();
    super.onInit();
  }

  Future<void> cargarGuardiaOptions() async {
    try {
      var result = await maestroDetalleService.listarMaestroDetalle();
      guardiaOptions.assignAll(result);
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
      var result = await personalService.listarPersonalEntrenamiento(
        codigoMcp: codigoMcp,
        numeroDocumento: numeroDocumento,
        nombres: nombres,
        apellidos: apellidos,
        inGuardia: selectedGuardiaKey.value,
        inEstado: null,
      );

      List<Personal> personalList =
          result.map<Personal>((item) => Personal.fromJson(item)).toList();
      personalResults.assignAll(personalList);

      isExpanded.value = false;
      log('Resultados obtenidos: ${personalResults.length}');
    } catch (e) {
      log('Error en la búsqueda: $e');
    }
  }

  Future<void> downloadExcel() async {
    // Lógica para descargar el Excel
  }

  void clearFields() {
    codigoMCPController.clear();
    documentoIdentidadController.clear();
    nombresController.clear();
    apellidosController.clear();
    selectedGuardiaKey.value = null;
  }

  void showNewPersonal() {
    showNewPersonalForm.value = true;
    showEditPersonalForm.value = false;
  }

  void showEditPersonal(Personal personal) {
    codigoMCPController.text = personal.codigoMcp;
    documentoIdentidadController.text = personal.numeroDocumento;
    nombresController.text =
        '${personal.primerNombre} ${personal.segundoNombre}';
    apellidosController.text =
        '${personal.apellidoPaterno} ${personal.apellidoMaterno}';

    showNewPersonalForm.value = false;
    showEditPersonalForm.value = true;
  }

  void showTraining() {
    showNewPersonalForm.value = false;
    showEditPersonalForm.value = false;
    showTrainingForm.value = true;
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}
