import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  // Logo Placeholder
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: TeraTheme.neonPurple.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: TeraTheme.darkBlueBg,
                          child: const Icon(Icons.rocket_launch, size: 60, color: TeraTheme.neonPurple),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'TERA',
                    style: TeraTheme.themeData.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Agente Pessoal de Serviço',
                    style: GoogleFonts.rajdhani(
                      color: TeraTheme.neonCyan,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 48),
                  _buildTextField(
                    controller: _emailController,
                    label: 'ID DE ACESSO',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'CHAVE DE SEGURANÇA',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navegar para Home (Simulação de login)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      },
                      child: const Text('INICIAR SESSÃO'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      'NOVO CADASTRO',
                      style: GoogleFonts.orbitron(
                        color: TeraTheme.neonCyan,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'FEITO POR LZWORLDSTECH',
                    style: GoogleFonts.rajdhani(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 10,
                      letterSpacing: 2,
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
}
