import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Step1RaceConfigModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // State field(s) for firstCB widget.
  String? firstCBValue;
  FormFieldController<String>? firstCBValueController;
  // State field(s) for secondCB widget.
  String? secondCBValue;
  FormFieldController<String>? secondCBValueController;
  // State field(s) for thirdCB widget.
  String? thirdCBValue;
  FormFieldController<String>? thirdCBValueController;
  // State field(s) for fourthCB widget.
  String? fourthCBValue;
  FormFieldController<String>? fourthCBValueController;
  // Stores action output result for [Backend Call - API (Stop race)] action in Button widget.
  ApiCallResponse? responseCancelStopRace;
  // Stores action output result for [Backend Call - API (Select track)] action in Button widget.
  ApiCallResponse? selectTrackResponse;
  // Model for CustomNavbBar component.
  late CustomNavbBarModel customNavbBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    customNavbBarModel = createModel(context, () => CustomNavbBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customAppBarModel.dispose();
    customNavbBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
