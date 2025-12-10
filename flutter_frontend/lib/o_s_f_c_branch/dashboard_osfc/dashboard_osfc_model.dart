import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dashboard_osfc_widget.dart' show DashboardOsfcWidget;
import 'package:flutter/material.dart';

class DashboardOsfcModel extends FlutterFlowModel<DashboardOsfcWidget> {
  ///  Local state fields for this page.

  dynamic search;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in DashboardOsfc widget.
  ApiCallResponse? apiResultfilterOtsDash154;
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
        '2k9hn5gh' /* loan number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'rv0re3ex' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalidate;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearch;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTS;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView1;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in limit_drop_down widget.
  ApiCallResponse? apiLimitChange;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? apiFirst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? apiprevious;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? apiNext;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? apiLAst;
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
