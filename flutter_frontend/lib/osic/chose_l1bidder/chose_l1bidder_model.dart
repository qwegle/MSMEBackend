import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'chose_l1bidder_widget.dart' show ChoseL1bidderWidget;
import 'package:flutter/material.dart';

class ChoseL1bidderModel extends FlutterFlowModel<ChoseL1bidderWidget> {
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
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Button widget.
  ApiCallResponse? apiChoseL1Bidders;
  // State field(s) for ChoseL1BidderCheckbox widget.
  bool? choseL1BidderCheckboxValue;
  // State field(s) for ChoseConsortiumCheckbox widget.
  bool? choseConsortiumCheckboxValue;
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
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
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

    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

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
