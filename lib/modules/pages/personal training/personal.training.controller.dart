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
  var showViewPersonalForm = false.obs;
  var isExpanded = true.obs;

  var personalResults = <Personal>[].obs;
  var selectedPersonal = Rxn<Personal>();
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
    selectedPersonal.value = Personal(
      key: 0,
      tipoPersona: "",
      inPersonalOrigen: 0,
      licenciaConducir: "",
      operacionMina: "",
      zonaPlataforma: "",
      restricciones: "",
      usuarioRegistro: "",
      usuarioModifica: "",
      codigoMcp: "",
      nombreCompleto: "",
      cargo: "",
      numeroDocumento: "",
      guardia: Guardia(key: 0, nombre: ""),
      estado: Estado(key: 0, nombre: ""),
      eliminado: "",
      motivoElimina: "",
      usuarioElimina: "",
      apellidoPaterno: "",
      apellidoMaterno: "",
      primerNombre: "",
      segundoNombre: "",
      fechaIngreso: null,
      licenciaCategoria: "",
      licenciaVencimiento: null,
      gerencia: "",
      area: "",
    );

    showNewPersonalForm.value = true;
    showEditPersonalForm.value = false;
    showViewPersonalForm.value = false;
  }

  void showEditPersonal(Personal personal) {
    selectedPersonal.value = personal;

    showNewPersonalForm.value = false;
    showEditPersonalForm.value = true;
    showViewPersonalForm.value = false;
  }

  void showViewPersonal(Personal personal) {
    selectedPersonal.value = personal;

    showNewPersonalForm.value = false;
    showEditPersonalForm.value = false;
    showViewPersonalForm.value = true;
  }

  void hideForms() {
    showNewPersonalForm.value = false;
    showEditPersonalForm.value = false;
    showViewPersonalForm.value = false;
    showTrainingForm.value = false;
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void showTraining() {
    showNewPersonalForm.value = false;
    showEditPersonalForm.value = false;
    showViewPersonalForm.value = false;
    showTrainingForm.value = true;
  }
}
