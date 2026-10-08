import 'package:flutter/material.dart';

/// The one place a prayer's identity is defined. Every layer that used
/// to independently type out 'Rosary' / 'rosary' / 'Divine Chaplet' as
/// a free-text literal now reads it from here instead — the Dashboard's
/// buttons, the completion check, and (wherever you construct one)
/// `PrayerCompletionScreen`'s `prayerType` argument.
///
/// [dbKey] is what gets written to and matched against in `prayer_logs`.
/// It's deliberately stable and lowercase — never rename an existing
/// key once prayers have been logged under it, or historical rows
/// become unmatchable. Add new prayer types by adding a new case, not
/// by editing what an existing one means.
enum PrayerType {
  gospel('gospel', 'Gospel Reading', 'ወንጌል ንባብ', Icons.menu_book_rounded),
  angelus('angelus', 'Angelus', 'የመልአክ ጸሎት', Icons.church_rounded),
  rosary('rosary', 'Rosary', 'ሮዛሪዮ', Icons.self_improvement_rounded),
  chaplet('chaplet', 'Divine Mercy Chaplet', 'የመለኮታዊ ምሕረት ጸሎት',
      Icons.favorite_rounded),
  novena('novena', 'Novena', 'ኖቬና', Icons.local_florist_rounded);

  const PrayerType(this.dbKey, this.labelEn, this.labelAm, this.icon);

  /// Stable, lowercase identifier stored in `prayer_logs.prayer_type`.
  final String dbKey;
  final String labelEn;
  final String labelAm;
  final IconData icon;

  String label(bool isAmharic) => isAmharic ? labelAm : labelEn;

  /// For matching a `prayer_type` value read back from the database
  /// (defensive — falls back to substring matching only if an exact
  /// match fails, in case older rows were logged before this enum
  /// existed with slightly different casing).
  static PrayerType? fromDbValue(String? raw) {
    if (raw == null) return null;
    final normalized = raw.trim().toLowerCase();
    for (final type in PrayerType.values) {
      if (type.dbKey == normalized) return type;
    }
    for (final type in PrayerType.values) {
      if (normalized.contains(type.dbKey)) return type;
    }
    return null;
  }
}