import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file_explorer_screen.dart';
import '../models/profession_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'TERA DASHBOARD',
          style: GoogleFonts.orbitron(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: TeraTheme.neonCyan,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: TeraTheme.metallicSilver),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [TeraTheme.darkBg, TeraTheme.darkBlueBg],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(),
                const SizedBox(height: 32),
                Text(
                  'FERRAMENTAS DO AGENTE',
                  style: GoogleFonts.orbitron(
                    fontSize: 12,
                    color: TeraTheme.neonPurpleLight,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildToolCard(
                        icon: Icons.folder_special,
                        title: 'ARQUIVOS',
                        subtitle: 'Gestão Profissional',
                        color: TeraTheme.neonBlue,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FileExplorerScreen(
                                profession: ProfessionData.getByName(
                                  'Desenvolvedor',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      _buildToolCard(
                        icon: Icons.calendar_today,
                        title: 'AGENDA',
                        subtitle: 'Tarefas Diárias',
                        color: TeraTheme.neonPurple,
                      ),
                      _buildToolCard(
                        icon: Icons.analytics,
                        title: 'DADOS',
                        subtitle: 'Relatórios de Área',
                        color: TeraTheme.neonCyan,
                      ),
                      _buildToolCard(
                        icon: Icons.cloud_sync,
                        title: 'GITHUB SYNC',
                        subtitle: 'Backup Automático',
                        color: Colors.greenAccent,
                        onTap: () async {
                          // Simulação de salvamento de dados
                          final data = {
                            "user": "Agente TERA",
                            "profession": "Desenvolvedor",
                            "last_sync": DateTime.now().toIso8601String(),
                            "files": ["project_plan.pdf", "logo_v1.svg"],
                          };

                          // Mostrar loading ou snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sincronizando com GitHub...'),
                            ),
                          );

                          // Aqui chamaria o SyncService (comentado para evitar erro se backend não estiver rodando)
                          // await SyncService.saveData(data);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildStatusFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TeraTheme.darkBlueBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: TeraTheme.neonPurple.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: TeraTheme.neonPurple.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: TeraTheme.neonPurple,
            child: Icon(Icons.person, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BEM-VINDO, AGENTE',
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'ÁREA: DESENVOLVIMENTO',
                style: GoogleFonts.rajdhani(
                  fontSize: 12,
                  color: TeraTheme.neonCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: TeraTheme.darkBlueBg.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.rajdhani(
                  fontSize: 10,
                  color: TeraTheme.metallicGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'DB SYNC ACTIVE',
                style: GoogleFonts.rajdhani(
                  color: Colors.greenAccent,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'MADE BY LZWORLDSTECH',
            style: GoogleFonts.rajdhani(
              color: Colors.white.withOpacity(0.3),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
