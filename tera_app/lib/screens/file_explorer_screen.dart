import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../models/profession_data.dart';

class FileExplorerScreen extends StatelessWidget {
  final ProfessionPreset profession;

  const FileExplorerScreen({super.key, required this.profession});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARQUIVOS: ${profession.name.toUpperCase()}', 
          style: GoogleFonts.orbitron(fontSize: 14, color: TeraTheme.neonCyan)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [TeraTheme.darkBg, TeraTheme.darkBlueBg],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FORMATOS SUPORTADOS', 
                style: GoogleFonts.rajdhani(color: TeraTheme.metallicSilver, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: profession.fileTypes.map((ext) => Chip(
                  label: Text(ext, style: const TextStyle(fontSize: 10, color: Colors.white)),
                  backgroundColor: TeraTheme.neonPurple.withOpacity(0.3),
                  side: const BorderSide(color: TeraTheme.neonPurple),
                )).toList(),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Simulação de arquivos
                  itemBuilder: (context, index) {
                    return _buildFileItem(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: TeraTheme.neonPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildFileItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: TeraTheme.darkBlueBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TeraTheme.neonBlue.withOpacity(0.2)),
      ),
      child: ListTile(
        leading: const Icon(Icons.insert_drive_file, color: TeraTheme.neonBlue),
        title: Text('Documento_Agente_${index + 1}', 
          style: GoogleFonts.exo2(color: Colors.white, fontSize: 14)),
        subtitle: Text('Sincronizado em: 10/05/2026', 
          style: GoogleFonts.rajdhani(color: TeraTheme.metallicGrey, fontSize: 12)),
        trailing: const Icon(Icons.more_vert, color: TeraTheme.metallicSilver),
      ),
    );
  }
}
