import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Captcha)] action in Login widget.
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
        'l0g46tuz' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'qo87ul2g' /* Please enter a valid email add... */,
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
        'tejyutej' /* Field is required */,
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
        '3vz70zvx' /* Captcha is required */,
      );
    }

    return null;
  }

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Validate Form] action in btn_login widget.
  bool? loginFormValidate;
  // Stores action output result for [Backend Call - API (Login)] action in btn_login widget.
  ApiCallResponse? loginApi;
  // Stores action output result for [Backend Call - API (User Stats)] action in btn_login widget.
  ApiCallResponse? apiUserCount1;
  // Stores action output result for [Backend Call - API (CountApplications)] action in btn_login widget.
  ApiCallResponse? otsCountadmin;
  // Stores action output result for [Backend Call - API (Get Ceritificate Count)] action in btn_login widget.
  ApiCallResponse? otsCertificateCountAdmin;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in btn_login widget.
  ApiCallResponse? allOtsAPI;
  // Stores action output result for [Backend Call - API (CountApplications)] action in btn_login widget.
  ApiCallResponse? otsCount;
  // Stores action output result for [Backend Call - API (getCertificateCountDays)] action in btn_login widget.
  ApiCallResponse? certificateCountDays;
  // Stores action output result for [Backend Call - API (Get Ceritificate Count)] action in btn_login widget.
  ApiCallResponse? otsCertificateCount;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in btn_login widget.
  ApiCallResponse? allOtsAPIFilter;
  // Stores action output result for [Backend Call - API (User Stats)] action in btn_login widget.
  ApiCallResponse? apiUserCount;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in btn_login widget.
  ApiCallResponse? govOrder;
  // Stores action output result for [Backend Call - API (Dashboard Counts)] action in btn_login widget.
  ApiCallResponse? oSICDashboardCount;
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
