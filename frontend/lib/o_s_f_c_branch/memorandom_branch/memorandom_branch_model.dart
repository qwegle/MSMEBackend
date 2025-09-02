import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'memorandom_branch_widget.dart' show MemorandomBranchWidget;
import 'package:flutter/material.dart';

class MemorandomBranchModel extends FlutterFlowModel<MemorandomBranchWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for MainwebnavOsfcBranch component.
  late MainwebnavOsfcBranchModel mainwebnavOsfcBranchModel;
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
        'c1v9hlr0' /* Loan number is required */,
      );
    }

    return null;
  }

  bool isDataUploading_pDFFileUploadMemo = false;
  FFUploadedFile uploadedLocalFile_pDFFileUploadMemo =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValid1;
  // Stores action output result for [Backend Call - API (Upload Memorandum)] action in Button widget.
  ApiCallResponse? apiResult3xmMEMO;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Button widget.
  ApiCallResponse? apiResultfilterMemo;
  // State field(s) for MemoBranchDropdown widget.
  String? memoBranchDropdownValue;
  FormFieldController<String>? memoBranchDropdownValueController;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in MemoBranchDropdown widget.
  ApiCallResponse? apiMemoselect;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  String? _loansearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nkdppjfq' /* Search your loan number... is ... */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        '5hm5avez' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvali1;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Button widget.
  ApiCallResponse? apiMemoSearchs;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Button widget.
  ApiCallResponse? apiMemoSearchClears;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView;
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
    mainwebnavOsfcBranchModel =
        createModel(context, () => MainwebnavOsfcBranchModel());
    languageModel = createModel(context, () => LanguageModel());
    loanNumberTextControllerValidator = _loanNumberTextControllerValidator;
    loansearchTextControllerValidator = _loansearchTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcBranchModel.dispose();
    languageModel.dispose();
    loanNumberFocusNode?.dispose();
    loanNumberTextController?.dispose();

    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
