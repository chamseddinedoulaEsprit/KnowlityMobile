import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for promptmsg widget.
  FocusNode? promptmsgFocusNode;
  TextEditingController? promptmsgTextController;
  String? Function(BuildContext, String?)? promptmsgTextControllerValidator;
  // Stores action output result for [Backend Call - API (groq api key)] action in sendbutton widget.
  ApiCallResponse? reponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptmsgFocusNode?.dispose();
    promptmsgTextController?.dispose();
  }
}
