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
import 'package:cloud_firestore/cloud_firestore.dart'; // Import pour Firestore

/// Action 1: Create Message for Hugging Face
Future<String> createHuggingFaceMessage() async {
  try {
    // Step 1: Fetch courses and hours from Firestore
    QuerySnapshot courseSnapshot =
        await FirebaseFirestore.instance.collection('cours').get();
    List<Map<String, dynamic>> courses = [];

    for (var courseDoc in courseSnapshot.docs) {
      String courseName = courseDoc['name'] as String? ?? 'Cours inconnu';
      double totalHours = 0.0;

      // Récupérer les chapitres pour ce cours
      QuerySnapshot chapterSnapshot = await FirebaseFirestore.instance
          .collection('cours')
          .doc(courseDoc.id)
          .collection('chapitre')
          .get();

      for (var chapterDoc in chapterSnapshot.docs) {
        var duree = chapterDoc['duree_estimee'];
        totalHours += (duree is num)
            ? duree.toDouble()
            : double.tryParse(duree?.toString() ?? '0') ?? 0.0;
      }

      courses.add({'name': courseName, 'hours': totalHours});
    }

    if (courses.isEmpty) {
      print('Erreur: Aucun cours trouvé dans la base de données.');
      return 'Erreur: Aucun cours trouvé dans la base de données.';
    }

    // Step 2: Format the course list as a string
    StringBuffer courseList = StringBuffer();
    for (var course in courses) {
      courseList.writeln('${course['name']} ${course['hours']}h');
    }

    // Step 3: Construct the message using the structured prompt
    String message =
        '''You are an innovative educational scheduling assistant tasked with creating an engaging and effective learning plan.

Create a dynamic 4-week schedule for the following courses that optimizes learning effectiveness. Consider these principles:
1. Progressive Learning: Start with lighter hours and gradually increase intensity
2. Focus Periods: Allocate more hours to complex subjects when student attention is typically higher
3. Learning Peaks: Include intensive learning periods balanced with lighter sessions
4. Practical Distribution: Vary daily hours based on typical student energy levels

For each week:
- Distribute hours creatively but ensure the total course hours are completed by the end
- Consider course complexity and optimal learning times
- Create a rhythm that maintains student engagement

Course List with Total Hours:
${courseList.toString()}
Format each week as:
Week X:
[Course]: [Hours]h
Total hours: [Sum]h''';

    print('Hugging Face Message: $message'); // Debug log
    return message;
  } catch (e) {
    print('Erreur lors de la création du message pour Hugging Face: $e');
    return 'Erreur: Impossible de créer le message pour Hugging Face. Détails: ${e.toString()}';
  }
}

// DO NOT REMOVE OR MODIFY THE CODE BELOW!
