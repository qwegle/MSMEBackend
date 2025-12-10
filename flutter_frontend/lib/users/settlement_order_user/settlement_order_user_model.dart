import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'settlement_order_user_widget.dart' show SettlementOrderUserWidget;
import 'package:flutter/material.dart';

class SettlementOrderUserModel
    extends FlutterFlowModel<SettlementOrderUserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for loansearch2 widget.
  FocusNode? loansearch2FocusNode;
  TextEditingController? loansearch2TextController;
  String? Function(BuildContext, String?)? loansearch2TextControllerValidator;
  String? _loansearch2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zmr1i9co' /* Search Loan Number is required */,
      );
    }

    if (val.length < 13) {
      return FFLocalizations.of(context).getText(
        'xupz74w3' /* Enter full 13-character loan n... */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValid;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Button widget.
  ApiCallResponse? apiResulloanSearch1;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Button widget.
  ApiCallResponse? apiResulloanReset1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView1;
  // Stores action output result for [Backend Call - API (Track Application Status)] action in IconButton widget.
  ApiCallResponse? userReffDetailsView2;
  // State field(s) for limit_drop_down widget.
  String? limitDropDownValue;
  FormFieldController<String>? limitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in limit_drop_down widget.
  ApiCallResponse? apiLimitChange;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiFirst;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiprevious;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiNext;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Icon widget.
  ApiCallResponse? apiLAst;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    loansearch2TextControllerValidator = _loansearch2TextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    loansearch2FocusNode?.dispose();
    loansearch2TextController?.dispose();

    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
