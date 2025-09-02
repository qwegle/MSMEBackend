import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'payment_form_widget.dart' show PaymentFormWidget;
import 'package:flutter/material.dart';

class PaymentFormModel extends FlutterFlowModel<PaymentFormWidget> {
  ///  Local state fields for this component.

  List<dynamic> bills = [];
  void addToBills(dynamic item) => bills.add(item);
  void removeFromBills(dynamic item) => bills.remove(item);
  void removeAtIndexFromBills(int index) => bills.removeAt(index);
  void insertAtIndexInBills(int index, dynamic item) =>
      bills.insert(index, item);
  void updateBillsAtIndex(int index, Function(dynamic) updateFn) =>
      bills[index] = updateFn(bills[index]);

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TenderNumber widget.
  FocusNode? tenderNumberFocusNode;
  TextEditingController? tenderNumberTextController;
  String? Function(BuildContext, String?)? tenderNumberTextControllerValidator;
  String? _tenderNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1zb0o6uk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for HeadofAccount widget.
  FocusNode? headofAccountFocusNode;
  TextEditingController? headofAccountTextController;
  String? Function(BuildContext, String?)? headofAccountTextControllerValidator;
  String? _headofAccountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hnrmu6up' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NameOfPayee1 widget.
  FocusNode? nameOfPayee1FocusNode;
  TextEditingController? nameOfPayee1TextController;
  String? Function(BuildContext, String?)? nameOfPayee1TextControllerValidator;
  String? _nameOfPayee1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oi56432k' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kk3svro3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NamePurpose widget.
  FocusNode? namePurposeFocusNode;
  TextEditingController? namePurposeTextController;
  String? Function(BuildContext, String?)? namePurposeTextControllerValidator;
  String? _namePurposeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ta42fp9q' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PaymentProposedby widget.
  FocusNode? paymentProposedbyFocusNode;
  TextEditingController? paymentProposedbyTextController;
  String? Function(BuildContext, String?)?
      paymentProposedbyTextControllerValidator;
  String? _paymentProposedbyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'axtxrr87' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for FileReference widget.
  FocusNode? fileReferenceFocusNode;
  TextEditingController? fileReferenceTextController;
  String? Function(BuildContext, String?)? fileReferenceTextControllerValidator;
  String? _fileReferenceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5c22lqi2' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ExpenditurePurchaseAuthorisationorder widget.
  FocusNode? expenditurePurchaseAuthorisationorderFocusNode;
  TextEditingController? expenditurePurchaseAuthorisationorderTextController;
  String? Function(BuildContext, String?)?
      expenditurePurchaseAuthorisationorderTextControllerValidator;
  String? _expenditurePurchaseAuthorisationorderTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i1zfvdao' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for NatureofPayment widget.
  FocusNode? natureofPaymentFocusNode;
  TextEditingController? natureofPaymentTextController;
  String? Function(BuildContext, String?)?
      natureofPaymentTextControllerValidator;
  String? _natureofPaymentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lzusqqxd' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TypeAdvanceDropDown widget.
  String? typeAdvanceDropDownValue;
  FormFieldController<String>? typeAdvanceDropDownValueController;
  // State field(s) for MMRNoStockEntryFolioNo widget.
  FocusNode? mMRNoStockEntryFolioNoFocusNode;
  TextEditingController? mMRNoStockEntryFolioNoTextController;
  String? Function(BuildContext, String?)?
      mMRNoStockEntryFolioNoTextControllerValidator;
  String? _mMRNoStockEntryFolioNoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lfk38swr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SupplierAdvanceLFR widget.
  FocusNode? supplierAdvanceLFRFocusNode;
  TextEditingController? supplierAdvanceLFRTextController;
  String? Function(BuildContext, String?)?
      supplierAdvanceLFRTextControllerValidator;
  String? _supplierAdvanceLFRTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oupnaktm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for AmountofAdvanceifanyrequiringadjustment widget.
  FocusNode? amountofAdvanceifanyrequiringadjustmentFocusNode;
  TextEditingController? amountofAdvanceifanyrequiringadjustmentTextController;
  String? Function(BuildContext, String?)?
      amountofAdvanceifanyrequiringadjustmentTextControllerValidator;
  String? _amountofAdvanceifanyrequiringadjustmentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ilk17221' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked3;
  // State field(s) for ModeofPaymentDropDown widget.
  String? modeofPaymentDropDownValue;
  FormFieldController<String>? modeofPaymentDropDownValueController;
  // State field(s) for modeOfRemittanceDropDown widget.
  String? modeOfRemittanceDropDownValue;
  FormFieldController<String>? modeOfRemittanceDropDownValueController;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f4ood26h' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NameOfpayee widget.
  FocusNode? nameOfpayeeFocusNode;
  TextEditingController? nameOfpayeeTextController;
  String? Function(BuildContext, String?)? nameOfpayeeTextControllerValidator;
  String? _nameOfpayeeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'on52w8uv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NoDateofvoucherBill widget.
  FocusNode? noDateofvoucherBillFocusNode;
  TextEditingController? noDateofvoucherBillTextController;
  String? Function(BuildContext, String?)?
      noDateofvoucherBillTextControllerValidator;
  String? _noDateofvoucherBillTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cvy454re' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DetailsOfBillsAmount widget.
  FocusNode? detailsOfBillsAmountFocusNode;
  TextEditingController? detailsOfBillsAmountTextController;
  String? Function(BuildContext, String?)?
      detailsOfBillsAmountTextControllerValidator;
  String? _detailsOfBillsAmountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8he3orjb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ProposingOfficerName widget.
  FocusNode? proposingOfficerNameFocusNode;
  TextEditingController? proposingOfficerNameTextController;
  String? Function(BuildContext, String?)?
      proposingOfficerNameTextControllerValidator;
  String? _proposingOfficerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd7lvubzu' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ProposingOfficerDesignation widget.
  FocusNode? proposingOfficerDesignationFocusNode;
  TextEditingController? proposingOfficerDesignationTextController;
  String? Function(BuildContext, String?)?
      proposingOfficerDesignationTextControllerValidator;
  String? _proposingOfficerDesignationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '22w288yq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RecommendingOfficerName widget.
  FocusNode? recommendingOfficerNameFocusNode;
  TextEditingController? recommendingOfficerNameTextController;
  String? Function(BuildContext, String?)?
      recommendingOfficerNameTextControllerValidator;
  String? _recommendingOfficerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x50oxvmv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RecommendingOfficerDesignation widget.
  FocusNode? recommendingOfficerDesignationFocusNode;
  TextEditingController? recommendingOfficerDesignationTextController;
  String? Function(BuildContext, String?)?
      recommendingOfficerDesignationTextControllerValidator;
  String? _recommendingOfficerDesignationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fr1dtbg1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SanctioningAuthorityName widget.
  FocusNode? sanctioningAuthorityNameFocusNode;
  TextEditingController? sanctioningAuthorityNameTextController;
  String? Function(BuildContext, String?)?
      sanctioningAuthorityNameTextControllerValidator;
  String? _sanctioningAuthorityNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k6gckabq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SanctioningAuthorityDesignation widget.
  FocusNode? sanctioningAuthorityDesignationFocusNode;
  TextEditingController? sanctioningAuthorityDesignationTextController;
  String? Function(BuildContext, String?)?
      sanctioningAuthorityDesignationTextControllerValidator;
  String? _sanctioningAuthorityDesignationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a1jexymm' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked4;
  // State field(s) for PaymentRecommended widget.
  bool? paymentRecommendedValue;
  // State field(s) for PaymentAuthorised widget.
  bool? paymentAuthorisedValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateforms;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form2;
  // Stores action output result for [Backend Call - API ( Create Sanction Order)] action in Button widget.
  ApiCallResponse? apiSanctionOrder;

  @override
  void initState(BuildContext context) {
    tenderNumberTextControllerValidator = _tenderNumberTextControllerValidator;
    headofAccountTextControllerValidator =
        _headofAccountTextControllerValidator;
    nameOfPayee1TextControllerValidator = _nameOfPayee1TextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    namePurposeTextControllerValidator = _namePurposeTextControllerValidator;
    paymentProposedbyTextControllerValidator =
        _paymentProposedbyTextControllerValidator;
    fileReferenceTextControllerValidator =
        _fileReferenceTextControllerValidator;
    expenditurePurchaseAuthorisationorderTextControllerValidator =
        _expenditurePurchaseAuthorisationorderTextControllerValidator;
    natureofPaymentTextControllerValidator =
        _natureofPaymentTextControllerValidator;
    mMRNoStockEntryFolioNoTextControllerValidator =
        _mMRNoStockEntryFolioNoTextControllerValidator;
    supplierAdvanceLFRTextControllerValidator =
        _supplierAdvanceLFRTextControllerValidator;
    amountofAdvanceifanyrequiringadjustmentTextControllerValidator =
        _amountofAdvanceifanyrequiringadjustmentTextControllerValidator;
    amountTextControllerValidator = _amountTextControllerValidator;
    nameOfpayeeTextControllerValidator = _nameOfpayeeTextControllerValidator;
    noDateofvoucherBillTextControllerValidator =
        _noDateofvoucherBillTextControllerValidator;
    detailsOfBillsAmountTextControllerValidator =
        _detailsOfBillsAmountTextControllerValidator;
    proposingOfficerNameTextControllerValidator =
        _proposingOfficerNameTextControllerValidator;
    proposingOfficerDesignationTextControllerValidator =
        _proposingOfficerDesignationTextControllerValidator;
    recommendingOfficerNameTextControllerValidator =
        _recommendingOfficerNameTextControllerValidator;
    recommendingOfficerDesignationTextControllerValidator =
        _recommendingOfficerDesignationTextControllerValidator;
    sanctioningAuthorityNameTextControllerValidator =
        _sanctioningAuthorityNameTextControllerValidator;
    sanctioningAuthorityDesignationTextControllerValidator =
        _sanctioningAuthorityDesignationTextControllerValidator;
  }

  @override
  void dispose() {
    tenderNumberFocusNode?.dispose();
    tenderNumberTextController?.dispose();

    headofAccountFocusNode?.dispose();
    headofAccountTextController?.dispose();

    nameOfPayee1FocusNode?.dispose();
    nameOfPayee1TextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    namePurposeFocusNode?.dispose();
    namePurposeTextController?.dispose();

    paymentProposedbyFocusNode?.dispose();
    paymentProposedbyTextController?.dispose();

    fileReferenceFocusNode?.dispose();
    fileReferenceTextController?.dispose();

    expenditurePurchaseAuthorisationorderFocusNode?.dispose();
    expenditurePurchaseAuthorisationorderTextController?.dispose();

    natureofPaymentFocusNode?.dispose();
    natureofPaymentTextController?.dispose();

    mMRNoStockEntryFolioNoFocusNode?.dispose();
    mMRNoStockEntryFolioNoTextController?.dispose();

    supplierAdvanceLFRFocusNode?.dispose();
    supplierAdvanceLFRTextController?.dispose();

    amountofAdvanceifanyrequiringadjustmentFocusNode?.dispose();
    amountofAdvanceifanyrequiringadjustmentTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();

    nameOfpayeeFocusNode?.dispose();
    nameOfpayeeTextController?.dispose();

    noDateofvoucherBillFocusNode?.dispose();
    noDateofvoucherBillTextController?.dispose();

    detailsOfBillsAmountFocusNode?.dispose();
    detailsOfBillsAmountTextController?.dispose();

    proposingOfficerNameFocusNode?.dispose();
    proposingOfficerNameTextController?.dispose();

    proposingOfficerDesignationFocusNode?.dispose();
    proposingOfficerDesignationTextController?.dispose();

    recommendingOfficerNameFocusNode?.dispose();
    recommendingOfficerNameTextController?.dispose();

    recommendingOfficerDesignationFocusNode?.dispose();
    recommendingOfficerDesignationTextController?.dispose();

    sanctioningAuthorityNameFocusNode?.dispose();
    sanctioningAuthorityNameTextController?.dispose();

    sanctioningAuthorityDesignationFocusNode?.dispose();
    sanctioningAuthorityDesignationTextController?.dispose();
  }
}
