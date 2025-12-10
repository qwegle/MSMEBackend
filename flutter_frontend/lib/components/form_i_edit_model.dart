import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_i_edit_widget.dart' show FormIEditWidget;
import 'package:flutter/material.dart';

class FormIEditModel extends FlutterFlowModel<FormIEditWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SubCenterNameTextField widget.
  FocusNode? subCenterNameTextFieldFocusNode;
  TextEditingController? subCenterNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      subCenterNameTextFieldTextControllerValidator;
  String? _subCenterNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wbvlsk1a' /* TextField is required */,
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
        'aw1br1ts' /* TextField is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for FromBillNumberTextField widget.
  FocusNode? fromBillNumberTextFieldFocusNode;
  TextEditingController? fromBillNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      fromBillNumberTextFieldTextControllerValidator;
  String? _fromBillNumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cvwuw5qq' /* TextField is required */,
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
        '3w9z1y4k' /* TextField is required */,
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
        '2ymebl8y' /* 0 is required */,
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
        'iqd3npf2' /* 0 is required */,
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
        '6a1esfir' /* Enter Remark is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
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
  }
}
