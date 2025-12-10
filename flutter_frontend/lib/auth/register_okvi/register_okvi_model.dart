import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'register_okvi_widget.dart' show RegisterOkviWidget;
import 'package:flutter/material.dart';

class RegisterOkviModel extends FlutterFlowModel<RegisterOkviWidget> {
  ///  Local state fields for this page.

  List<dynamic> commite = [];
  void addToCommite(dynamic item) => commite.add(item);
  void removeFromCommite(dynamic item) => commite.remove(item);
  void removeAtIndexFromCommite(int index) => commite.removeAt(index);
  void insertAtIndexInCommite(int index, dynamic item) =>
      commite.insert(index, item);
  void updateCommiteAtIndex(int index, Function(dynamic) updateFn) =>
      commite[index] = updateFn(commite[index]);

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for VerifyEmailTextField widget.
  FocusNode? verifyEmailTextFieldFocusNode;
  TextEditingController? verifyEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      verifyEmailTextFieldTextControllerValidator;
  String? _verifyEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i51d64kf' /* ⚠️ Please enter your email add... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Email Verifys)] action in Button widget.
  ApiCallResponse? sendEmailAPi;
  // State field(s) for OTPVerifyEmailTextField widget.
  FocusNode? oTPVerifyEmailTextFieldFocusNode;
  TextEditingController? oTPVerifyEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      oTPVerifyEmailTextFieldTextControllerValidator;
  String? _oTPVerifyEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tkiq8ait' /* ⚠️ Please enter the OTP sent t... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Otp Verify)] action in Button widget.
  ApiCallResponse? otpVerifiedAPI;
  // State field(s) for InstitutionNameTextField widget.
  FocusNode? institutionNameTextFieldFocusNode;
  TextEditingController? institutionNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      institutionNameTextFieldTextControllerValidator;
  // State field(s) for InstitutionEmailTextField widget.
  FocusNode? institutionEmailTextFieldFocusNode;
  TextEditingController? institutionEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      institutionEmailTextFieldTextControllerValidator;
  // State field(s) for InstitutionDistrictDropDown widget.
  String? institutionDistrictDropDownValue;
  FormFieldController<String>? institutionDistrictDropDownValueController;
  // State field(s) for InstitutionAadhaarNoTextField widget.
  FocusNode? institutionAadhaarNoTextFieldFocusNode;
  TextEditingController? institutionAadhaarNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      institutionAadhaarNoTextFieldTextControllerValidator;
  // State field(s) for GMDICRICTypeDropDown widget.
  String? gMDICRICTypeDropDownValue;
  FormFieldController<String>? gMDICRICTypeDropDownValueController;
  // State field(s) for PANNoTextField widget.
  FocusNode? pANNoTextFieldFocusNode;
  TextEditingController? pANNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      pANNoTextFieldTextControllerValidator;
  // State field(s) for GSTRegistrationNoTextField widget.
  FocusNode? gSTRegistrationNoTextFieldFocusNode;
  TextEditingController? gSTRegistrationNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      gSTRegistrationNoTextFieldTextControllerValidator;
  // State field(s) for AddressTextField widget.
  FocusNode? addressTextFieldFocusNode;
  TextEditingController? addressTextFieldTextController;
  String? Function(BuildContext, String?)?
      addressTextFieldTextControllerValidator;
  // State field(s) for RegdWithADMDICTextField widget.
  FocusNode? regdWithADMDICTextFieldFocusNode;
  TextEditingController? regdWithADMDICTextFieldTextController;
  String? Function(BuildContext, String?)?
      regdWithADMDICTextFieldTextControllerValidator;
  // State field(s) for ADMDICRegdNoTextField widget.
  FocusNode? aDMDICRegdNoTextFieldFocusNode;
  TextEditingController? aDMDICRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      aDMDICRegdNoTextFieldTextControllerValidator;
  // State field(s) for DoyouhaveOKVIBRegdNoDropDown widget.
  String? doyouhaveOKVIBRegdNoDropDownValue;
  FormFieldController<String>? doyouhaveOKVIBRegdNoDropDownValueController;
  // State field(s) for OKVIBRegdNoTextField widget.
  FocusNode? oKVIBRegdNoTextFieldFocusNode;
  TextEditingController? oKVIBRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      oKVIBRegdNoTextFieldTextControllerValidator;
  // State field(s) for RegdWithKVICDropDown widget.
  String? regdWithKVICDropDownValue;
  FormFieldController<String>? regdWithKVICDropDownValueController;
  // State field(s) for KVICRegdNoTextField widget.
  FocusNode? kVICRegdNoTextFieldFocusNode;
  TextEditingController? kVICRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      kVICRegdNoTextFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for BankACNoTextField widget.
  FocusNode? bankACNoTextFieldFocusNode;
  TextEditingController? bankACNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      bankACNoTextFieldTextControllerValidator;
  // State field(s) for ACHolderNameTextField widget.
  FocusNode? aCHolderNameTextFieldFocusNode;
  TextEditingController? aCHolderNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      aCHolderNameTextFieldTextControllerValidator;
  // State field(s) for IFSCCodeTextField widget.
  FocusNode? iFSCCodeTextFieldFocusNode;
  TextEditingController? iFSCCodeTextFieldTextController;
  String? Function(BuildContext, String?)?
      iFSCCodeTextFieldTextControllerValidator;
  // State field(s) for NameoftheBankBranchTextField widget.
  FocusNode? nameoftheBankBranchTextFieldFocusNode;
  TextEditingController? nameoftheBankBranchTextFieldTextController;
  String? Function(BuildContext, String?)?
      nameoftheBankBranchTextFieldTextControllerValidator;
  // State field(s) for SecretaryNameTextField widget.
  FocusNode? secretaryNameTextFieldFocusNode;
  TextEditingController? secretaryNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      secretaryNameTextFieldTextControllerValidator;
  // State field(s) for SecretaryNumberTextField widget.
  FocusNode? secretaryNumberTextFieldFocusNode;
  TextEditingController? secretaryNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      secretaryNumberTextFieldTextControllerValidator;
  // State field(s) for SecretaryAddressTextField widget.
  FocusNode? secretaryAddressTextFieldFocusNode;
  TextEditingController? secretaryAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      secretaryAddressTextFieldTextControllerValidator;
  // State field(s) for PresidentNameTextField widget.
  FocusNode? presidentNameTextFieldFocusNode;
  TextEditingController? presidentNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      presidentNameTextFieldTextControllerValidator;
  // State field(s) for PresidentNumberTextField widget.
  FocusNode? presidentNumberTextFieldFocusNode;
  TextEditingController? presidentNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      presidentNumberTextFieldTextControllerValidator;
  // State field(s) for PresidentAddressTextField widget.
  FocusNode? presidentAddressTextFieldFocusNode;
  TextEditingController? presidentAddressTextFieldTextController;
  String? Function(BuildContext, String?)?
      presidentAddressTextFieldTextControllerValidator;
  // State field(s) for CommiteeName widget.
  FocusNode? commiteeNameFocusNode;
  TextEditingController? commiteeNameTextController;
  String? Function(BuildContext, String?)? commiteeNameTextControllerValidator;
  // State field(s) for CommiteeMibileNo widget.
  FocusNode? commiteeMibileNoFocusNode;
  TextEditingController? commiteeMibileNoTextController;
  String? Function(BuildContext, String?)?
      commiteeMibileNoTextControllerValidator;
  // State field(s) for CommiteeAdress widget.
  FocusNode? commiteeAdressFocusNode;
  TextEditingController? commiteeAdressTextController;
  String? Function(BuildContext, String?)?
      commiteeAdressTextControllerValidator;
  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  // State field(s) for Re-PasswordTextField widget.
  FocusNode? rePasswordTextFieldFocusNode;
  TextEditingController? rePasswordTextFieldTextController;
  late bool rePasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordTextFieldTextControllerValidator;
  // Stores action output result for [Validate Form] action in btn_login widget.
  bool? formRegister;
  // Stores action output result for [Backend Call - API (OKVI Register)] action in btn_login widget.
  ApiCallResponse? registerApi;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    verifyEmailTextFieldTextControllerValidator =
        _verifyEmailTextFieldTextControllerValidator;
    oTPVerifyEmailTextFieldTextControllerValidator =
        _oTPVerifyEmailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    rePasswordTextFieldVisibility = false;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    verifyEmailTextFieldFocusNode?.dispose();
    verifyEmailTextFieldTextController?.dispose();

    oTPVerifyEmailTextFieldFocusNode?.dispose();
    oTPVerifyEmailTextFieldTextController?.dispose();

    institutionNameTextFieldFocusNode?.dispose();
    institutionNameTextFieldTextController?.dispose();

    institutionEmailTextFieldFocusNode?.dispose();
    institutionEmailTextFieldTextController?.dispose();

    institutionAadhaarNoTextFieldFocusNode?.dispose();
    institutionAadhaarNoTextFieldTextController?.dispose();

    pANNoTextFieldFocusNode?.dispose();
    pANNoTextFieldTextController?.dispose();

    gSTRegistrationNoTextFieldFocusNode?.dispose();
    gSTRegistrationNoTextFieldTextController?.dispose();

    addressTextFieldFocusNode?.dispose();
    addressTextFieldTextController?.dispose();

    regdWithADMDICTextFieldFocusNode?.dispose();
    regdWithADMDICTextFieldTextController?.dispose();

    aDMDICRegdNoTextFieldFocusNode?.dispose();
    aDMDICRegdNoTextFieldTextController?.dispose();

    oKVIBRegdNoTextFieldFocusNode?.dispose();
    oKVIBRegdNoTextFieldTextController?.dispose();

    kVICRegdNoTextFieldFocusNode?.dispose();
    kVICRegdNoTextFieldTextController?.dispose();

    bankACNoTextFieldFocusNode?.dispose();
    bankACNoTextFieldTextController?.dispose();

    aCHolderNameTextFieldFocusNode?.dispose();
    aCHolderNameTextFieldTextController?.dispose();

    iFSCCodeTextFieldFocusNode?.dispose();
    iFSCCodeTextFieldTextController?.dispose();

    nameoftheBankBranchTextFieldFocusNode?.dispose();
    nameoftheBankBranchTextFieldTextController?.dispose();

    secretaryNameTextFieldFocusNode?.dispose();
    secretaryNameTextFieldTextController?.dispose();

    secretaryNumberTextFieldFocusNode?.dispose();
    secretaryNumberTextFieldTextController?.dispose();

    secretaryAddressTextFieldFocusNode?.dispose();
    secretaryAddressTextFieldTextController?.dispose();

    presidentNameTextFieldFocusNode?.dispose();
    presidentNameTextFieldTextController?.dispose();

    presidentNumberTextFieldFocusNode?.dispose();
    presidentNumberTextFieldTextController?.dispose();

    presidentAddressTextFieldFocusNode?.dispose();
    presidentAddressTextFieldTextController?.dispose();

    commiteeNameFocusNode?.dispose();
    commiteeNameTextController?.dispose();

    commiteeMibileNoFocusNode?.dispose();
    commiteeMibileNoTextController?.dispose();

    commiteeAdressFocusNode?.dispose();
    commiteeAdressTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    rePasswordTextFieldFocusNode?.dispose();
    rePasswordTextFieldTextController?.dispose();

    footerModel.dispose();
  }
}
