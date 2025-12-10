import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_admin/mainwebnav_osfc_admin_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'memorandom_admin_widget.dart' show MemorandomAdminWidget;
import 'package:flutter/material.dart';

class MemorandomAdminModel extends FlutterFlowModel<MemorandomAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcAdmin component.
  late MainwebnavOsfcAdminModel mainwebnavOsfcAdminModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for MemoBranchDropdown widget.
  String? memoBranchDropdownValue;
  FormFieldController<String>? memoBranchDropdownValueController;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in MemoBranchDropdown widget.
  ApiCallResponse? apiMemoselect1;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  String? _loansearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7jtua2f7' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'zjn7f6qb' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Button widget.
  ApiCallResponse? apiMemoSearchs1;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Button widget.
  ApiCallResponse? apiMemoSearchClears;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsViews;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in limit_drop_down widget.
  ApiCallResponse? apiMemoLimitChange;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Icon widget.
  ApiCallResponse? apiMemoFirst;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Icon widget.
  ApiCallResponse? apiMemoPrevious;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Icon widget.
  ApiCallResponse? apiMemoNext;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Icon widget.
  ApiCallResponse? apiMemoLAst;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcAdminModel =
        createModel(context, () => MainwebnavOsfcAdminModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearchTextControllerValidator = _loansearchTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcAdminModel.dispose();
    languageModel.dispose();
    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
