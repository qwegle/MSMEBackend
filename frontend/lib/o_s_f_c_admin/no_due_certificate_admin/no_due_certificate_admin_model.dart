import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_admin/mainwebnav_osfc_admin_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'no_due_certificate_admin_widget.dart' show NoDueCertificateAdminWidget;
import 'package:flutter/material.dart';

class NoDueCertificateAdminModel
    extends FlutterFlowModel<NoDueCertificateAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
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
        'rs7b2gia' /* Loan number is required */,
      );
    }

    return null;
  }

  bool isDataUploading_sPDFFilesNDC = false;
  FFUploadedFile uploadedLocalFile_sPDFFilesNDC =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Validate Form] action in Button widget.
  bool? ndcFormValidation;
  // Stores action output result for [Backend Call - API (Upload Certificate)] action in Button widget.
  ApiCallResponse? certificateUpload;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiCertificateAdmin;
  // State field(s) for loansearch111 widget.
  FocusNode? loansearch111FocusNode;
  TextEditingController? loansearch111TextController;
  String? Function(BuildContext, String?)? loansearch111TextControllerValidator;
  String? _loansearch111TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fuoma55e' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'mlpul6a2' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiCertificate1Search;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiCertificatereset1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in limit_drop_down widget.
  ApiCallResponse? apiCertificateLimitChange;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Icon widget.
  ApiCallResponse? apiCertificateFirst;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Icon widget.
  ApiCallResponse? apiCertificatePrevious;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Icon widget.
  ApiCallResponse? apiCertificateNext;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Icon widget.
  ApiCallResponse? apiCertificateLast;
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
    loansearch111TextControllerValidator =
        _loansearch111TextControllerValidator;
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

    loansearch111FocusNode?.dispose();
    loansearch111TextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
