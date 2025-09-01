import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
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
        't8rz72af' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (forgotpassword)] action in btn_login widget.
  ApiCallResponse? apiEmailSend;
  // State field(s) for NewPasswordField widget.
  FocusNode? newPasswordFieldFocusNode;
  TextEditingController? newPasswordFieldTextController;
  late bool newPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      newPasswordFieldTextControllerValidator;
  String? _newPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6p7a3pdx' /* New Password is required */,
      );
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&]).{12,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ucdunmot' /* Password must be at least 12 c... */,
      );
    }
    return null;
  }

  // State field(s) for ConformPasswordField widget.
  FocusNode? conformPasswordFieldFocusNode;
  TextEditingController? conformPasswordFieldTextController;
  late bool conformPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      conformPasswordFieldTextControllerValidator;
  String? _conformPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v76porqx' /* Confirm Password is required */,
      );
    }

    return null;
  }

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer60 widget.
  final timer60InitialTimeMs = 60000;
  int timer60Milliseconds = 60000;
  String timer60Value = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer60Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (Resend otp)] action in Icon widget.
  ApiCallResponse? apiResendotp;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? passwordform;
  // Stores action output result for [Backend Call - API (resetpassword)] action in Button widget.
  ApiCallResponse? apiPasswordUpdated;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    newPasswordFieldVisibility = false;
    newPasswordFieldTextControllerValidator =
        _newPasswordFieldTextControllerValidator;
    conformPasswordFieldVisibility = false;
    conformPasswordFieldTextControllerValidator =
        _conformPasswordFieldTextControllerValidator;
    pinCodeController = TextEditingController();
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    newPasswordFieldFocusNode?.dispose();
    newPasswordFieldTextController?.dispose();

    conformPasswordFieldFocusNode?.dispose();
    conformPasswordFieldTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timer60Controller.dispose();
    footerModel.dispose();
  }
}
