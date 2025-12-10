import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_admin/mainwebnav_osfc_admin_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'settlement_order_widget.dart' show SettlementOrderWidget;
import 'package:flutter/material.dart';

class SettlementOrderModel extends FlutterFlowModel<SettlementOrderWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for MainwebnavOsfcAdmin component.
  late MainwebnavOsfcAdminModel mainwebnavOsfcAdminModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for LoanNumber widget.
  FocusNode? loanNumberFocusNode;
  TextEditingController? loanNumberTextController;
  String? Function(BuildContext, String?)? loanNumberTextControllerValidator;
  String? _loanNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2af6dscr' /* Enter Loan number... is requir... */,
      );
    }

    return null;
  }

  bool isDataUploading_pDFFilesSmO = false;
  FFUploadedFile uploadedLocalFile_pDFFilesSmO =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation5;
  // Stores action output result for [Backend Call - API (Upload Settlement Order)] action in Button widget.
  ApiCallResponse? apiResultccy;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Button widget.
  ApiCallResponse? apiSettlementOrder;
  // State field(s) for loansearch2 widget.
  FocusNode? loansearch2FocusNode;
  TextEditingController? loansearch2TextController;
  String? Function(BuildContext, String?)? loansearch2TextControllerValidator;
  String? _loansearch2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fqrtojuw' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'vjwsk14b' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Button widget.
  ApiCallResponse? apiResulloanSearch1;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Button widget.
  ApiCallResponse? apiResulloanReset1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in limit_drop_down widget.
  ApiCallResponse? apiLimitChange;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiFirst;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiprevious;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiNext;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiLAst;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcAdminModel =
        createModel(context, () => MainwebnavOsfcAdminModel());
    languageModel = createModel(context, () => LanguageModel());
    loanNumberTextControllerValidator = _loanNumberTextControllerValidator;
    loansearch2TextControllerValidator = _loansearch2TextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcAdminModel.dispose();
    languageModel.dispose();
    loanNumberFocusNode?.dispose();
    loanNumberTextController?.dispose();

    loansearch2FocusNode?.dispose();
    loansearch2TextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
