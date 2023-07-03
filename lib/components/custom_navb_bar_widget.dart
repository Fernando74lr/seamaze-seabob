import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_navb_bar_model.dart';
export 'custom_navb_bar_model.dart';

class CustomNavbBarWidget extends StatefulWidget {
  const CustomNavbBarWidget({Key? key}) : super(key: key);

  @override
  _CustomNavbBarWidgetState createState() => _CustomNavbBarWidgetState();
}

class _CustomNavbBarWidgetState extends State<CustomNavbBarWidget> {
  late CustomNavbBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavbBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: 100.0,
            height: 125.0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: 125.0,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFC2951F),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed('home');
                                  },
                                  child: Image.asset(
                                    'assets/images/home.png',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.goNamed('profileRaces');
                                            },
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -0.6),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 45.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -0.45),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        currentUserPhoto,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.01, 0.6),
                                                  child: Text(
                                                    'You',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.65),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var _shouldSetState = false;
                        _model.isConnected = await actions.checkURLConnection();
                        _shouldSetState = true;
                        if (_model.isConnected == true) {
                          _model.statusResponse =
                              await RaceGroup.statusCall.call();
                          _shouldSetState = true;
                          _model.responseViewRace =
                              await RaceGroup.viewRaceCall.call();
                          _shouldSetState = true;
                          if ((getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_home''',
                                  ) ==
                                  'in progress') ||
                              (getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_id''',
                                  ) ==
                                  random_data.randomInteger(3, 3))) {
                            context.goNamed('activeRaceScreenCopy');

                            if (_shouldSetState) setState(() {});
                            return;
                          } else if ((getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_home''',
                                  ) ==
                                  'circuit scanned') ||
                              (getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_id''',
                                  ) ==
                                  random_data.randomInteger(2, 2))) {
                            if ((getJsonField(
                                      (_model.responseViewRace?.jsonBody ?? ''),
                                      r'''$.admin''',
                                    ) ==
                                    random_data.randomInteger(0, 0)) ||
                                (getJsonField(
                                      (_model.responseViewRace?.jsonBody ?? ''),
                                      r'''$.admin''',
                                    ) ==
                                    valueOrDefault(
                                        currentUserDocument?.id, 0))) {
                              context.goNamed('step2RaceConfig');
                            } else {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('New participant'),
                                            content: Text(
                                                'Do you want to join to the current race?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                context.goNamed('newUserForm2');
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                            return;
                          } else if ((getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_home''',
                                  ) ==
                                  'race created') ||
                              (getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_id''',
                                  ) ==
                                  random_data.randomInteger(1, 1))) {
                            if ((getJsonField(
                                      (_model.responseViewRace?.jsonBody ?? ''),
                                      r'''$.admin''',
                                    ) ==
                                    random_data.randomInteger(0, 0)) ||
                                (getJsonField(
                                      (_model.responseViewRace?.jsonBody ?? ''),
                                      r'''$.admin''',
                                    ) ==
                                    valueOrDefault(
                                        currentUserDocument?.id, 0))) {
                              context.goNamed('step1RaceConfig');
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Race is in configuration'),
                                    content: Text(
                                        'Please wait for the host to finish configuring the race.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            if (_shouldSetState) setState(() {});
                            return;
                          } else if ((getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_home''',
                                  ) ==
                                  'no race') ||
                              (getJsonField(
                                    (_model.statusResponse?.jsonBody ?? ''),
                                    r'''$.race.status_id''',
                                  ) ==
                                  random_data.randomInteger(0, 0)) ||
                              (getJsonField(
                                    (_model.responseViewRace?.jsonBody ?? ''),
                                    r'''$.status''',
                                  ) ==
                                  'finished')) {
                            _model.apiResultStopRace =
                                await RaceGroup.stopRaceCall.call();
                            _shouldSetState = true;

                            context.pushNamed('step0RaceConfig');

                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Invalid status'),
                                  content: Text('Please check or reset timer.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Connection error'),
                                content:
                                    Text('Please connect to the timer network'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      child: Image.asset(
                        'assets/images/race.png',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.73),
                    child: Text(
                      'Race',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
