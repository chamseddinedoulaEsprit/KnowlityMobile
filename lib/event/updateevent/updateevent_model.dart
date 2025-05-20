import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'updateevent_widget.dart' show UpdateeventWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class UpdateeventModel extends FlutterFlowModel<UpdateeventWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Event Title is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for decription widget.
  FocusNode? decriptionFocusNode;
  TextEditingController? decriptionTextController;
  String? Function(BuildContext, String?)? decriptionTextControllerValidator;
  String? _decriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (eventDescription)] action in Button widget.
  ApiCallResponse? reponse;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (imageupload)] action in Container widget.
  ApiCallResponse? apiResultbrg;
  // State field(s) for imageurl widget.
  FocusNode? imageurlFocusNode;
  TextEditingController? imageurlTextController;
  String? Function(BuildContext, String?)? imageurlTextControllerValidator;
  String? _imageurlTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Image URL is required';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Location is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for Seats widget.
  FocusNode? seatsFocusNode;
  TextEditingController? seatsTextController;
  String? Function(BuildContext, String?)? seatsTextControllerValidator;
  String? _seatsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Max Participants is required';
    }

    return null;
  }

  // State field(s) for CategoryChoice widget.
  FormFieldController<List<String>>? categoryChoiceValueController;
  String? get categoryChoiceValue =>
      categoryChoiceValueController?.value?.firstOrNull;
  set categoryChoiceValue(String? val) =>
      categoryChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for TypeChoice widget.
  FormFieldController<List<String>>? typeChoiceValueController;
  String? get typeChoiceValue => typeChoiceValueController?.value?.firstOrNull;
  set typeChoiceValue(String? val) =>
      typeChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    decriptionTextControllerValidator = _decriptionTextControllerValidator;
    imageurlTextControllerValidator = _imageurlTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
    seatsTextControllerValidator = _seatsTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    decriptionFocusNode?.dispose();
    decriptionTextController?.dispose();

    imageurlFocusNode?.dispose();
    imageurlTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    seatsFocusNode?.dispose();
    seatsTextController?.dispose();
  }
}
