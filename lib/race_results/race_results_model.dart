import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RaceResultsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (View race)] action in raceResults widget.
  ApiCallResponse? responseViewRace;
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Stores action output result for [Backend Call - API (View race)] action in Button widget.
  ApiCallResponse? responseFinalResults;
  // Model for CustomNavbBar component.
  late CustomNavbBarModel customNavbBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
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
