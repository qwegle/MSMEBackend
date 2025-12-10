import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'govt_order_widget.dart' show GovtOrderWidget;
import 'package:flutter/material.dart';

class GovtOrderModel extends FlutterFlowModel<GovtOrderWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsic component.
  late MainwebnavOsicModel mainwebnavOsicModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for Ordertitle widget.
  FocusNode? ordertitleFocusNode;
  TextEditingController? ordertitleTextController;
  String? Function(BuildContext, String?)? ordertitleTextControllerValidator;
  String? _ordertitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '99zhai27' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Departmentname widget.
  FocusNode? departmentnameFocusNode;
  TextEditingController? departmentnameTextController;
  String? Function(BuildContext, String?)?
      departmentnameTextControllerValidator;
  String? _departmentnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lmd33j8r' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Pointofcontact widget.
  FocusNode? pointofcontactFocusNode;
  TextEditingController? pointofcontactTextController;
  String? Function(BuildContext, String?)?
      pointofcontactTextControllerValidator;
  String? _pointofcontactTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '70yujwbo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ContactNumber widget.
  FocusNode? contactNumberFocusNode;
  TextEditingController? contactNumberTextController;
  String? Function(BuildContext, String?)? contactNumberTextControllerValidator;
  String? _contactNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6r6eesl7' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Backend Call - API (Create Government Order)] action in Button widget.
  ApiCallResponse? apiGovOrder;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Button widget.
  ApiCallResponse? apiGovOrderApiUpdate;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  // State field(s) for Govt_limit_drop_down widget.
  String? govtLimitDropDownValue;
  FormFieldController<String>? govtLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Govt_limit_drop_down widget.
  ApiCallResponse? govOrderApiLimitChange;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiFirst;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiprevious;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiNext;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapIlast;
  // Model for footer component.
  late FooterModel footerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
    ordertitleTextControllerValidator = _ordertitleTextControllerValidator;
    departmentnameTextControllerValidator =
        _departmentnameTextControllerValidator;
    pointofcontactTextControllerValidator =
        _pointofcontactTextControllerValidator;
    contactNumberTextControllerValidator =
        _contactNumberTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsicModel.dispose();
    languageModel.dispose();
    ordertitleFocusNode?.dispose();
    ordertitleTextController?.dispose();

    departmentnameFocusNode?.dispose();
    departmentnameTextController?.dispose();

    pointofcontactFocusNode?.dispose();
    pointofcontactTextController?.dispose();

    contactNumberFocusNode?.dispose();
    contactNumberTextController?.dispose();

    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController6?.dispose();

    textFieldFocusNode2?.dispose();
    textController7?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();

    textFieldFocusNode4?.dispose();
    textController9?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
