import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ex_loan_aplic_sta_branch_widget.dart' show ExLoanAplicStaBranchWidget;
import 'package:flutter/material.dart';

class ExLoanAplicStaBranchModel
    extends FlutterFlowModel<ExLoanAplicStaBranchWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcBranch component.
  late MainwebnavOsfcBranchModel mainwebnavOsfcBranchModel;
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
        'zaethqva' /* Search your loan number is req... */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'z1a03hgt' /* Enter full 6-character loan nu... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalidation;
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
    mainwebnavOsfcBranchModel =
        createModel(context, () => MainwebnavOsfcBranchModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearch1TextControllerValidator = _loansearch1TextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcBranchModel.dispose();
    languageModel.dispose();
    loansearch1FocusNode?.dispose();
    loansearch1TextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
