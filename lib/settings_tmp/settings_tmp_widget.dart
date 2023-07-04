import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
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
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          FlutterFlowWebView(
                            content:
                                'http://192.168.0.183:3000/file/test_video_2.mp4',
                            bypass: true,
                            height: 211.0,
                            verticalScroll: true,
                            horizontalScroll: false,
                          ),
                          FlutterFlowWebView(
                            content:
                                'http://192.168.0.183:3000/file/test_video.mp4',
                            bypass: true,
                            height: 211.0,
                            verticalScroll: true,
                            horizontalScroll: false,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 0.0, 16.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 2,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 3.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 16.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).accent1,
                            activeDotColor:
                                FlutterFlowTheme.of(context).primary,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlutterFlowWebView(
                  content: 'http://192.168.0.183:3000/file/test_video.mp4',
                  bypass: true,
                  height: 211.0,
                  verticalScroll: true,
                  horizontalScroll: false,
                ),
              ],
            ),
            wrapWithModel(
              model: _model.customNavbBarModel,
              updateCallback: () => setState(() {}),
              child: CustomNavbBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
