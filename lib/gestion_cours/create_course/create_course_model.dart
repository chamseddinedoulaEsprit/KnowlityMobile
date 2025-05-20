import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'create_course_widget.dart' show CreateCourseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCourseModel extends FlutterFlowModel<CreateCourseWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  String? _nomTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'TextField is required';
    }

    if (val.length < 2) {
      return '2 caracteres au minimum';
    }
    if (val.length > 30) {
      return '30 caracteres au maximum';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'TextField is required';
    }

    if (val.length < 5) {
      return '5 caracteres au minimum';
    }
    if (val.length > 255) {
      return '255 caracteres  au maximum';
    }

    return null;
  }

  // State field(s) for prix widget.
  FocusNode? prixFocusNode;
  TextEditingController? prixTextController;
  String? Function(BuildContext, String?)? prixTextControllerValidator;
  String? _prixTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'TextField is required';
    }

    if (val.length > 3) {
      return 'le cours ne depasse pas 999 dt';
    }

    return null;
  }

  // State field(s) for enseignant widget.
  FocusNode? enseignantFocusNode;
  TextEditingController? enseignantTextController;
  String? Function(BuildContext, String?)? enseignantTextControllerValidator;
  String? _enseignantTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'TextField is required';
    }

    if (val.length < 5) {
      return '5 carcateres au minimum';
    }
    if (val.length > 20) {
      return '20 caracteres au maximum';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (imageupload)] action in Button widget.
  ApiCallResponse? apiResponse;
  // Stores action output result for [Custom Action - formatFacebookMessage] action in Button widget.
  String? message;

  @override
  void initState(BuildContext context) {
    nomTextControllerValidator = _nomTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    prixTextControllerValidator = _prixTextControllerValidator;
    enseignantTextControllerValidator = _enseignantTextControllerValidator;
  }

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    prixFocusNode?.dispose();
    prixTextController?.dispose();

    enseignantFocusNode?.dispose();
    enseignantTextController?.dispose();
  }
}
