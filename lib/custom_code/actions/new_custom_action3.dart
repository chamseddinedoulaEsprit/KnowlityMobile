// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String newCustomAction3(List<double> notes, List<double> maxScores) {
  if (notes.length != maxScores.length) return 'Erreur';

  double sommeNote = notes.fold(0, (a, b) => a + b);
  double sommeMax = maxScores.fold(0, (a, b) => a + b);

  if (sommeMax == 0) return 'Erreur';

  return '${sommeNote.toStringAsFixed(2)} / ${sommeMax.toStringAsFixed(2)}';
}
