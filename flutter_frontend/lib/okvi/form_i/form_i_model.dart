import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_i_widget.dart' show FormIWidget;
import 'package:flutter/material.dart';

class FormIModel extends FlutterFlowModel<FormIWidget> {
  ///  Local state fields for this page.

  List<dynamic> formI = [];
  void addToFormI(dynamic item) => formI.add(item);
  void removeFromFormI(dynamic item) => formI.remove(item);
  void removeAtIndexFromFormI(int index) => formI.removeAt(index);
  void insertAtIndexInFormI(int index, dynamic item) =>
      formI.insert(index, item);
  void updateFormIAtIndex(int index, Function(dynamic) updateFn) =>
      formI[index] = updateFn(formI[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOkvi component.
  late MainwebnavOkviModel mainwebnavOkviModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for SubCenterNameTextField widget.
  FocusNode? subCenterNameTextFieldFocusNode;
  TextEditingController? subCenterNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      subCenterNameTextFieldTextControllerValidator;
  String? _subCenterNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fqb4k8mv' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for HeadDropDown widget.
  String? headDropDownValue;
  FormFieldController<String>? headDropDownValueController;
  // State field(s) for SubCenterAddressTextField widget.
  FocusNode? subCenterAddressTextFieldFocusNode;
  TextEditingController? subCenterAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      subCenterAddressTextFieldTextControllerValidator;
  String? _subCenterAddressTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f72h1b16' /* TextField is required */,
      );
    }

    return null;
  }

  DateTime? datePicked4;
  // State field(s) for FromBillNumberTextField widget.
  FocusNode? fromBillNumberTextFieldFocusNode;
  TextEditingController? fromBillNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      fromBillNumberTextFieldTextControllerValidator;
  String? _fromBillNumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oj958ggz' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for ToBillNumberTextField widget.
  FocusNode? toBillNumberTextFieldFocusNode;
  TextEditingController? toBillNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      toBillNumberTextFieldTextControllerValidator;
  String? _toBillNumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's2dt3n0q' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for RetailSaleAmountTextField widget.
  FocusNode? retailSaleAmountTextFieldFocusNode;
  TextEditingController? retailSaleAmountTextFieldTextController;
  String? Function(BuildContext, String?)?
      retailSaleAmountTextFieldTextControllerValidator;
  String? _retailSaleAmountTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kn0k445u' /* 0 is required */,
      );
    }

    return null;
  }

  // State field(s) for RebatePaidAmountTextField widget.
  FocusNode? rebatePaidAmountTextFieldFocusNode;
  TextEditingController? rebatePaidAmountTextFieldTextController;
  String? Function(BuildContext, String?)?
      rebatePaidAmountTextFieldTextControllerValidator;
  String? _rebatePaidAmountTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '10urn9li' /* 0 is required */,
      );
    }

    return null;
  }

  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;
  String? _remarkTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oezktk7l' /* Enter Remark is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Backend Call - API (Claim Documents Form I)] action in Button widget.
  ApiCallResponse? apiResulFormISumbit;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    mainwebnavOkviModel = createModel(context, () => MainwebnavOkviModel());
    subCenterNameTextFieldTextControllerValidator =
        _subCenterNameTextFieldTextControllerValidator;
    subCenterAddressTextFieldTextControllerValidator =
        _subCenterAddressTextFieldTextControllerValidator;
    fromBillNumberTextFieldTextControllerValidator =
        _fromBillNumberTextFieldTextControllerValidator;
    toBillNumberTextFieldTextControllerValidator =
        _toBillNumberTextFieldTextControllerValidator;
    retailSaleAmountTextFieldTextControllerValidator =
        _retailSaleAmountTextFieldTextControllerValidator;
    rebatePaidAmountTextFieldTextControllerValidator =
        _rebatePaidAmountTextFieldTextControllerValidator;
    remarkTextFieldTextControllerValidator =
        _remarkTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    mainwebnavOkviModel.dispose();
    subCenterNameTextFieldFocusNode?.dispose();
    subCenterNameTextFieldTextController?.dispose();

    subCenterAddressTextFieldFocusNode?.dispose();
    subCenterAddressTextFieldTextController?.dispose();

    fromBillNumberTextFieldFocusNode?.dispose();
    fromBillNumberTextFieldTextController?.dispose();

    toBillNumberTextFieldFocusNode?.dispose();
    toBillNumberTextFieldTextController?.dispose();

    retailSaleAmountTextFieldFocusNode?.dispose();
    retailSaleAmountTextFieldTextController?.dispose();

    rebatePaidAmountTextFieldFocusNode?.dispose();
    rebatePaidAmountTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController8?.dispose();

    textFieldFocusNode2?.dispose();
    textController9?.dispose();

    textFieldFocusNode3?.dispose();
    textController10?.dispose();

    textFieldFocusNode4?.dispose();
    textController11?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
