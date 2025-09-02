import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'application_list_branch_widget.dart' show ApplicationListBranchWidget;
import 'package:flutter/material.dart';

class ApplicationListBranchModel
    extends FlutterFlowModel<ApplicationListBranchWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for MainwebnavOsfcBranch component.
  late MainwebnavOsfcBranchModel mainwebnavOsfcBranchModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Tab widget.
  ApiCallResponse? apiResulOtsAll;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode1;
  TextEditingController? loansearchTextController1;
  String? Function(BuildContext, String?)? loansearchTextController1Validator;
  String? _loansearchTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'grqqfa7b' /* loan number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        '00lpt6tf' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalis1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearchAll;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTS;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView1;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue1;
  FormFieldController<String>? limitDropDownValueController1;
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
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Tab widget.
  ApiCallResponse? apiResulOtsPending;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode2;
  TextEditingController? loansearchTextController2;
  String? Function(BuildContext, String?)? loansearchTextController2Validator;
  String? _loansearchTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uip269ab' /*  Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        '1jzdwh6c' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? form2;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? papiResulloanSearch;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? papiResulALLOTS;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButtons widget.
  ApiCallResponse? puserReffDetailsView;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? puserReffDetailsView2;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue2;
  FormFieldController<String>? limitDropDownValueController2;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in limit_drop_down widget.
  ApiCallResponse? papiLimitChange;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? papiFirst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? papiprevious;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? papiNext;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? papiLAst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Tab widget.
  ApiCallResponse? apiResulOtsApproved;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode3;
  TextEditingController? loansearchTextController3;
  String? Function(BuildContext, String?)? loansearchTextController3Validator;
  String? _loansearchTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't1tjrol3' /* Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'npll1eoc' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalidation3;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? aapiResulloanSearchApproved;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? aapiResulALLOTS;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButtons widget.
  ApiCallResponse? auserReffDetailsView;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? auserReffDetailsView3;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue3;
  FormFieldController<String>? limitDropDownValueController3;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in limit_drop_down widget.
  ApiCallResponse? aapiLimitChange;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? aapiFirst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? aapiprevious;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? aapiNext;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? aapiLAst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Tab widget.
  ApiCallResponse? apiResulOtsReject;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode4;
  TextEditingController? loansearchTextController4;
  String? Function(BuildContext, String?)? loansearchTextController4Validator;
  String? _loansearchTextController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dgrg2k86' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'vtqgqq4c' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formval4;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearchReject;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTSR;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButtons widget.
  ApiCallResponse? ruserReffDetailsView;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? ruserReffDetailsView4;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue4;
  FormFieldController<String>? limitDropDownValueController4;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in limit_drop_down widget.
  ApiCallResponse? rapiLimitChange;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? rapiFirst;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? rapiprevious;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? rapiNext;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Icon widget.
  ApiCallResponse? rapiLAst;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcBranchModel =
        createModel(context, () => MainwebnavOsfcBranchModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearchTextController1Validator = _loansearchTextController1Validator;
    loansearchTextController2Validator = _loansearchTextController2Validator;
    loansearchTextController3Validator = _loansearchTextController3Validator;
    loansearchTextController4Validator = _loansearchTextController4Validator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcBranchModel.dispose();
    languageModel.dispose();
    tabBarController?.dispose();
    loansearchFocusNode1?.dispose();
    loansearchTextController1?.dispose();

    loansearchFocusNode2?.dispose();
    loansearchTextController2?.dispose();

    loansearchFocusNode3?.dispose();
    loansearchTextController3?.dispose();

    loansearchFocusNode4?.dispose();
    loansearchTextController4?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
