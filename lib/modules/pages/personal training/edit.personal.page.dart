import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';

class EditPersonalPage extends StatelessWidget {
  final TextEditingController dniController;
  final TextEditingController codigoLicenciaController;
  final TextEditingController restriccionesController;

  // Constructor que acepta valores iniciales opcionales
  EditPersonalPage({
    super.key,
    String? dni,
    String? codigoLicencia,
    String? restricciones,
  })  : dniController = TextEditingController(text: dni),
        codigoLicenciaController = TextEditingController(text: codigoLicencia),
        restriccionesController = TextEditingController(text: restricciones);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildDatosAdicionalesSection(),
            const SizedBox(height: 30),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  // Header section with personal details
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          const Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
                radius: 95,
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 12),
                  SizedBox(width: 5),
                  Text(
                    "Activo",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 30),
          // Rest of the details in columns
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: "DNI",
                            controller: dniController,
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Nombres",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "Raul Antonio",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Puesto de Trabajo",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "Operador Equipo Pesado",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: "Código Licencia",
                            controller: codigoLicenciaController,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Apellido Paterno",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "Alania",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Gerencia",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "Mina",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20), // Espaciado entre columnas
                    // Columna 3 (Fecha de Ingreso, Apellido Materno, Área)
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fecha Ingreso",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "10-05-2024",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Apellido Materno",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Chuco",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Área",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Operaciones Mina",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatosAdicionalesSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos adicionales",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Categoría Licencia"),
                    CustomDropdown(
                      hintText: "Categoría Licencia",
                      options: const ["A", "B", "C", "D"],
                      isSearchable: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Código Licencia",
                  controller: codigoLicenciaController,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Fecha Ingreso a Mina",
                  controller: TextEditingController(),
                  icon: Icons.calendar_today,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Fecha de Revalidación",
                  controller: TextEditingController(),
                  icon: Icons.calendar_today,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomDropdown(
                  hintText: "Guardia",
                  options: const ["Mañana", "Tarde", "Noche"],
                  isSearchable: false,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Restricciones",
                  controller: restriccionesController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildArchivoSection(),
        ],
      ),
    );
  }

  // Sección para adjuntar archivo
  Widget _buildArchivoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Adjuntar archivo:", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.attach_file, color: Colors.grey),
            const Text("(Archivo adjunto peso máx: 4MB)",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 20),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.red),
              label: const Text("Documento.pdf",
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    );
  }

  // Botones de acción
  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.grey),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          ),
          child: const Text("Cancelar", style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            // Lógica para guardar los datos editados
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          ),
          child: const Text("Guardar", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
