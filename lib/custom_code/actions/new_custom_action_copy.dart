// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';

import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html; // Web uniquement

Future<String> newCustomActionCopy(
  String quizTitle,
  String userName,
) async {
  final pdf = pw.Document();

  final dateString = DateTime.now().toLocal().toString().split(' ')[0];

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                '🎓 Certificat de Réussite',
                style: pw.TextStyle(
                  fontSize: 28,
                  fontWeight: pw.FontWeight.bold,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 40),
              pw.Text('Ce certificat est décerné à',
                  style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 10),
              pw.Text(
                userName,
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue800,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'pour avoir complété avec succès le quiz intitulé :',
                style: pw.TextStyle(fontSize: 16),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                quizTitle,
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 40),
              pw.Text(
                'Félicitations pour votre engagement et vos efforts !',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 60),
              pw.Text('Date : $dateString', style: pw.TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    ),
  );

  final Uint8List bytes = await pdf.save();
  final safeUserName =
      userName.replaceAll(RegExp(r'[^\w\s]'), '').replaceAll(' ', '_');

  if (kIsWeb) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "Certificat_$safeUserName.pdf")
      ..click();
    html.Url.revokeObjectUrl(url);
    return 'Téléchargement lancé dans le navigateur';
  } else {
    final dir = await getTemporaryDirectory();
    final file = io.File('${dir.path}/Certificat_$safeUserName.pdf');
    await file.writeAsBytes(bytes);
    return file.path;
  }
}
