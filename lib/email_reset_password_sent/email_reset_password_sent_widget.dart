import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_reset_password_sent_model.dart';
export 'email_reset_password_sent_model.dart';

class EmailResetPasswordSentWidget extends StatefulWidget {
  const EmailResetPasswordSentWidget({
    Key? key,
    this.birthDate,
  }) : super(key: key);

  final String? birthDate;

  @override
  _EmailResetPasswordSentWidgetState createState() =>
      _EmailResetPasswordSentWidgetState();
}

class _EmailResetPasswordSentWidgetState
    extends State<EmailResetPasswordSentWidget> {
  late EmailResetPasswordSentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailResetPasswordSentModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                child: Text(
                  'The instruction for password reset is sent to your email.\n\nPlease check in your \"spam\" folder.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Open Sans',
                        color: Color(0xFF646464),
                        fontSize: 16.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.3),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(35.0, 8.0, 35.0, 35.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.goNamed('Login');
                  },
                  text: 'Back to login',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 35.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF646464),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Open Sans',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
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
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -0.5),
              child: Icon(
                Icons.mark_email_read_outlined,
                color: Color(0xFFC2951F),
                size: 100.0,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.04, -0.24),
              child: Text(
                'CHECK YOUR EMAIL',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      color: Color(0xFF646464),
                      fontSize: 26.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
