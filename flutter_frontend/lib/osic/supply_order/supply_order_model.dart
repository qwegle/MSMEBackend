import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'supply_order_widget.dart' show SupplyOrderWidget;
import 'package:flutter/material.dart';

class SupplyOrderModel extends FlutterFlowModel<SupplyOrderWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

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
  String? _tenderNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vdkqa6hn' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TenderValue widget.
  FocusNode? tenderValueFocusNode;
  TextEditingController? tenderValueTextController;
  String? Function(BuildContext, String?)? tenderValueTextControllerValidator;
  String? _tenderValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ro22xjnt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SupplyDetails widget.
  FocusNode? supplyDetailsFocusNode;
  TextEditingController? supplyDetailsTextController;
  String? Function(BuildContext, String?)? supplyDetailsTextControllerValidator;
  String? _supplyDetailsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '93zecepb' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading_proofofSupply = false;
  FFUploadedFile uploadedLocalFile_proofofSupply =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadInvoice = false;
  FFUploadedFile uploadedLocalFile_uploadInvoice =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for InvoiceNumber widget.
  FocusNode? invoiceNumberFocusNode;
  TextEditingController? invoiceNumberTextController;
  String? Function(BuildContext, String?)? invoiceNumberTextControllerValidator;
  String? _invoiceNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oy72hgbh' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for InvoiceAmount widget.
  FocusNode? invoiceAmountFocusNode;
  TextEditingController? invoiceAmountTextController;
  String? Function(BuildContext, String?)? invoiceAmountTextControllerValidator;
  String? _invoiceAmountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p9gwfjej' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formvalidation;
  // Stores action output result for [Backend Call - API (Create Supply Order)] action in Button widget.
  ApiCallResponse? apiSupplyOrder;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Button widget.
  ApiCallResponse? apiSupplyOrderUpdate;
  // State field(s) for loansearch widget.
  FocusNode? loansearchFocusNode;
  TextEditingController? loansearchTextController;
  String? Function(BuildContext, String?)? loansearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulloanSearch;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Button widget.
  ApiCallResponse? apiResulALLOTS;
  // State field(s) for Supply_limit_drop_down widget.
  String? supplyLimitDropDownValue;
  FormFieldController<String>? supplyLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Supply_limit_drop_down widget.
  ApiCallResponse? supplyOrderapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiFirst;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapipreviousPage;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiNext;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiLast;
  // Model for footer component.
  late FooterModel footerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
    tenderNumberTextControllerValidator = _tenderNumberTextControllerValidator;
    tenderValueTextControllerValidator = _tenderValueTextControllerValidator;
    supplyDetailsTextControllerValidator =
        _supplyDetailsTextControllerValidator;
    invoiceNumberTextControllerValidator =
        _invoiceNumberTextControllerValidator;
    invoiceAmountTextControllerValidator =
        _invoiceAmountTextControllerValidator;
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

    tenderValueFocusNode?.dispose();
    tenderValueTextController?.dispose();

    supplyDetailsFocusNode?.dispose();
    supplyDetailsTextController?.dispose();

    invoiceNumberFocusNode?.dispose();
    invoiceNumberTextController?.dispose();

    invoiceAmountFocusNode?.dispose();
    invoiceAmountTextController?.dispose();

    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController7?.dispose();

    textFieldFocusNode2?.dispose();
    textController8?.dispose();

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    textFieldFocusNode4?.dispose();
    textController10?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
