// Automatic FlutterFlow imports
// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

// Conditional import for web-only APIs
// Create a small wrapper to avoid importing dart:html on non-web platforms.
// Note: if you need more complex web interop, create `web_helper.dart` with
// conditional imports: `web_helper_stub.dart` and `web_helper_web.dart`.
import 'web_helper_stub.dart' if (dart.library.html) 'web_helper_web.dart';

/// Génère un PDF avec un titre principal, et une liste de questions avec titre + description.
Future<String> newCustomAction(
  String title,
  List<String> questionsTitles,
  List<String> questionsDescriptions,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Center(
            child: pw.Text(
              title,
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 30),

          // Parcours de chaque question
          for (int i = 0; i < questionsTitles.length; i++) ...[
            pw.Text(
              questionsTitles[i],
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              questionsDescriptions.length > i ? questionsDescriptions[i] : '',
              style: pw.TextStyle(fontSize: 12),
            ),
            pw.SizedBox(height: 16),
          ],
        ];
      },
    ),
  );

  final Uint8List bytes = await pdf.save();

  if (kIsWeb) {
    // Use web helper to trigger download without importing dart:html here.
    WebHelper.downloadBytesAsFile(bytes, '$title.pdf');
    return 'Téléchargement lancé dans le navigateur';
  } else {
    final dir = await getTemporaryDirectory();
    final file = io.File('${dir.path}/$title.pdf');
    await file.writeAsBytes(bytes);
    return file.path;
  }
}
  }
