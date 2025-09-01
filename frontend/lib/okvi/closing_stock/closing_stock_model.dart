import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'closing_stock_widget.dart' show ClosingStockWidget;
import 'package:flutter/material.dart';

class ClosingStockModel extends FlutterFlowModel<ClosingStockWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOkvi component.
  late MainwebnavOkviModel mainwebnavOkviModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for FestivalName widget.
  String? festivalNameValue;
  FormFieldController<String>? festivalNameValueController;
  // State field(s) for Head widget.
  String? headValue;
  FormFieldController<String>? headValueController;
  // State field(s) for SubheadProductName widget.
  FocusNode? subheadProductNameFocusNode;
  TextEditingController? subheadProductNameTextController;
  String? Function(BuildContext, String?)?
      subheadProductNameTextControllerValidator;
  // State field(s) for UnitType widget.
  String? unitTypeValue;
  FormFieldController<String>? unitTypeValueController;
  // State field(s) for UnitPrice widget.
  FocusNode? unitPriceFocusNode;
  TextEditingController? unitPriceTextController;
  String? Function(BuildContext, String?)? unitPriceTextControllerValidator;
  // State field(s) for Quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // State field(s) for Totalprice widget.
  FocusNode? totalpriceFocusNode;
  TextEditingController? totalpriceTextController;
  String? Function(BuildContext, String?)? totalpriceTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    mainwebnavOkviModel = createModel(context, () => MainwebnavOkviModel());
  }

  @override
  void dispose() {
    mainwebnavOkviModel.dispose();
    subheadProductNameFocusNode?.dispose();
    subheadProductNameTextController?.dispose();

    unitPriceFocusNode?.dispose();
    unitPriceTextController?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    totalpriceFocusNode?.dispose();
    totalpriceTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
