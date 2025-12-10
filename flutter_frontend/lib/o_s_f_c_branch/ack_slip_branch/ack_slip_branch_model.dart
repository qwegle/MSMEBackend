import '/backend/api_requests/api_calls.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ack_slip_branch_widget.dart' show AckSlipBranchWidget;
import 'package:flutter/material.dart';

class AckSlipBranchModel extends FlutterFlowModel<AckSlipBranchWidget> {
  ///  Local state fields for this page.

  dynamic search;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcBranch component.
  late MainwebnavOsfcBranchModel mainwebnavOsfcBranchModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for LoanNumberSearch widget.
  FocusNode? loanNumberSearchFocusNode;
  TextEditingController? loanNumberSearchTextController;
  String? Function(BuildContext, String?)?
      loanNumberSearchTextControllerValidator;
  String? _loanNumberSearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lxh2dd0t' /* Search your loan number is req... */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        '9zqg24z1' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formval;
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
    mainwebnavOsfcBranchModel =
        createModel(context, () => MainwebnavOsfcBranchModel());
    languageModel = createModel(context, () => LanguageModel());
    loanNumberSearchTextControllerValidator =
        _loanNumberSearchTextControllerValidator;
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcBranchModel.dispose();
    languageModel.dispose();
    loanNumberSearchFocusNode?.dispose();
    loanNumberSearchTextController?.dispose();

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
