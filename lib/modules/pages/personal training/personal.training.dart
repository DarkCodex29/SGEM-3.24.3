import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';

class PersonalSearchPage extends StatelessWidget {
  final TextEditingController codigoMCPController = TextEditingController();
  final TextEditingController documentoIdentidadController =
      TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();

  PersonalSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Búsqueda de entrenamiento de personal",
          style: TextStyle(
            color: AppTheme.backgroundBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.primaryBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFormSection(), // Sección del formulario
            const SizedBox(height: 20),
            _buildResultsSection(), // Sección de resultados
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300), // Borde gris suave
      ),
      child: Column(
        children: [
          Row(
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
          Row(
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
                onPressed: () {
                  // Acción para limpiar
                },
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

  Widget _buildResultsSection() {
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
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción para actualización masiva
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 18,
                      color: AppTheme.infoColor,
                    ),
                    label: const Text("Actualización masiva",
                        style:
                            TextStyle(fontSize: 16, color: AppTheme.infoColor)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 18),
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
                    icon: const Icon(Icons.download,
                        size: 18, color: AppTheme.primaryColor),
                    label: const Text("Descargar Excel",
                        style: TextStyle(
                            fontSize: 16, color: AppTheme.primaryColor)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 18),
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
                      // Acción para agregar nuevo personal
                    },
                    icon: const Icon(Icons.add,
                        size: 18, color: AppTheme.primaryBackground),
                    label: const Text("Nuevo personal",
                        style: TextStyle(
                            fontSize: 16, color: AppTheme.primaryBackground)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppTheme.primaryColor),
                      ),
                    ),
                  ),
                ],
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Items por página: "),
              DropdownButton<int>(
                value: 10,
                items: [10, 20, 50]
                    .map((item) => DropdownMenuItem<int>(
                          value: item,
                          child: Text(item.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Acción para cambiar la cantidad de items por página
                },
              ),
              const SizedBox(width: 20),
              Text("1 - 10 de 2001"),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  // Acción para ir a la página anterior
                },
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  // Acción para ir a la siguiente página
                },
              ),
            ],
          ),
        ],
      ),
    );
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
