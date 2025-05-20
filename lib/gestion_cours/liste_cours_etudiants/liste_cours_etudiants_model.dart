import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'liste_cours_etudiants_widget.dart' show ListeCoursEtudiantsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListeCoursEtudiantsModel
    extends FlutterFlowModel<ListeCoursEtudiantsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - createHuggingFaceMessage] action in planning widget.
  String? chams;
  // Stores action output result for [Backend Call - API (HuggingFaceSchedule)] action in planning widget.
  ApiCallResponse? apiResult8v9;
  // Stores action output result for [Custom Action - generateSchedulePDF] action in planning widget.
  String? chams1;
  // Stores action output result for [Backend Call - API (mailing)] action in planning widget.
  ApiCallResponse? apiResultiz2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
