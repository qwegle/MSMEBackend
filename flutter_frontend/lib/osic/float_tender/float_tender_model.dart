import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'float_tender_widget.dart' show FloatTenderWidget;
import 'package:flutter/material.dart';

class FloatTenderModel extends FlutterFlowModel<FloatTenderWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsic component.
  late MainwebnavOsicModel mainwebnavOsicModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for TenderRFPNumber widget.
  FocusNode? tenderRFPNumberFocusNode;
  TextEditingController? tenderRFPNumberTextController;
  String? Function(BuildContext, String?)?
      tenderRFPNumberTextControllerValidator;
  String? _tenderRFPNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '17kpo2oa' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ProjectTitle widget.
  FocusNode? projectTitleFocusNode;
  TextEditingController? projectTitleTextController;
  String? Function(BuildContext, String?)? projectTitleTextControllerValidator;
  String? _projectTitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w63sdxrk' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Backend Call - API (create Float Tender)] action in Button widget.
  ApiCallResponse? apiFloteTender;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Button widget.
  ApiCallResponse? apiFloatTenderUpdate;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearch;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTS;
  // State field(s) for Float_limit_drop_down widget.
  String? floatLimitDropDownValue;
  FormFieldController<String>? floatLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Float_limit_drop_down widget.
  ApiCallResponse? floatTenderapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiFirst;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiPrevious;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiNext;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiLast;
  // Model for footer component.
  late FooterModel footerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
    tenderRFPNumberTextControllerValidator =
        _tenderRFPNumberTextControllerValidator;
    projectTitleTextControllerValidator = _projectTitleTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsicModel.dispose();
    languageModel.dispose();
    tenderRFPNumberFocusNode?.dispose();
    tenderRFPNumberTextController?.dispose();

    projectTitleFocusNode?.dispose();
    projectTitleTextController?.dispose();

    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    textFieldFocusNode3?.dispose();
    textController6?.dispose();

    textFieldFocusNode4?.dispose();
    textController7?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
