import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_admin/mainwebnav_osfc_admin_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'acknowledgement_slip_admin_widget.dart'
    show AcknowledgementSlipAdminWidget;
import 'package:flutter/material.dart';

class AcknowledgementSlipAdminModel
    extends FlutterFlowModel<AcknowledgementSlipAdminWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
        'ips0y9s5' /* Search your loan number... is ... */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'vyt4jbyk' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Button widget.
  ApiCallResponse? apiResultwAckFilterSearch;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Button widget.
  ApiCallResponse? apiResultwAckFilterReset;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in limit_drop_down widget.
  ApiCallResponse? apiAckLimitChange;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Icon widget.
  ApiCallResponse? apiAckFirst;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Icon widget.
  ApiCallResponse? apiAckprevious;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Icon widget.
  ApiCallResponse? apiAckNext;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Icon widget.
  ApiCallResponse? apiAckLAst;
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
    mainwebnavOsfcAdminModel =
        createModel(context, () => MainwebnavOsfcAdminModel());
    languageModel = createModel(context, () => LanguageModel());
    loanNumberTextControllerValidator = _loanNumberTextControllerValidator;
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
