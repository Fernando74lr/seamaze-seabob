import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_download_model.dart';
export 'video_download_model.dart';

class VideoDownloadWidget extends StatefulWidget {
  const VideoDownloadWidget({
    Key? key,
    this.tag,
    this.raceNumber,
  }) : super(key: key);

  final String? tag;
  final int? raceNumber;

  @override
  _VideoDownloadWidgetState createState() => _VideoDownloadWidgetState();
}

class _VideoDownloadWidgetState extends State<VideoDownloadWidget> {
  late VideoDownloadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoDownloadModel());

    _model.lapNumberController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: TextFormField(
            controller: _model.lapNumberController,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'LAP NUMBER',
              hintStyle: FlutterFlowTheme.of(context).bodySmall,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            validator: _model.lapNumberControllerValidator.asValidator(context),
          ),
        ),
        if (FFAppState().isInRace)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
            child: FFButtonWidget(
              onPressed: () async {
                await launchURL(
                    'http://10.42.0.1/video/${widget.raceNumber.toString()}/${widget.tag}/${_model.lapNumberController.text}');
              },
              text: 'Download video',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).info,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Open Sans',
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
        if (FFAppState().isInRace)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: 'Go back',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF646464),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Open Sans',
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
    );
  }
}
