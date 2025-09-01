import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'no_due_certificates_user_widget.dart' show NoDueCertificatesUserWidget;
import 'package:flutter/material.dart';

class NoDueCertificatesUserModel
    extends FlutterFlowModel<NoDueCertificatesUserWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for LoanNumbersearch widget.
  FocusNode? loanNumbersearchFocusNode;
  TextEditingController? loanNumbersearchTextController;
  String? Function(BuildContext, String?)?
      loanNumbersearchTextControllerValidator;
  String? _loanNumbersearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qlel0l8c' /* Search your loan number... is ... */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'og16loe0' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? form1;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiNDCFilterUser;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Button widget.
  ApiCallResponse? apiNDCFilterResetUser;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    loanNumbersearchTextControllerValidator =
        _loanNumbersearchTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    loanNumbersearchFocusNode?.dispose();
    loanNumbersearchTextController?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
