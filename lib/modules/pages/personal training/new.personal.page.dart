import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';
import 'package:sgem/shared/widgets/custom.dropdown.dart';
import 'package:sgem/shared/widgets/custom.textfield.dart';

class NuevoPersonalPage extends StatelessWidget {
  final TextEditingController dniController = TextEditingController();
  final TextEditingController codigoLicenciaController =
      TextEditingController();
  final TextEditingController restriccionesController = TextEditingController();

  NuevoPersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0), // Se incrementa el padding general
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30), // Más espacio entre secciones
            _buildDatosAdicionalesSection(),
            const SizedBox(height: 30), // Más espacio entre secciones
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  // Header section with personal details
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20.0), // Se incrementa el padding interno
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Column(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
                radius: 95, // Tamaño 190x190
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
          const SizedBox(width: 30), // Más separación entre avatar y contenido
          // Rest of the details in columns
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    // Columna 1 (DNI, Nombres, Puesto de Trabajo)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200, // Se reduce el tamaño del campo DNI
                            child: CustomTextField(
                              label: "DNI",
                              controller: dniController,
                              icon: Icons.search,
                            ),
                          ),
                          const SizedBox(height: 15), // Mayor separación
                          const Text(
                            "Nombres",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "Raul Antonio",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 15), // Mayor separación
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
                    const SizedBox(width: 20), // Espaciado entre columnas
                    // Columna 2 (Código, Apellido Paterno, Gerencia)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Código",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Text(
                            "10254",
                            style: TextStyle(fontSize: 14),
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
                    Row(
                      children: [
                        const Text("Categoría Licencia"),
                        const Text("*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    CustomDropdown(
                      hintText: "Categoría Licencia",
                      options: ["A", "B", "C", "D"],
                      isSearchable: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(""),
                        const Text("*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    CustomTextField(
                      label: "Código Licencia",
                      controller: codigoLicenciaController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(""),
                        const Text("*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    CustomTextField(
                      label: "Fecha Ingreso a Mina",
                      controller: TextEditingController(),
                      icon: Icons.calendar_today,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(""),
                        const Text("*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    CustomTextField(
                      label: "Fecha de Revalidación",
                      controller: TextEditingController(),
                      icon: Icons.calendar_today,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(""),
                        const Text("*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    CustomDropdown(
                      hintText: "Guardia",
                      options: ["Mañana", "Tarde", "Noche"],
                      isSearchable: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Restricciones"),
                    CustomTextField(
                      label: "Restricciones",
                      controller: restriccionesController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Autorizado para operar en:"),
          Row(
            children: [
              Checkbox(
                value: true, // valor verdadero como ejemplo
                onChanged: (bool? value) {},
              ),
              const Text("Operaciones mina"),
              const SizedBox(width: 20),
              Checkbox(
                value: true, // valor verdadero como ejemplo
                onChanged: (bool? value) {},
              ),
              const Text("Zonas o plataforma"),
            ],
          ),
          const SizedBox(height: 20),
          _buildArchivoSection(), // Adjuntar archivo como una sección
        ],
      ),
    );
  }

  Widget _buildArchivoSection() {
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
          const Text("Adjuntar archivo:", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.attach_file, color: Colors.grey),
              const Text(
                "(Archivo adjunto peso máx: 4MB)",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 20),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close, color: Colors.red),
                label: const Text("Ficha-modulo.jpg",
                    style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
            // Acción de guardar personal
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
