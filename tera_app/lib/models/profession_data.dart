class ProfessionPreset {
  final String name;
  final List<String> tools;
  final List<String> fileTypes;
  final String icon;

  ProfessionPreset({
    required this.name,
    required this.tools,
    required this.fileTypes,
    required this.icon,
  });
}

class ProfessionData {
  static List<ProfessionPreset> presets = [
    ProfessionPreset(
      name: 'Desenvolvedor',
      tools: ['IDE', 'Terminal', 'Git Console', 'API Debugger'],
      fileTypes: ['.dart', '.py', '.js', '.json', '.md'],
      icon: 'code',
    ),
    ProfessionPreset(
      name: 'Designer',
      tools: ['Paleta de Cores', 'Editor de Vetores', 'Moodboard', 'Assets Manager'],
      fileTypes: ['.png', '.jpg', '.svg', '.fig', '.ai'],
      icon: 'brush',
    ),
    ProfessionPreset(
      name: 'Médico',
      tools: ['Prontuários', 'Agenda de Consultas', 'Calculadora de Doses', 'Biblioteca CID'],
      fileTypes: ['.pdf', '.docx', '.jpg', '.dcm'],
      icon: 'medical_services',
    ),
    ProfessionPreset(
      name: 'Advogado',
      tools: ['Gestão de Processos', 'Peticionamento', 'Jurisprudência', 'Contatos Clientes'],
      fileTypes: ['.pdf', '.docx', '.txt'],
      icon: 'gavel',
    ),
    // Adicionar mais conforme necessário...
  ];

  static ProfessionPreset getByName(String name) {
    return presets.firstWhere(
      (p) => p.name == name,
      orElse: () => presets[0],
    );
  }
}
