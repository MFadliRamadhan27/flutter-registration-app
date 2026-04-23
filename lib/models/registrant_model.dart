// lib/models/registrant_model.dart

class Registrant {

  // =========================
  // Fields
  // =========================
  final String id;
  final String name;
  final String email;
  final String gender;
  final String programStudi;
  final DateTime dateOfBirth;
  final DateTime registeredAt;

  // =========================
  // Constructor
  // =========================
  Registrant({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.programStudi,
    required this.dateOfBirth,
    DateTime? registeredAt,
  }) : registeredAt =
            registeredAt ?? DateTime.now();

  // =========================
  // Helper: Hitung Umur
  // =========================
  int get age {

    final now = DateTime.now();

    int age =
        now.year - dateOfBirth.year;

    if (now.month < dateOfBirth.month ||
        (now.month ==
                dateOfBirth.month &&
            now.day < dateOfBirth.day)) {

      age--;
    }

    return age;
  }

  // =========================
  // Helper: Format Tanggal Lahir
  // =========================
  String get formattedDateOfBirth {

    final months = [

      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return '${dateOfBirth.day} '
           '${months[dateOfBirth.month]} '
           '${dateOfBirth.year}';
  }

  // =========================
  // Helper: Format Waktu Registrasi
  // =========================
  String get formattedRegisteredAt {

    return '${registeredAt.day}/'
           '${registeredAt.month}/'
           '${registeredAt.year} '
           '${registeredAt.hour.toString().padLeft(2, '0')}:'
           '${registeredAt.minute.toString().padLeft(2, '0')}';
  }

}