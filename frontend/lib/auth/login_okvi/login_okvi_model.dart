import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_okvi_widget.dart' show LoginOkviWidget;
import 'package:flutter/material.dart';

class LoginOkviModel extends FlutterFlowModel<LoginOkviWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Captcha)] action in LoginOkvi widget.
  ApiCallResponse? apiRGetCaptcha;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't4jd7w51' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'q5v6ogti' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'exp3qjnm' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Get Captcha)] action in Icon widget.
  ApiCallResponse? apiRGetCaptchaRefresh;
  // State field(s) for EntercaptchaTextField widget.
  FocusNode? entercaptchaTextFieldFocusNode;
  TextEditingController? entercaptchaTextFieldTextController;
  String? Function(BuildContext, String?)?
      entercaptchaTextFieldTextControllerValidator;
  String? _entercaptchaTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1abk7nj7' /* Captcha is required */,
      );
    }

    return null;
  }

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Validate Form] action in btn_login widget.
  bool? loginFormValidate;
  // Stores action output result for [Backend Call - API (OKVI Login)] action in btn_login widget.
  ApiCallResponse? loginApi;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    entercaptchaTextFieldTextControllerValidator =
        _entercaptchaTextFieldTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    entercaptchaTextFieldFocusNode?.dispose();
    entercaptchaTextFieldTextController?.dispose();

    footerModel.dispose();
  }
}
