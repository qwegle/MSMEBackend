import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'no_due_certificateview_widget.dart' show NoDueCertificateviewWidget;
import 'package:flutter/material.dart';

class NoDueCertificateviewModel
    extends FlutterFlowModel<NoDueCertificateviewWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcBranch component.
  late MainwebnavOsfcBranchModel mainwebnavOsfcBranchModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  String? _loansearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9d5dtgmh' /* loan number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        '0ryynu2s' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateform;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiCertificate1Search;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiCertificatereset1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView2;
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
    mainwebnavOsfcBranchModel =
        createModel(context, () => MainwebnavOsfcBranchModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearchTextControllerValidator = _loansearchTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcBranchModel.dispose();
    languageModel.dispose();
    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
