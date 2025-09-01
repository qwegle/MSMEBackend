import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'exsiting_loan_application_status_widget.dart'
    show ExsitingLoanApplicationStatusWidget;
import 'package:flutter/material.dart';

class ExsitingLoanApplicationStatusModel
    extends FlutterFlowModel<ExsitingLoanApplicationStatusWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for loansearch1 widget.
  FocusNode? loansearch1FocusNode;
  TextEditingController? loansearch1TextController;
  String? Function(BuildContext, String?)? loansearch1TextControllerValidator;
  String? _loansearch1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gj484cot' /* Search Loan Number is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'j03ac9sg' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formval1;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Button widget.
  ApiCallResponse? apiResulloanSearch1;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Button widget.
  ApiCallResponse? reset1Api;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in limit_drop_down widget.
  ApiCallResponse? apiLimitChange;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Icon widget.
  ApiCallResponse? apiFirst;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Icon widget.
  ApiCallResponse? apiprevious;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Icon widget.
  ApiCallResponse? apiapiNext;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Icon widget.
  ApiCallResponse? apiLast;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearch1TextControllerValidator = _loansearch1TextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    loansearch1FocusNode?.dispose();
    loansearch1TextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
