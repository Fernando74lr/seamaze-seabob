import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
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
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlutterFlowWebView(
                  content: 'https://flutter.dev',
                  bypass: false,
                  height: 211.0,
                  verticalScroll: false,
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
