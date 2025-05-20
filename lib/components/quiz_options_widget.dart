import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_options_model.dart';
export 'quiz_options_model.dart';

class QuizOptionsWidget extends StatefulWidget {
  const QuizOptionsWidget({
    super.key,
    this.questionNum,
    this.questionName,
    this.isTrue,
  });

  final String? questionNum;
  final String? questionName;
  final bool? isTrue;

  @override
  State<QuizOptionsWidget> createState() => _QuizOptionsWidgetState();
}

class _QuizOptionsWidgetState extends State<QuizOptionsWidget> {
  late QuizOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.isTrue!) {
          if (_model.isAnswered != null) {
            _model.isAnswered = true;
            safeSetState(() {});
            FFAppState().completedQuestions =
                FFAppState().completedQuestions + -1;
            safeSetState(() {});
            FFAppState().score = FFAppState().score + 1;
            safeSetState(() {});
          } else {
            _model.isAnswered = true;
            safeSetState(() {});
            FFAppState().completedQuestions =
                FFAppState().completedQuestions + 1;
            safeSetState(() {});
            FFAppState().score = FFAppState().score + -1;
            safeSetState(() {});
          }
        } else {
          if (_model.isAnswered != null) {
            _model.isAnswered = true;
            safeSetState(() {});
            FFAppState().completedQuestions =
                FFAppState().completedQuestions + -1;
            safeSetState(() {});
          } else {
            _model.isAnswered = false;
            safeSetState(() {});
            FFAppState().completedQuestions =
                FFAppState().completedQuestions + 1;
            safeSetState(() {});
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (_model.isAnswered == true) {
                return Color(0xDE3946D2);
              } else if (_model.isAnswered == false) {
                return Color(0x98F00B0B);
              } else {
                return Color(0x00060606);
              }
            }(),
            Colors.transparent,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          border: Border.all(
            color: valueOrDefault<Color>(
              () {
                if (_model.isAnswered == true) {
                  return Color(0xDE3946D2);
                } else if (_model.isAnswered == false) {
                  return Color(0xFFFA0C0C);
                } else {
                  return FlutterFlowTheme.of(context).info;
                }
              }(),
              FlutterFlowTheme.of(context).info,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (_model.isAnswered == true) {
                          return Color(0xDE3946D2);
                        } else if (_model.isAnswered == false) {
                          return Color(0xFFFA0C0C);
                        } else {
                          return Color(0x000C0C0C);
                        }
                      }(),
                      Color(0x000D0D0D),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        () {
                          if (_model.isAnswered == true) {
                            return Color(0xDE3946D2);
                          } else if (_model.isAnswered == false) {
                            return Color(0xFFFA0C0C);
                          } else {
                            return Color(0xFDFFFFFF);
                          }
                        }(),
                        Color(0x02FAF9F9),
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      widget!.questionNum!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget!.questionName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
