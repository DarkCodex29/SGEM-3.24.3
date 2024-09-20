import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/modules/pages/personal%20training/edit.personal.page.dart';
import 'package:sgem/modules/pages/personal%20training/new.personal.page.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';
import 'package:sgem/shared/widgets/widget.delete.motivo.dart';

class PersonalSearchPage extends StatefulWidget {
  const PersonalSearchPage({super.key});

  @override
  State<PersonalSearchPage> createState() => _PersonalSearchPageState();
}

class _PersonalSearchPageState extends State<PersonalSearchPage> {
  final TextEditingController codigoMCPController = TextEditingController();
  final TextEditingController documentoIdentidadController =
      TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();

  bool showNewPersonalForm = false;
  bool showEditPersonalForm = false;
  bool _isExpanded = true;

  Widget _buildNewPersonalForm() {
    return NuevoPersonalPage();
  }

  Widget _buildEditPersonalForm() {
    return EditPersonalPage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          showNewPersonalForm
              ? "Nuevo personal a Entrenar"
              : showEditPersonalForm
                  ? "Editar personal"
                  : "Búsqueda de entrenamiento de personal",
          style: const TextStyle(
            color: AppTheme.backgroundBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.primaryBackground,
      ),
      body: showNewPersonalForm
          ? _buildNewPersonalForm()
          : showEditPersonalForm
              ? _buildEditPersonalForm()
              : _buildSearchPage(),
    );
  }

  Widget _buildFormSection(bool isSmallScreen) {
    return ExpansionTile(
      title: const Text(
        "Filtro de búsqueda",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: _isExpanded,
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
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
                          options: const ["A", "B", "C", "D", "Todos"],
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
                            options: const ["A", "B", "C", "D", "Todos"],
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
                    onPressed: _clearFields,
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
                    onPressed: () {
                      setState(() {
                        _isExpanded = false;
                      });
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

  void _clearFields() {
    codigoMCPController.clear();
    documentoIdentidadController.clear();
    nombresController.clear();
    apellidosController.clear();
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
            showNewPersonalForm = true;
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
        DataCell(Expanded(
          flex: 3,
          child: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Botón Editar
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: AppTheme.primaryColor, // Define color primario
                        size: 18,
                      ),
                      onPressed: () {
                        // Navegar a la página de editar personal
                        Navigator.of(context).pushNamed('EditarPersonal');
                      },
                    ),
                  ),
                ),
                // Botón Eliminar
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: AppTheme.errorColor,
                        size: 18,
                      ),
                      onPressed: () async {
                        // Mostrar el modal para eliminar el personal
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
                  ),
                ),
                // Botón Entrenamientos
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.model_training_sharp,
                        color: AppTheme.warningColor,
                        size: 18,
                      ),
                      onPressed: () {
                        // Navegar a la página de entrenamientos
                        Navigator.of(context).pushNamed('Entrenamientos');
                      },
                    ),
                  ),
                ),
                // Botón VCanet (Ver carnet)
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.credit_card_rounded,
                        color: AppTheme.greenColor,
                        size: 18,
                      ),
                      onPressed: () {
                        // Navegar a la página de VCanet
                        Navigator.of(context).pushNamed('VCanet');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ingrese el motivo de la eliminación:',
                      style: TextStyle(
                          fontSize: 16, color: AppTheme.backgroundBlue),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade400),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                        ),
                        child: const Text(
                          'Cerrar',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                        ),
                        child: const Text(
                          'Eliminar',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
