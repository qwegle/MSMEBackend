import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_change_widget.dart' show PasswordChangeWidget;
import 'package:flutter/material.dart';

class PasswordChangeModel extends FlutterFlowModel<PasswordChangeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for CurrentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordTextController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextControllerValidator;
  String? _currentPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '44dyd1c6' /* Enter current password is requ... */,
      );
    }

    return null;
  }

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0a510rim' /* Enter new password is required */,
      );
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&]).{12,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fy6vjk17' /* Password must be at least 12 c... */,
      );
    }
    return null;
  }

  // State field(s) for RetryNewPassword widget.
  FocusNode? retryNewPasswordFocusNode;
  TextEditingController? retryNewPasswordTextController;
  late bool retryNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      retryNewPasswordTextControllerValidator;
  String? _retryNewPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mi0ao68r' /* Confirm new password is requir... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - API (updatepassword)] action in Button widget.
  ApiCallResponse? apiChangePassword;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    currentPasswordVisibility = false;
    currentPasswordTextControllerValidator =
        _currentPasswordTextControllerValidator;
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    retryNewPasswordVisibility = false;
    retryNewPasswordTextControllerValidator =
        _retryNewPasswordTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    currentPasswordFocusNode?.dispose();
    currentPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    retryNewPasswordFocusNode?.dispose();
    retryNewPasswordTextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
