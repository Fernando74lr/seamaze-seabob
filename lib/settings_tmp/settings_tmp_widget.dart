import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_tmp_model.dart';
export 'settings_tmp_model.dart';

class SettingsTmpWidget extends StatefulWidget {
  const SettingsTmpWidget({Key? key}) : super(key: key);

  @override
  _SettingsTmpWidgetState createState() => _SettingsTmpWidgetState();
}

class _SettingsTmpWidgetState extends State<SettingsTmpWidget> {
  late SettingsTmpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsTmpModel());
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
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wrapWithModel(
                model: _model.customAppBarModel,
                updateCallback: () => setState(() {}),
                child: CustomAppBarWidget(
                  title: 'Settings',
                  title2: '',
                ),
              ),
              if (false)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlutterFlowVideoPlayer(
                      path: 'http://192.168.0.183:3000/file/test_video_2.mp4',
                      videoType: VideoType.network,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 300.0,
                      aspectRatio: 1.78,
                      autoPlay: false,
                      looping: false,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ],
                ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  FlutterFlowVideoPlayer(
                    path: 'http://192.168.0.183:3000/file/test_video_2.mp4',
                    videoType: VideoType.network,
                    height: 250.0,
                    aspectRatio: 1.78,
                    autoPlay: false,
                    looping: false,
                    showControls: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                  ),
                  FlutterFlowVideoPlayer(
                    path: 'http://192.168.0.183:3000/file/test_video.mp4',
                    videoType: VideoType.network,
                    height: 250.0,
                    aspectRatio: 1.78,
                    autoPlay: false,
                    looping: false,
                    showControls: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                  ),
                  FlutterFlowVideoPlayer(
                    path: 'http://192.168.0.183:3000/file/test_video_2.mp4',
                    videoType: VideoType.network,
                    height: 250.0,
                    aspectRatio: 1.78,
                    autoPlay: false,
                    looping: false,
                    showControls: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                  ),
                ].divide(SizedBox(height: 20.0)),
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
