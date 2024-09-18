import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/modules/pages/personal%20training/new.personal.page.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';

class PersonalSearchPage extends StatefulWidget {
  PersonalSearchPage({super.key});

  @override
  State<PersonalSearchPage> createState() => _PersonalSearchPageState();
}

class _PersonalSearchPageState extends State<PersonalSearchPage> {
  final TextEditingController codigoMCPController = TextEditingController();
  final TextEditingController documentoIdentidadController =
      TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();

  bool showNewPersonalForm = false; // Variable para alternar entre vistas

  // Función para mostrar el formulario de "Nuevo Personal"
  Widget _buildNewPersonalForm() {
    return NuevoPersonalPage(); // Puedes modificar el contenido de esta página según tu diseño
  }

  // Función para mostrar la página de búsqueda de personal
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          showNewPersonalForm
              ? "Nuevo personal a Entrenar"
              : "Búsqueda de entrenamiento de personal",
          style: const TextStyle(
            color: AppTheme.backgroundBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.primaryBackground,
      ),
      body: showNewPersonalForm ? _buildNewPersonalForm() : _buildSearchPage(),
    );
  }

  // Sección del formulario de búsqueda
  Widget _buildFormSection(bool isSmallScreen) {
    return Container(
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
                      controller: codigoMCPController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Documento de identidad",
                      controller: documentoIdentidadController,
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      hintText: "Guardia",
                      options: ["A", "B", "C", "D", "Todos"],
                      isSearchable: false,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Nombres personal",
                      controller: nombresController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Apellidos personal",
                      controller: apellidosController,
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      hintText: "Estado",
                      options: ["Activo", "Inactivo", "Todos"],
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
                        controller: codigoMCPController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        label: "Documento de identidad",
                        controller: documentoIdentidadController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomDropdown(
                        hintText: "Guardia",
                        options: ["A", "B", "C", "D", "Todos"],
                        isSearchable: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          isSmallScreen
              ? Column(
                  children: [
                    CustomTextField(
                      label: "Nombres personal",
                      controller: nombresController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Apellidos personal",
                      controller: apellidosController,
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      hintText: "Estado",
                      options: ["Activo", "Inactivo", "Todos"],
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
                        controller: nombresController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        label: "Apellidos personal",
                        controller: apellidosController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomDropdown(
                        hintText: "Estado",
                        options: ["Activo", "Inactivo", "Todos"],
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
                onPressed: _clearFields, // Funcionalidad para limpiar campos
                icon: const Icon(
                  Icons.cleaning_services,
                  size: 18,
                  color: AppTheme.primaryText,
                ),
                label: const Text(
                  "Limpiar",
                  style: TextStyle(fontSize: 16, color: AppTheme.primaryText),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 49, vertical: 18),
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
                onPressed: () {
                  // Acción para buscar
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 49, vertical: 18),
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
    );
  }

  // Acción para limpiar los campos
  void _clearFields() {
    codigoMCPController.clear();
    documentoIdentidadController.clear();
    nombresController.clear();
    apellidosController.clear();
  }

  // Función que construye la sección de resultados
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Código MCP')),
                DataColumn(label: Text('Nombres personal')),
                DataColumn(label: Text('Documento de identidad')),
                DataColumn(label: Text('Guardia')),
                DataColumn(label: Text('Estado de vigencia de personal')),
                DataColumn(label: Text('Acciones')),
              ],
              rows: <DataRow>[
                _buildDataRow(
                    '2563', 'Randy Peterson', '47915139', 'A', 'Activo'),
                _buildDataRow(
                    '2563', 'Randy Peterson', '47915139', 'A', 'Inactivo'),
                _buildDataRow(
                    '2563', 'Randy Peterson', '47915139', 'A', 'Activo'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Botones de acción
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
        onPressed: () {
          // Acción para descargar Excel
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
            showNewPersonalForm =
                true; // Alterna a la vista del formulario de "Nuevo Personal"
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

  // Datos de la tabla
  DataRow _buildDataRow(String codigo, String nombre, String documento,
      String guardia, String estado) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(codigo)),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nombre),
            const Text(
              'Conductor Máquina Pesada',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        )),
        DataCell(Text(documento)),
        DataCell(Text(guardia)),
        DataCell(Row(
          children: [
            Icon(
              Icons.circle,
              color: estado == 'Activo' ? Colors.green : Colors.grey,
              size: 12,
            ),
            const SizedBox(width: 5),
            Text(estado),
          ],
        )),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Acción de editar
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  // Acción de borrar
                },
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  // Acción de ver detalles
                },
                icon: const Icon(Icons.visibility),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
