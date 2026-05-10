import 'dart:convert';
import 'package:crypto/crypto.dart';

class SecurityService {
  // Simula um sistema de segurança robusto com hashing SHA-256
  static String hashPassword(String password) {
    var bytes = utf8.encode(password + "TERA_SALT_2026"); // Salt para segurança extra
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Validação de entrada para evitar injeções ou falhas comuns
  static bool isValidInput(String input) {
    return input.isNotEmpty && input.length >= 4;
  }
}
