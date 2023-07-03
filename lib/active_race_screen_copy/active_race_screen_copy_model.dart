import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActiveRaceScreenCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (View race)] action in activeRaceScreenCopy widget.
  ApiCallResponse? responseViewRace0;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (View race)] action in activeRaceScreenCopy widget.
  ApiCallResponse? responseViewRace;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  // State field(s) for TimerDown widget.
  int timerDownMilliseconds = 0;
  String timerDownValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerDownController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Stores action output result for [Backend Call - API (Stop race)] action in TimerDown widget.
  ApiCallResponse? responseStopRaceCopy;
  // State field(s) for TimerUp widget.
  int timerUpMilliseconds = 0;
  String timerUpValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerUpController =
      StopWatchTimer(mode: StopWatchMode.countUp);

  // Stores action output result for [Backend Call - API (Stop race)] action in Button widget.
  ApiCallResponse? responseStopRace;
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
    instantTimer?.cancel();
    customAppBarModel.dispose();
    timerDownController.dispose();
    timerUpController.dispose();
    customNavbBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
