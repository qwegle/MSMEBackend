import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Captcha)] action in SignUp widget.
  ApiCallResponse? apiRGetCaptcha;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for usernameTextField widget.
  FocusNode? usernameTextFieldFocusNode;
  TextEditingController? usernameTextFieldTextController;
  String? Function(BuildContext, String?)?
      usernameTextFieldTextControllerValidator;
  String? _usernameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xilh8pmn' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'es6ze06b' /* Your Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '7lv4lll7' /* Please enter a valid email add... */,
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
        'kgsqr5w2' /* Field is required */,
      );
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&]).{12,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'htuab08l' /* Password must be at least 12 c... */,
      );
    }
    return null;
  }

  // State field(s) for Re-PasswordTextField widget.
  FocusNode? rePasswordTextFieldFocusNode;
  TextEditingController? rePasswordTextFieldTextController;
  late bool rePasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordTextFieldTextControllerValidator;
  String? _rePasswordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c9tpddob' /* Password is required */,
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
        'fs2rvo90' /* Captcha is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in btn_login widget.
  bool? signupformvalidate;
  // Stores action output result for [Backend Call - API (Register)] action in btn_login widget.
  ApiCallResponse? apiResultal3;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    usernameTextFieldTextControllerValidator =
        _usernameTextFieldTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    rePasswordTextFieldVisibility = false;
    rePasswordTextFieldTextControllerValidator =
        _rePasswordTextFieldTextControllerValidator;
    entercaptchaTextFieldTextControllerValidator =
        _entercaptchaTextFieldTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    usernameTextFieldFocusNode?.dispose();
    usernameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    rePasswordTextFieldFocusNode?.dispose();
    rePasswordTextFieldTextController?.dispose();

    entercaptchaTextFieldFocusNode?.dispose();
    entercaptchaTextFieldTextController?.dispose();

    footerModel.dispose();
  }
}
