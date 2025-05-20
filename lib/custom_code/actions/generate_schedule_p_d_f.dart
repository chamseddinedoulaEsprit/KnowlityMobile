// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

Future<String> generateSchedulePDF(dynamic apiResult8v9) async {
  try {
    // Extraction du texte de planning depuis apiResult8v9 (identique à votre code actuel)
    if (apiResult8v9 == null) {
      return 'Error: API response (apiResult8v9) is null';
    }

    String scheduleText = '';
    if (apiResult8v9 is String) {
      try {
        final parsed = jsonDecode(apiResult8v9);
        if (parsed is List &&
            parsed.isNotEmpty &&
            parsed[0] is Map &&
            parsed[0].containsKey('generated_text')) {
          scheduleText = parsed[0]['generated_text'].toString();
        } else if (parsed is Map && parsed.containsKey('generated_text')) {
          scheduleText = parsed['generated_text'].toString();
        } else {
          scheduleText = parsed.toString();
        }
      } catch (e) {
        scheduleText = apiResult8v9.toString();
      }
    } else if (apiResult8v9 is Map &&
        apiResult8v9.containsKey('generated_text')) {
      scheduleText = apiResult8v9['generated_text'].toString();
    } else {
      scheduleText = apiResult8v9.toString();
    }

    if (scheduleText.isEmpty) {
      return 'Error: No schedule text extracted from API response';
    }

    // Analyse et structuration des données de planning
    final Map<String, Map<String, String>> scheduleData =
        _parseScheduleData(scheduleText);

    // Définition des couleurs du thème moderne
    final primaryColor = PdfColor.fromHex('#2C3E50'); // Bleu foncé
    final accentColor = PdfColor.fromHex('#3498DB'); // Bleu clair
    final lightAccentColor = PdfColor.fromHex('#EBF5FB'); // Bleu très clair
    final textColor = PdfColor.fromHex('#2C3E50'); // Texte principal
    final secondaryTextColor = PdfColor.fromHex('#7F8C8D'); // Texte secondaire
    final backgroundColor = PdfColor.fromHex('#F5F8FA'); // Fond subtil
    final cardColor = PdfColors.white;

    // Création du document PDF avec un design moderne
    final pdf = pw.Document();

    // Fonctions d'aide pour les éléments du design
    pw.Widget buildHeader() {
      return pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: pw.BoxDecoration(
          gradient: pw.LinearGradient(
            colors: [primaryColor, accentColor],
            begin: pw.Alignment.centerLeft,
            end: pw.Alignment.centerRight,
          ),
          borderRadius: const pw.BorderRadius.only(
            bottomLeft: pw.Radius.circular(0),
            bottomRight: pw.Radius.circular(40),
          ),
          boxShadow: [
            pw.BoxShadow(
              color: PdfColor.fromHex('#00000033'),
              offset: const PdfPoint(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'PLANNING QUOTIDIEN',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  'Étudiant en Informatique',
                  style: pw.TextStyle(
                    fontSize: 14,
                    color: PdfColors.white.shade(0.9),
                  ),
                ),
              ],
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColors.white.shade(0.9),
                borderRadius: pw.BorderRadius.circular(15),
              ),
              child: pw.Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    pw.Widget buildWeekSection(String weekTitle, Map<String, String> weekData) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 15),
        decoration: pw.BoxDecoration(
          color: cardColor,
          borderRadius: pw.BorderRadius.circular(12),
          boxShadow: [
            pw.BoxShadow(
              color: PdfColor.fromHex('#00000011'),
              offset: const PdfPoint(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: pw.Column(
          children: [
            // En-tête de section
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: pw.BoxDecoration(
                color: accentColor,
                borderRadius: const pw.BorderRadius.only(
                  topLeft: pw.Radius.circular(12),
                  topRight: pw.Radius.circular(12),
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    weekTitle,
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  pw.Text(
                    'Total: ${weekData['totalHours'] ?? '0h'}',
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Contenu de la section
            pw.Container(
              padding: const pw.EdgeInsets.all(15),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      pw.Container(
                        width: 8,
                        height: 8,
                        decoration: pw.BoxDecoration(
                          color: accentColor,
                          shape: pw.BoxShape.circle,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                        'Champs: ${weekData['chams'] ?? '0h'}',
                        style: pw.TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Ajout des pages au document
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin:
            const pw.EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 50),
        header: (pw.Context context) => buildHeader(),
        build: (pw.Context context) {
          // Liste des widgets pour la construction de la page
          List<pw.Widget> pageWidgets = [];

          // Ajouter un peu d'espace après l'en-tête
          pageWidgets.add(pw.SizedBox(height: 25));

          // Introduction
          pageWidgets.add(
            pw.Container(
              padding: const pw.EdgeInsets.all(15),
              margin: const pw.EdgeInsets.only(bottom: 20),
              decoration: pw.BoxDecoration(
                color: lightAccentColor,
                borderRadius: pw.BorderRadius.circular(12),
                border: pw.Border.all(color: accentColor.shade(0.2), width: 1),
              ),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      color: accentColor,
                      shape: pw.BoxShape.circle,
                    ),
                    child: pw.Text(
                      '!',
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 15),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Planning personnalisé',
                          style: pw.TextStyle(
                            color: primaryColor,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          'Ce document présente votre planning d\'activités et de cours pour les prochaines semaines. Les heures indiquées sont à respecter scrupuleusement.',
                          style: pw.TextStyle(
                            color: textColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          // Ajouter chaque section de semaine
          scheduleData.forEach((weekTitle, weekData) {
            if (weekTitle != 'Explanation') {
              pageWidgets.add(buildWeekSection(weekTitle, weekData));
            }
          });

          // Informations complémentaires
          if (scheduleData.containsKey('Explanation')) {
            pageWidgets.add(
              pw.Container(
                padding: const pw.EdgeInsets.all(15),
                margin: const pw.EdgeInsets.only(top: 5),
                decoration: pw.BoxDecoration(
                  color: cardColor,
                  borderRadius: pw.BorderRadius.circular(12),
                  border: pw.Border.all(
                      color: secondaryTextColor.shade(0.3), width: 1),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Informations complémentaires',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    pw.Divider(color: secondaryTextColor.shade(0.3)),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      scheduleData['Explanation']!['text'] ?? '',
                      style: pw.TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontStyle: pw.FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return pageWidgets;
        },
        footer: (pw.Context context) => pw.Container(
          margin: const pw.EdgeInsets.only(top: 10),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Généré automatiquement',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: secondaryTextColor,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
              pw.Container(
                padding:
                    const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: pw.BoxDecoration(
                  color: primaryColor,
                  borderRadius: pw.BorderRadius.circular(15),
                ),
                child: pw.Text(
                  'Page ${context.pageNumber} / ${context.pagesCount}',
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Encodage et retour du PDF en base64
    final pdfBytes = await pdf.save();
    final base64Content = base64Encode(pdfBytes);

    return base64Content;
  } catch (e) {
    return 'Error: ${e.toString()}';
  }
}

// Fonction pour analyser et structurer les données du planning
Map<String, Map<String, String>> _parseScheduleData(String content) {
  Map<String, Map<String, String>> scheduleData = {};
  String currentWeek = '';

  for (String line in content.split('\n')) {
    line = line.trim();

    if (line.startsWith('Week') && line.contains(':')) {
      currentWeek = line.split(':')[0].trim();
      scheduleData[currentWeek] = <String, String>{};
    } else if (currentWeek.isNotEmpty) {
      if (line.startsWith('chams:')) {
        scheduleData[currentWeek]!['chams'] = line.split(':')[1].trim();
      } else if (line.startsWith('Total hours:')) {
        scheduleData[currentWeek]!['totalHours'] = line.split(':')[1].trim();
      }
    } else if (line.startsWith('Explanation:')) {
      if (!scheduleData.containsKey('Explanation')) {
        scheduleData['Explanation'] = <String, String>{};
      }
      scheduleData['Explanation']!['text'] =
          line.substring('Explanation:'.length).trim();
    }
  }

  return scheduleData;
}
