import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tender_details_widget.dart' show TenderDetailsWidget;
import 'package:flutter/material.dart';

class TenderDetailsModel extends FlutterFlowModel<TenderDetailsWidget> {
  ///  Local state fields for this page.

  List<dynamic> bidderDetailsNo = [];
  void addToBidderDetailsNo(dynamic item) => bidderDetailsNo.add(item);
  void removeFromBidderDetailsNo(dynamic item) => bidderDetailsNo.remove(item);
  void removeAtIndexFromBidderDetailsNo(int index) =>
      bidderDetailsNo.removeAt(index);
  void insertAtIndexInBidderDetailsNo(int index, dynamic item) =>
      bidderDetailsNo.insert(index, item);
  void updateBidderDetailsNoAtIndex(int index, Function(dynamic) updateFn) =>
      bidderDetailsNo[index] = updateFn(bidderDetailsNo[index]);

  List<dynamic> bidderDetails = [];
  void addToBidderDetails(dynamic item) => bidderDetails.add(item);
  void removeFromBidderDetails(dynamic item) => bidderDetails.remove(item);
  void removeAtIndexFromBidderDetails(int index) =>
      bidderDetails.removeAt(index);
  void insertAtIndexInBidderDetails(int index, dynamic item) =>
      bidderDetails.insert(index, item);
  void updateBidderDetailsAtIndex(int index, Function(dynamic) updateFn) =>
      bidderDetails[index] = updateFn(bidderDetails[index]);

  String? tenderNumber;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsic component.
  late MainwebnavOsicModel mainwebnavOsicModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for TenderNumber widget.
  FocusNode? tenderNumberFocusNode;
  TextEditingController? tenderNumberTextController;
  String? Function(BuildContext, String?)? tenderNumberTextControllerValidator;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for BidValue widget.
  FocusNode? bidValueFocusNode;
  TextEditingController? bidValueTextController;
  String? Function(BuildContext, String?)? bidValueTextControllerValidator;
  // State field(s) for BidderScore widget.
  FocusNode? bidderScoreFocusNode;
  TextEditingController? bidderScoreTextController;
  String? Function(BuildContext, String?)? bidderScoreTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalidation2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidFinalSumbition;
  // Stores action output result for [Backend Call - API (create Tender Result)] action in Button widget.
  ApiCallResponse? apiTenderResul;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Button widget.
  ApiCallResponse? apiTenderDetails;
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
  // State field(s) for Tender_limit_drop_down widget.
  String? tenderLimitDropDownValue;
  FormFieldController<String>? tenderLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Tender_limit_drop_down widget.
  ApiCallResponse? tenderResultapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiFirst;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiPrevious;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiNext;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiLAst;
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
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsicModel.dispose();
    languageModel.dispose();
    tenderNumberFocusNode?.dispose();
    tenderNumberTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    bidValueFocusNode?.dispose();
    bidValueTextController?.dispose();

    bidderScoreFocusNode?.dispose();
    bidderScoreTextController?.dispose();

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
