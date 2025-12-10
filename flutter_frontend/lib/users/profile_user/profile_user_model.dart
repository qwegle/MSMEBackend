import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_user_widget.dart' show ProfileUserWidget;
import 'package:flutter/material.dart';

class ProfileUserModel extends FlutterFlowModel<ProfileUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // Stores action output result for [Backend Call - API (updatepassword)] action in Button widget.
  ApiCallResponse? apiUpdateDetails;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for NumberTextField widget.
  FocusNode? numberTextFieldFocusNode;
  TextEditingController? numberTextFieldTextController;
  String? Function(BuildContext, String?)?
      numberTextFieldTextControllerValidator;
  // State field(s) for AadharNumberTextField widget.
  FocusNode? aadharNumberTextFieldFocusNode;
  TextEditingController? aadharNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      aadharNumberTextFieldTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    numberTextFieldFocusNode?.dispose();
    numberTextFieldTextController?.dispose();

    aadharNumberTextFieldFocusNode?.dispose();
    aadharNumberTextFieldTextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
