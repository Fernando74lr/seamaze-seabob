import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Step2RaceConfigModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // State field(s) for raceType widget.
  TextEditingController? raceTypeController;
  String? Function(BuildContext, String?)? raceTypeControllerValidator;
  // State field(s) for laps widget.
  TextEditingController? lapsController;
  String? Function(BuildContext, String?)? lapsControllerValidator;
  // Stores action output result for [Backend Call - API (Race type)] action in Button widget.
  ApiCallResponse? responseRaceType;
  // Stores action output result for [Backend Call - API (Stop race)] action in Button widget.
  ApiCallResponse? responseCancelStopRace;
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
    raceTypeController?.dispose();
    lapsController?.dispose();
    customNavbBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
