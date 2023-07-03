import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_navb_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SettingsEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for CustomAppBar component.
  late CustomAppBarModel customAppBarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nameEdit widget.
  TextEditingController? nameEditController;
  String? Function(BuildContext, String?)? nameEditControllerValidator;
  // State field(s) for nicknameEdit widget.
  TextEditingController? nicknameEditController;
  String? Function(BuildContext, String?)? nicknameEditControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for weigthEdit widget.
  TextEditingController? weigthEditController;
  String? Function(BuildContext, String?)? weigthEditControllerValidator;
  // State field(s) for birthdateEdit widget.
  TextEditingController? birthdateEditController;
  final birthdateEditMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateEditControllerValidator;
  // State field(s) for phoneEdit widget.
  TextEditingController? phoneEditController;
  final phoneEditMask = MaskTextInputFormatter(mask: '+## ##-##-##-##-##');
  String? Function(BuildContext, String?)? phoneEditControllerValidator;
  // State field(s) for bioEdit widget.
  TextEditingController? bioEditController;
  String? Function(BuildContext, String?)? bioEditControllerValidator;
  // Model for CustomNavbBar component.
  late CustomNavbBarModel customNavbBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    customNavbBarModel = createModel(context, () => CustomNavbBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customAppBarModel.dispose();
    nameEditController?.dispose();
    nicknameEditController?.dispose();
    weigthEditController?.dispose();
    birthdateEditController?.dispose();
    phoneEditController?.dispose();
    bioEditController?.dispose();
    customNavbBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
