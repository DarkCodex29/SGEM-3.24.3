import 'package:flutter/material.dart';

class PersonalSearchController {
  // Controladores de los TextField
  final TextEditingController codigoMCPController = TextEditingController();
  final TextEditingController documentoIdentidadController = TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();

  // Variables de estado
  bool showNewPersonalForm = false;
  bool showEditPersonalForm = false;
  bool showTrainingForm = false;
  bool isExpanded = true;

  // Métodos para manejar la expansión y limpieza de los campos
  void toggleExpansion() {
    isExpanded = !isExpanded;
  }

  void clearFields() {
    codigoMCPController.clear();
    documentoIdentidadController.clear();
    nombresController.clear();
    apellidosController.clear();
  }

  // Método para cambiar el estado y mostrar el formulario de nuevo personal
  void showNewPersonal() {
    showNewPersonalForm = true;
    showEditPersonalForm = false;
  }

  // Método para cambiar el estado y mostrar el formulario de editar personal
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