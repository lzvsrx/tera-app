import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedProfession = 'Desenvolvedor';

  final List<String> _professions = [
    'Desenvolvedor',
    'Designer',
    'Engenheiro',
    'Médico',
    'Advogado',
    'Professor',
    'Arquiteto',
    'Contador',
    'Vendedor',
    'Outro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [TeraTheme.darkBg, TeraTheme.darkBlueBg],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NOVO CADASTRO',
                    style: TeraTheme.themeData.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  _buildTextField(
                    controller: _nameController,
                    label: 'NOME COMPLETO',
                    icon: Icons.badge_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'E-MAIL',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'CHAVE DE ACESSO',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  _buildProfessionDropdown(),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      },
                      child: const Text('FINALIZAR CADASTRO'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'VOLTAR AO LOGIN',
                      style: GoogleFonts.orbitron(
                        color: TeraTheme.neonCyan,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: TeraTheme.darkBlueBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: TeraTheme.neonPurple.withOpacity(0.3)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: GoogleFonts.exo2(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: TeraTheme.neonPurple),
          labelText: label,
          labelStyle: GoogleFonts.orbitron(color: TeraTheme.metallicGrey, fontSize: 10),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildProfessionDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: TeraTheme.darkBlueBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: TeraTheme.neonCyan.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedProfession,
          isExpanded: true,
          dropdownColor: TeraTheme.darkBlueBg,
          icon: const Icon(Icons.keyboard_arrow_down, color: TeraTheme.neonCyan),
          items: _professions.map((String profession) {
            return DropdownMenuItem<String>(
              value: profession,
              child: Text(
                profession.toUpperCase(),
                style: GoogleFonts.orbitron(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedProfession = newValue!;
            });
          },
        ),
      ),
    );
  }
}
