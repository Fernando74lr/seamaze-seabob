import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageWidgetState createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());
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
            context.pushNamed('home');
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All chats',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.person_add_alt_1,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('AddChatUsersPage');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: PagedListView<DocumentSnapshot<Object?>?, ChatsRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true);
              if (_model.pagingController != null) {
                final query = queryBuilder(ChatsRecord.collection);
                if (query != _model.pagingQuery) {
                  // The query has changed
                  _model.pagingQuery = query;
                  _model.streamSubscriptions.forEach((s) => s?.cancel());
                  _model.streamSubscriptions.clear();
                  _model.pagingController!.refresh();
                }
                return _model.pagingController!;
              }

              _model.pagingController = PagingController(firstPageKey: null);
              _model.pagingQuery = queryBuilder(ChatsRecord.collection);
              _model.pagingController!.addPageRequestListener((nextPageMarker) {
                queryChatsRecordPage(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true),
                  nextPageMarker: nextPageMarker,
                  pageSize: 25,
                  isStream: true,
                ).then((page) {
                  _model.pagingController!.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    data.forEach((item) {
                      final itemIndexes = _model.pagingController!.itemList!
                          .asMap()
                          .map((k, v) => MapEntry(v.reference.id, k));
                      final index = itemIndexes[item.reference.id];
                      final items = _model.pagingController!.itemList!;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _model.pagingController!.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _model.streamSubscriptions.add(streamSubscription);
                });
              });
              return _model.pagingController!;
            }(),
            padding: EdgeInsets.zero,
            reverse: false,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<ChatsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewChatsRecord =
                    _model.pagingController!.itemList![listViewIndex];
                return StreamBuilder<FFChatInfo>(
                  stream: FFChatManager.instance
                      .getChatInfo(chatRecord: listViewChatsRecord),
                  builder: (context, snapshot) {
                    final chatInfo =
                        snapshot.data ?? FFChatInfo(listViewChatsRecord);
                    return FFChatPreview(
                      onTap: () => context.pushNamed(
                        'ChatPage',
                        queryParameters: {
                          'chatUser': serializeParam(
                            chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                            ParamType.Document,
                          ),
                          'chatRef': serializeParam(
                            chatInfo.chatRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chatUser': chatInfo.otherUsers.length == 1
                              ? chatInfo.otherUsersList.first
                              : null,
                        },
                      ),
                      lastChatText: chatInfo.chatPreviewMessage(),
                      lastChatTime: listViewChatsRecord.lastMessageTime,
                      seen: listViewChatsRecord.lastMessageSeenBy!
                          .contains(currentUserReference),
                      title: chatInfo.chatPreviewTitle(),
                      userProfilePic: chatInfo.chatPreviewPic(),
                      color: Color(0xFFEEF0F5),
                      unreadColor: Color(0xFFC2951F),
                      titleTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      dateTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      previewTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                      borderRadius: BorderRadius.circular(0.0),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
