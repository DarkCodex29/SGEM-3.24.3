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
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: CustomTextField(
                              label: "DNI",
                              controller: dniController,
                              icon: Icons.search,
                            ),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Código",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "10254",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Apellido Paterno",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Alania",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Gerencia",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Mina",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
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
                child: CustomDropdown(
                  hintText: "Categoría Licencia",
                  options: const ["A", "B", "C", "D"],
                  isSearchable: false,
                  onChanged: (value) {},
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Código de licencia",
                  controller: codigoLicenciaController,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Fecha ingreso a mina",
                  controller: TextEditingController(),
                  icon: Icons.calendar_today,
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  label: "Fecha de revalidación",
                  controller: TextEditingController(),
                  icon: Icons.calendar_today,
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomDropdown(
                  hintText: "Guardia",
                  options: const ["Mañana", "Tarde", "Noche"],
                  isSearchable: false,
                  onChanged: (value) {},
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("Autorizado para operar en:"),
              ),
              const Expanded(
                child: Row(
                  children: [
                    Checkbox(value: true, onChanged: null),
                    Text("Operaciones mina"),
                  ],
                ),
              ),
              const Expanded(
                child: Row(
                  children: [
                    Checkbox(value: true, onChanged: null),
                    Text("Zonas o plataforma"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Restricciones"),
          CustomTextField(
            label: "Restricciones",
            controller: restriccionesController,
          ),
          const SizedBox(height: 20),
          _buildArchivoSection(),
        ],
      ),
    );
  }

  Widget _buildArchivoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.attach_file, color: Colors.grey),
            SizedBox(width: 10),
            Text("Adjuntar archivo:"),
            SizedBox(width: 10),
            Text(
              "(Archivo adjunto peso máx: 4MB)",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.red),
              label: const Text("Ficha-modulo.jpg",
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
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
