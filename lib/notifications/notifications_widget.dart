import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFC2951F),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 24.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (false)
              Text(
                'Type a nickname',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFFE8E8E8),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFFDBE2E7),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(0.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
          ),
          Expanded(
            child: StreamBuilder<List<NotificationsRecord>>(
              stream: queryNotificationsRecord(
                parent: currentUserReference,
                queryBuilder: (notificationsRecord) =>
                    notificationsRecord.where('read', isEqualTo: false),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFC2951F),
                        ),
                      ),
                    ),
                  );
                }
                List<NotificationsRecord> listViewNotificationsRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewNotificationsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewNotificationsRecord =
                        listViewNotificationsRecordList[listViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (listViewNotificationsRecord.userFriendRef != null) {
                          context.pushNamed(
                            'profileRaceFriend',
                            queryParameters: {
                              'userRef': serializeParam(
                                listViewNotificationsRecord.userFriendRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );

                          return;
                        } else {
                          return;
                        }
                      },
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.25,
                          children: [
                            SlidableAction(
                              label: 'Read',
                              backgroundColor:
                                  FlutterFlowTheme.of(context).success,
                              icon: Icons.check,
                              onPressed: (_) async {
                                await listViewNotificationsRecord.reference
                                    .update(createNotificationsRecordData(
                                  read: true,
                                ));
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.info_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 35.0,
                          ),
                          title: Text(
                            'Title',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF646464),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          subtitle: Text(
                            '${listViewNotificationsRecord.description}${dateTimeFormat('relative', listViewNotificationsRecord.createdAt)}',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF828282),
                                  fontSize: 14.0,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF828282),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
