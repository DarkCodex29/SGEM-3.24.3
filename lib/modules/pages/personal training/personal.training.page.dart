import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/modules/pages/personal%20training/personal/new.personal.page.dart';
import 'package:sgem/modules/pages/personal%20training/personal.training.controller.dart';
import 'package:sgem/modules/pages/personal%20training/training/training.personal.page.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';
import 'package:sgem/shared/widgets/widget.delete.motivo.dart';

class PersonalSearchPage extends StatefulWidget {
  const PersonalSearchPage({super.key});

  @override
  State<PersonalSearchPage> createState() => _PersonalSearchPageState();
}

class _PersonalSearchPageState extends State<PersonalSearchPage> {
  final PersonalSearchController controller = PersonalSearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.showNewPersonalForm
              ? "Nuevo personal a Entrenar"
              : controller.showEditPersonalForm
                  ? "Editar personal"
                  : controller.showTrainingForm
                      ? "Entrenamientos"
                      : "Búsqueda de entrenamiento de personal",
          style: const TextStyle(
            color: AppTheme.backgroundBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.primaryBackground,
      ),
      body: controller.showNewPersonalForm || controller.showEditPersonalForm
          ? _buildNewPersonalForm()
          : controller.showTrainingForm
              ? const TrainingPersonalPage()
              : _buildSearchPage(),
    );
  }

  Widget _buildNewPersonalForm() {
    return NuevoPersonalPage(
      isEditing: controller.showEditPersonalForm,
      dniController: controller.documentoIdentidadController,
      nombresController: controller.nombresController,
      apellidosController: controller.apellidosController,
      codigoMCPController: controller.codigoMCPController,
      onCancel: _handleCancel,
    );
  }

  void _handleCancel() {
    setState(() {
      controller.showNewPersonalForm = false;
      controller.showEditPersonalForm = false;
      controller.showTrainingForm = false;
    });
  }

  Widget _buildSearchPage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildFormSection(isSmallScreen),
              const SizedBox(height: 20),
              _buildResultsSection(isSmallScreen),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormSection(bool isSmallScreen) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white),
      ),
      title: const Text(
        "Filtro de búsqueda",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: controller.isExpanded,
      onExpansionChanged: (value) {
        setState(() {
          controller.toggleExpansion();
        });
      },
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              isSmallScreen
                  ? Column(
                      children: [
                        CustomTextField(
                          label: "Código MCP",
                          controller: controller.codigoMCPController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: "Documento de identidad",
                          controller: controller.documentoIdentidadController,
                        ),
                        const SizedBox(height: 10),
                        _buildDropdownGuardia(),
                        /*
                        CustomDropdown(
                          hintText: "Guardia",
                          options: const ["A", "B", "C", "D", "Todos"],
                          isSearchable: false,
                          onChanged: (value) {},
                        ),*/
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: "Nombres personal",
                          controller: controller.nombresController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: "Apellidos personal",
                          controller: controller.apellidosController,
                        ),
                        const SizedBox(height: 10),
                        CustomDropdown(
                          hintText: "Estado",
                          options: const ["Activo", "Inactivo", "Todos"],
                          isSearchable: false,
                          onChanged: (value) {},
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Código MCP",
                            controller: controller.codigoMCPController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            label: "Documento de identidad",
                            controller: controller.documentoIdentidadController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildDropdownGuardia(),
                          /*
                          CustomDropdown(
                            hintText: "Guardia",
                            options: const ["A", "B", "C", "D", "Todos"],
                            isSearchable: false,
                            onChanged: (value) {},
                          ),
                        */
                        ),
                      ],
                    ),
              const SizedBox(height: 10),
              isSmallScreen
                  ? Column(
                      children: [
                        CustomTextField(
                          label: "Nombres personal",
                          controller: controller.nombresController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: "Apellidos personal",
                          controller: controller.apellidosController,
                        ),
                        const SizedBox(height: 10),
                        CustomDropdown(
                          hintText: "Estado",
                          options: const ["Activo", "Inactivo", "Todos"],
                          isSearchable: false,
                          onChanged: (value) {},
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Nombres personal",
                            controller: controller.nombresController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            label: "Apellidos personal",
                            controller: controller.apellidosController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomDropdown(
                            hintText: "Estado",
                            options: const ["Activo", "Inactivo", "Todos"],
                            isSearchable: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: controller.clearFields,
                    icon: const Icon(
                      Icons.cleaning_services,
                      size: 18,
                      color: AppTheme.primaryText,
                    ),
                    label: const Text(
                      "Limpiar",
                      style:
                          TextStyle(fontSize: 16, color: AppTheme.primaryText),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 49, vertical: 18),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppTheme.alternateColor),
                      ),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await controller.searchPersonal();
                      setState(() {
                        controller.isExpanded = false;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Buscar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 49, vertical: 18),
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownGuardia() {
    return FutureBuilder(
      future: controller.cargarGuardiaOptions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return const Text('Error al cargar las opciones');
        } else {
          List<Map<String, dynamic>> options = controller.guardiaOptions;

          return CustomDropdown(
            hintText: 'Selecciona Guardia',
            options:
                options.map((option) => option['Valor'].toString()).toList(),
            selectedValue: controller.selectedGuardiaKey != null
                ? options.firstWhere((option) =>
                    option['Key'] == controller.selectedGuardiaKey)['Valor']
                : null,
            isSearchable: false,
            isRequired: false,
            onChanged: (value) {
              final selectedOption = options.firstWhere(
                (option) => option['Valor'] == value,
                orElse: () => {},
              );
              setState(() {
                controller.selectedGuardiaKey = selectedOption['Key'];
              });
              log('Guardia seleccionada - Key: ${controller.selectedGuardiaKey}, Valor: $value');
            },
          );
        }
      },
    );
  }

  Widget _buildResultsSection(bool isSmallScreen) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Personal",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (isSmallScreen)
                Column(
                  children: _buildActionButtons(),
                )
              else
                Row(
                  children: _buildActionButtons(),
                ),
            ],
          ),
          const SizedBox(height: 10),
          _buildResultsTable(),
        ],
      ),
    );
  }

  List<Widget> _buildActionButtons() {
    return [
      ElevatedButton.icon(
        onPressed: () {
          // Acción para actualización masiva
        },
        icon: const Icon(
          Icons.refresh,
          size: 18,
          color: AppTheme.infoColor,
        ),
        label: const Text(
          "Actualización masiva",
          style: TextStyle(fontSize: 16, color: AppTheme.infoColor),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppTheme.primaryColor),
          ),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton.icon(
        onPressed: () async {
          await controller.downloadExcel();
        },
        icon:
            const Icon(Icons.download, size: 18, color: AppTheme.primaryColor),
        label: const Text(
          "Descargar Excel",
          style: TextStyle(fontSize: 16, color: AppTheme.primaryColor),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppTheme.primaryColor),
          ),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            controller.showNewPersonal();
          });
        },
        icon:
            const Icon(Icons.add, size: 18, color: AppTheme.primaryBackground),
        label: const Text(
          "Nuevo personal",
          style: TextStyle(fontSize: 16, color: AppTheme.primaryBackground),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppTheme.primaryColor),
          ),
        ),
      ),
    ];
  }

  Widget _buildResultsTable() {
    return controller.personalResults.isEmpty
        ? const Center(child: Text("No se encontraron resultados"))
        : DataTable(
            headingRowHeight: 40,
            columns: const [
              DataColumn(label: Text('Código MCP')),
              DataColumn(label: Text('Nombre completo')),
              DataColumn(label: Text('Documento de identidad')),
              DataColumn(label: Text('Guardia')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Acciones')),
            ],
            rows: controller.personalResults.map((personal) {
              return DataRow(cells: [
                DataCell(Text(personal['CodigoMcp'] ?? '')),
                DataCell(Text(personal['NombreCompleto'] ?? '')),
                DataCell(Text(personal['NumeroDocumento'] ?? '')),
                DataCell(Text(personal['Guardia'] != null
                    ? personal['Guardia']['Nombre']
                    : '')),
                DataCell(Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: personal['Estado']['Nombre'] == 'Activo'
                          ? Colors.green
                          : Colors.grey,
                      size: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(personal['Estado']['Nombre'] ?? ''),
                  ],
                )),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: AppTheme.primaryColor,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          controller.showEditPersonal();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: AppTheme.errorColor,
                        size: 18,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: const EliminarMotivoWidget(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.model_training_sharp,
                        color: AppTheme.warningColor,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          controller.showTraining();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.credit_card_rounded,
                        color: AppTheme.greenColor,
                        size: 18,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: AppTheme.primaryColor,
                        size: 18,
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                  ],
                )),
              ]);
            }).toList(),
          );
  }
}
