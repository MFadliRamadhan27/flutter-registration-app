// lib/providers/registration_provider.dart

import 'package:flutter/foundation.dart';
import '../models/registrant_model.dart';

class RegistrationProvider extends ChangeNotifier {

  // =========================
  // Private List
  // =========================
  final List<Registrant> _registrants = [];

  // =========================
  // Getters
  // =========================

  /// Mengambil semua data registrant (read-only)
  List<Registrant> get registrants =>
      List.unmodifiable(_registrants);

  /// Jumlah registrant
  int get count =>
      _registrants.length;

  // =========================
  // Add Registrant
  // =========================
  void addRegistrant(
      Registrant registrant) {

    _registrants.add(registrant);

    notifyListeners();
  }

  // =========================
  // Remove Registrant
  // =========================
  void removeRegistrant(
      String id) {

    _registrants.removeWhere(
      (r) => r.id == id,
    );

    notifyListeners();
  }

  // =========================
  // Get Registrant by ID
  // =========================
  Registrant? getById(String id) {

    try {

      return _registrants.firstWhere(
        (r) => r.id == id,
      );

    } catch (e) {

      return null;

    }
  }

  // =========================
  // Check Email Exists
  // =========================
  bool isEmailRegistered(
      String email) {

    return _registrants.any(
      (r) =>
          r.email?.toLowerCase() ==
          email.toLowerCase(),
    );
  }

}