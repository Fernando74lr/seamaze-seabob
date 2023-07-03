import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'active_race_screen_model.dart';
export 'active_race_screen_model.dart';

class ActiveRaceScreenWidget extends StatefulWidget {
  const ActiveRaceScreenWidget({Key? key}) : super(key: key);

  @override
  _ActiveRaceScreenWidgetState createState() => _ActiveRaceScreenWidgetState();
}

class _ActiveRaceScreenWidgetState extends State<ActiveRaceScreenWidget> {
  late ActiveRaceScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveRaceScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.responseViewRace = await RaceGroup.viewRaceCall.call();
          setState(() {
            FFAppState().storedRace = (_model.responseViewRace?.jsonBody ?? '');
          });
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleted();
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wrapWithModel(
                model: _model.customAppBarModel,
                updateCallback: () => setState(() {}),
                child: CustomAppBarWidget(
                  title: 'Race',
                  title2: '',
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 110.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'RACE',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF646464),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.3),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'LIVE',
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Color(0xFFC2951F),
                                        fontSize: 55.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'TRACK',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF646464),
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            FFAppState().storedRace,
                                            r'''$.track''',
                                          ).toString(),
                                          'None',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Color(0xFFC2951F),
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: SvgPicture.asset(
                                          'assets/images/timer.svg',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'DURATION',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: Color(0xFF646464),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          if (false)
                                            Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .formatSecondsAsMinutes(
                                                        valueOrDefault<int>(
                                                  getJsonField(
                                                    FFAppState().storedRace,
                                                    r'''$.race_time''',
                                                  ),
                                                  0,
                                                )),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xFFC2951F),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          Text(
                                            dateTimeFormat(
                                                'jm', getCurrentTimestamp),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: Color(0xFFC2951F),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      'relative', getCurrentTimestamp),
                                  'Created a moment ago',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF646464),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(
                                              RaceGroup.viewRaceCall.call()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: Color(0xFFC2951F),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnViewRaceResponse = snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final usersList = getJsonField(
                                        columnViewRaceResponse.jsonBody,
                                        r'''$.users''',
                                      ).toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            usersList.length, (usersListIndex) {
                                          final usersListItem =
                                              usersList[usersListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 25.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (getJsonField(
                                                          usersListItem,
                                                          r'''$.picture''',
                                                        ) !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'http://10.42.0.1${getJsonField(
                                                              usersListItem,
                                                              r'''$.picture''',
                                                            ).toString()}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    if (getJsonField(
                                                          usersListItem,
                                                          r'''$.picture''',
                                                        ) ==
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/96x96.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              usersListItem,
                                                              r'''$.nickname''',
                                                            ).toString(),
                                                            'NICKNAME 1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF646464),
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            'Model: ${valueOrDefault<String>(
                                                              getJsonField(
                                                                usersListItem,
                                                                r'''$.seabob_model''',
                                                              ).toString(),
                                                              'MODEL NOT FOUND',
                                                            )}',
                                                            'Model: not assigned',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF646464),
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            'Tag: ${valueOrDefault<String>(
                                                              getJsonField(
                                                                usersListItem,
                                                                r'''$.tag''',
                                                              ).toString(),
                                                              'Tag: not assigned',
                                                            )}',
                                                            'Tag: not asigned',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF646464),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons
                                                              .video_collection_outlined,
                                                          color:
                                                              Color(0xFFC2951F),
                                                          size: 35.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'userInfoRace',
                                                            queryParameters: {
                                                              'userId':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.user_id''',
                                                                  ),
                                                                  0,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'tag':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.tag''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nickname':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.nickname''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'seabobModel':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.seabob_model''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'bestTime':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    double>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.best_time''',
                                                                  ),
                                                                  0.0,
                                                                ),
                                                                ParamType
                                                                    .double,
                                                              ),
                                                              'lapsDone':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.laps_done''',
                                                                  ),
                                                                  0,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'rank':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.rank''',
                                                                  ),
                                                                  0,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'picture':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.picture''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'track':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .storedRace,
                                                                  r'''$.track''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'raceTime':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .storedRace,
                                                                  r'''$.race_time''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'lapsLength':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  functions
                                                                      .lengthOfArray(
                                                                          getJsonField(
                                                                    usersListItem,
                                                                    r'''$.laps''',
                                                                  )!),
                                                                  0,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Image.asset(
                                                              'assets/images/lap-hashtag.png',
                                                              width: 50.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'LAPS',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFF646464),
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.laps_done''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFFC2951F),
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Image.asset(
                                                              'assets/images/lap.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'BEST LAP',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFF646464),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.formatSecondsAsMinutes(
                                                                      valueOrDefault<
                                                                          int>(
                                                                    getJsonField(
                                                                      usersListItem,
                                                                      r'''$.best_time''',
                                                                    ),
                                                                    0,
                                                                  )),
                                                                  '0 s',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFFC2951F),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/ranking.png',
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'RANKING',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFF646464),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.rank''',
                                                                  ).toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFFC2951F),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 15.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted(
                                  minWait: 1000, maxWait: 3000);
                            },
                            text: 'Update',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF646464),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 15.0, 20.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.instantTimer?.cancel();
                            _model.responseStopRace =
                                await RaceGroup.stopRaceCall.call(
                              userId:
                                  valueOrDefault(currentUserDocument?.id, 0),
                            );
                            if (getJsonField(
                                  (_model.responseStopRace?.jsonBody ?? ''),
                                  r'''$.status''',
                                ) ==
                                'success') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Race'),
                                    content: Text('Race finished!'),
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
                              setState(() {
                                FFAppState().isInRace = false;
                              });

                              context.goNamed('raceResults');
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Oops...'),
                                    content: Text(
                                        'You don\'t have host permissions to stop the race'),
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

                            setState(() {});
                          },
                          text: 'Stop race',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor3,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.customNavbBarModel,
                updateCallback: () => setState(() {}),
                child: CustomNavbBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
