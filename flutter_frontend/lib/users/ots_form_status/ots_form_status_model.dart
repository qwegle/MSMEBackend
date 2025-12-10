import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'ots_form_status_widget.dart' show OtsFormStatusWidget;
import 'package:flutter/material.dart';

class OtsFormStatusModel extends FlutterFlowModel<OtsFormStatusWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode1;
  TextEditingController? loansearchTextController1;
  String? Function(BuildContext, String?)? loansearchTextController1Validator;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearch;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanReset;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? userReffDetails;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode2;
  TextEditingController? loansearchTextController2;
  String? Function(BuildContext, String?)? loansearchTextController2Validator;
  String? _loansearchTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qknaqri1' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'r5eqnlpa' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? form1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearch1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTS;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView1;
  // Stores action output result for [Backend Call - API (Track Application Status)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView2;
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
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearchTextController2Validator = _loansearchTextController2Validator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    loansearchFocusNode1?.dispose();
    loansearchTextController1?.dispose();

    paginatedDataTableController.dispose();
    loansearchFocusNode2?.dispose();
    loansearchTextController2?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
