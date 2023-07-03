import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_page_race_model.dart';
export 'loading_page_race_model.dart';

class LoadingPageRaceWidget extends StatefulWidget {
  const LoadingPageRaceWidget({Key? key}) : super(key: key);

  @override
  _LoadingPageRaceWidgetState createState() => _LoadingPageRaceWidgetState();
}

class _LoadingPageRaceWidgetState extends State<LoadingPageRaceWidget> {
  late LoadingPageRaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageRaceModel());
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
              Image.asset(
                'assets/images/flag.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Creating new race...',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      color: Color(0xFF646464),
                      fontSize: 30.0,
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
