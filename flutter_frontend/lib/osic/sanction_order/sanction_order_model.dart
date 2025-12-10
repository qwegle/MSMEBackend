import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sanction_order_widget.dart' show SanctionOrderWidget;
import 'package:flutter/material.dart';

class SanctionOrderModel extends FlutterFlowModel<SanctionOrderWidget> {
  ///  Local state fields for this page.

  List<dynamic> paymentSlip = [];
  void addToPaymentSlip(dynamic item) => paymentSlip.add(item);
  void removeFromPaymentSlip(dynamic item) => paymentSlip.remove(item);
  void removeAtIndexFromPaymentSlip(int index) => paymentSlip.removeAt(index);
  void insertAtIndexInPaymentSlip(int index, dynamic item) =>
      paymentSlip.insert(index, item);
  void updatePaymentSlipAtIndex(int index, Function(dynamic) updateFn) =>
      paymentSlip[index] = updateFn(paymentSlip[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOsic component.
  late MainwebnavOsicModel mainwebnavOsicModel;
  // Model for Language component.
  late LanguageModel languageModel;
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
  // State field(s) for TenderNumber widget.
  FocusNode? tenderNumberFocusNode;
  TextEditingController? tenderNumberTextController;
  String? Function(BuildContext, String?)? tenderNumberTextControllerValidator;
  String? _tenderNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6umdwm4c' /* Field is required */,
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
        'msm7ibbw' /* Field is required */,
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
        '7hlmbrym' /* Field is required */,
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
        'w26tw27f' /* Field is required */,
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
        'k9bmwuiz' /* Field is required */,
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
        'dxiq213x' /* Field is required */,
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
        'o0ze956z' /* Field is required */,
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
        'i40k9p17' /* Field is required */,
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
        '1guetj6m' /* Field is required */,
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
        'hx0y1oo5' /* Field is required */,
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
        'sni0ya23' /* Field is required */,
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
        'kvz9mvro' /* Field is required */,
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
        '1aw3r6ja' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NameOfpayee_no widget.
  FocusNode? nameOfpayeeNoFocusNode;
  TextEditingController? nameOfpayeeNoTextController;
  String? Function(BuildContext, String?)? nameOfpayeeNoTextControllerValidator;
  // State field(s) for NoDateofvoucherBill_no widget.
  FocusNode? noDateofvoucherBillNoFocusNode;
  TextEditingController? noDateofvoucherBillNoTextController;
  String? Function(BuildContext, String?)?
      noDateofvoucherBillNoTextControllerValidator;
  // State field(s) for DetailsOfBillsAmount_no widget.
  FocusNode? detailsOfBillsAmountNoFocusNode;
  TextEditingController? detailsOfBillsAmountNoTextController;
  String? Function(BuildContext, String?)?
      detailsOfBillsAmountNoTextControllerValidator;
  // State field(s) for ProposingOfficerName widget.
  FocusNode? proposingOfficerNameFocusNode;
  TextEditingController? proposingOfficerNameTextController;
  String? Function(BuildContext, String?)?
      proposingOfficerNameTextControllerValidator;
  String? _proposingOfficerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9k8pg2x7' /* Field is required */,
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
        'elko9lz3' /* Field is required */,
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
        '5gd3pnoz' /* Field is required */,
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
        'gh4fevc1' /* Field is required */,
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
        'vrued0sl' /* Field is required */,
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
        'u266ryw5' /* Field is required */,
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
  // Stores action output result for [Backend Call - API ( Create Sanction Order)] action in Button widget.
  ApiCallResponse? apiSanctionOrder;
  // Model for footer component.
  late FooterModel footerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController24;
  String? Function(BuildContext, String?)? textController24Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController25;
  String? Function(BuildContext, String?)? textController25Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController26;
  String? Function(BuildContext, String?)? textController26Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController27;
  String? Function(BuildContext, String?)? textController27Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
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
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsicModel.dispose();
    languageModel.dispose();
    loansearchFocusNode?.dispose();
    loansearchTextController?.dispose();

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

    nameOfpayeeNoFocusNode?.dispose();
    nameOfpayeeNoTextController?.dispose();

    noDateofvoucherBillNoFocusNode?.dispose();
    noDateofvoucherBillNoTextController?.dispose();

    detailsOfBillsAmountNoFocusNode?.dispose();
    detailsOfBillsAmountNoTextController?.dispose();

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

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController24?.dispose();

    textFieldFocusNode2?.dispose();
    textController25?.dispose();

    textFieldFocusNode3?.dispose();
    textController26?.dispose();

    textFieldFocusNode4?.dispose();
    textController27?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
