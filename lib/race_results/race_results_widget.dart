import '/backend/api_requests/api_calls.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'race_results_model.dart';
export 'race_results_model.dart';

class RaceResultsWidget extends StatefulWidget {
  const RaceResultsWidget({Key? key}) : super(key: key);

  @override
  _RaceResultsWidgetState createState() => _RaceResultsWidgetState();
}

class _RaceResultsWidgetState extends State<RaceResultsWidget> {
  late RaceResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RaceResultsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.responseViewRace = await RaceGroup.viewRaceCall.call();
      setState(() {});
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
                                  'RESULTS',
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
                                            (_model.responseViewRace
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.track''',
                                          ).toString(),
                                          '--',
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
                                          Text(
                                            valueOrDefault<String>(
                                              functions.formatSecondsAsMinutes(
                                                  getJsonField(
                                                (_model.responseViewRace
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.race_time''',
                                              )),
                                              '0 s',
                                            ),
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
                                dateTimeFormat('relative', getCurrentTimestamp),
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
                                future: RaceGroup.viewRaceCall.call(),
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
                                                            'USER TESTS',
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
                                                            'Model: not asigned',
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
                                                              'Tag: not asigned',
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
                                                          Icons.info_outline,
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
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.user_id''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'tag':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.tag''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nickname':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.nickname''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'seabobModel':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.seabob_model''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'bestTime':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.best_time''',
                                                                ),
                                                                ParamType
                                                                    .double,
                                                              ),
                                                              'lapsDone':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.laps_done''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'rank':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.rank''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'picture':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.picture''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'track':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  columnViewRaceResponse
                                                                      .jsonBody,
                                                                  r'''$.track''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'raceTime':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  columnViewRaceResponse
                                                                      .jsonBody,
                                                                  r'''$.race_time''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'lapsLength':
                                                                  serializeParam(
                                                                0,
                                                                ParamType.int,
                                                              ),
                                                              'lapsUser':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  usersListItem,
                                                                  r'''$.laps''',
                                                                ),
                                                                ParamType.JSON,
                                                                true,
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
                                                                '${valueOrDefault<String>(
                                                                  getJsonField(
                                                                    usersListItem,
                                                                    r'''$.best_time''',
                                                                  ).toString(),
                                                                  '0',
                                                                )} s',
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
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.25,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final laps =
                                                            getJsonField(
                                                          usersListItem,
                                                          r'''$.laps''',
                                                        ).toList();
                                                        return Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: DataTable2(
                                                            columns: [
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'LAP',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          fontSize:
                                                                              20.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'TIME',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          fontSize:
                                                                              20.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                            rows: (laps
                                                                    as Iterable)
                                                                .mapIndexed((lapsIndex,
                                                                        lapsItem) =>
                                                                    [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            lapsItem,
                                                                            r'''$.lap''',
                                                                          ).toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        '${valueOrDefault<String>(
                                                                          getJsonField(
                                                                            lapsItem,
                                                                            r'''$.time''',
                                                                          ).toString(),
                                                                          '0',
                                                                        )} s',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ]
                                                                        .map((c) =>
                                                                            DataCell(
                                                                                c))
                                                                        .toList())
                                                                .map((e) =>
                                                                    DataRow(
                                                                        cells:
                                                                            e))
                                                                .toList(),
                                                            headingRowColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              Color(0xFFC2951F),
                                                            ),
                                                            headingRowHeight:
                                                                56.0,
                                                            dataRowColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              Color(0xB1E0E3E7),
                                                            ),
                                                            dataRowHeight: 56.0,
                                                            border: TableBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            dividerThickness:
                                                                2.0,
                                                            showBottomBorder:
                                                                true,
                                                            minWidth: 49.0,
                                                          ),
                                                        );
                                                      },
                                                    ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 15.0, 20.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.responseFinalResults =
                                await RaceGroup.viewRaceCall.call();
                            FFAppState().update(() {
                              FFAppState().storedRace =
                                  (_model.responseFinalResults?.jsonBody ?? '');
                            });
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Success!'),
                                  content: Text(
                                      'The race was stored correctly. When you connect to the internet you can upload it in the Stored Races section.'),
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

                            context.pushNamed('home');

                            setState(() {});
                          },
                          text: 'Save and exit',
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
