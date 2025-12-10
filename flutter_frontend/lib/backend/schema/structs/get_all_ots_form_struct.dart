// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetAllOtsFormStruct extends BaseStruct {
  GetAllOtsFormStruct({
    List<String>? fName,
    List<String>? lName,
    List<String>? number,
    List<String>? email,
    List<String>? streetaddress,
    List<String>? state,
    List<String>? city,
    List<String>? branch,
    List<String>? pincode,
    List<String>? liabilityOFSC,
    List<String>? industry,
    List<String>? createdAt,
    List<String>? updatedAt,
    List<String>? loanNumber,
    List<bool>? checkbox1,
    List<bool>? checkbox2,
    List<bool>? checkbox3,
    List<bool>? checkbox4,
    List<String>? statusmsg,
  })  : _fName = fName,
        _lName = lName,
        _number = number,
        _email = email,
        _streetaddress = streetaddress,
        _state = state,
        _city = city,
        _branch = branch,
        _pincode = pincode,
        _liabilityOFSC = liabilityOFSC,
        _industry = industry,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _loanNumber = loanNumber,
        _checkbox1 = checkbox1,
        _checkbox2 = checkbox2,
        _checkbox3 = checkbox3,
        _checkbox4 = checkbox4,
        _statusmsg = statusmsg;

  // "f_name" field.
  List<String>? _fName;
  List<String> get fName => _fName ?? const [];
  set fName(List<String>? val) => _fName = val;

  void updateFName(Function(List<String>) updateFn) {
    updateFn(_fName ??= []);
  }

  bool hasFName() => _fName != null;

  // "l_name" field.
  List<String>? _lName;
  List<String> get lName => _lName ?? const [];
  set lName(List<String>? val) => _lName = val;

  void updateLName(Function(List<String>) updateFn) {
    updateFn(_lName ??= []);
  }

  bool hasLName() => _lName != null;

  // "Number" field.
  List<String>? _number;
  List<String> get number => _number ?? const [];
  set number(List<String>? val) => _number = val;

  void updateNumber(Function(List<String>) updateFn) {
    updateFn(_number ??= []);
  }

  bool hasNumber() => _number != null;

  // "email" field.
  List<String>? _email;
  List<String> get email => _email ?? const [];
  set email(List<String>? val) => _email = val;

  void updateEmail(Function(List<String>) updateFn) {
    updateFn(_email ??= []);
  }

  bool hasEmail() => _email != null;

  // "streetaddress" field.
  List<String>? _streetaddress;
  List<String> get streetaddress => _streetaddress ?? const [];
  set streetaddress(List<String>? val) => _streetaddress = val;

  void updateStreetaddress(Function(List<String>) updateFn) {
    updateFn(_streetaddress ??= []);
  }

  bool hasStreetaddress() => _streetaddress != null;

  // "state" field.
  List<String>? _state;
  List<String> get state => _state ?? const [];
  set state(List<String>? val) => _state = val;

  void updateState(Function(List<String>) updateFn) {
    updateFn(_state ??= []);
  }

  bool hasState() => _state != null;

  // "city" field.
  List<String>? _city;
  List<String> get city => _city ?? const [];
  set city(List<String>? val) => _city = val;

  void updateCity(Function(List<String>) updateFn) {
    updateFn(_city ??= []);
  }

  bool hasCity() => _city != null;

  // "branch" field.
  List<String>? _branch;
  List<String> get branch => _branch ?? const [];
  set branch(List<String>? val) => _branch = val;

  void updateBranch(Function(List<String>) updateFn) {
    updateFn(_branch ??= []);
  }

  bool hasBranch() => _branch != null;

  // "pincode" field.
  List<String>? _pincode;
  List<String> get pincode => _pincode ?? const [];
  set pincode(List<String>? val) => _pincode = val;

  void updatePincode(Function(List<String>) updateFn) {
    updateFn(_pincode ??= []);
  }

  bool hasPincode() => _pincode != null;

  // "LiabilityOFSC" field.
  List<String>? _liabilityOFSC;
  List<String> get liabilityOFSC => _liabilityOFSC ?? const [];
  set liabilityOFSC(List<String>? val) => _liabilityOFSC = val;

  void updateLiabilityOFSC(Function(List<String>) updateFn) {
    updateFn(_liabilityOFSC ??= []);
  }

  bool hasLiabilityOFSC() => _liabilityOFSC != null;

  // "industry" field.
  List<String>? _industry;
  List<String> get industry => _industry ?? const [];
  set industry(List<String>? val) => _industry = val;

  void updateIndustry(Function(List<String>) updateFn) {
    updateFn(_industry ??= []);
  }

  bool hasIndustry() => _industry != null;

  // "createdAt" field.
  List<String>? _createdAt;
  List<String> get createdAt => _createdAt ?? const [];
  set createdAt(List<String>? val) => _createdAt = val;

  void updateCreatedAt(Function(List<String>) updateFn) {
    updateFn(_createdAt ??= []);
  }

  bool hasCreatedAt() => _createdAt != null;

  // "UpdatedAt" field.
  List<String>? _updatedAt;
  List<String> get updatedAt => _updatedAt ?? const [];
  set updatedAt(List<String>? val) => _updatedAt = val;

  void updateUpdatedAt(Function(List<String>) updateFn) {
    updateFn(_updatedAt ??= []);
  }

  bool hasUpdatedAt() => _updatedAt != null;

  // "loanNumber" field.
  List<String>? _loanNumber;
  List<String> get loanNumber => _loanNumber ?? const [];
  set loanNumber(List<String>? val) => _loanNumber = val;

  void updateLoanNumber(Function(List<String>) updateFn) {
    updateFn(_loanNumber ??= []);
  }

  bool hasLoanNumber() => _loanNumber != null;

  // "checkbox1" field.
  List<bool>? _checkbox1;
  List<bool> get checkbox1 => _checkbox1 ?? const [];
  set checkbox1(List<bool>? val) => _checkbox1 = val;

  void updateCheckbox1(Function(List<bool>) updateFn) {
    updateFn(_checkbox1 ??= []);
  }

  bool hasCheckbox1() => _checkbox1 != null;

  // "checkbox2" field.
  List<bool>? _checkbox2;
  List<bool> get checkbox2 => _checkbox2 ?? const [];
  set checkbox2(List<bool>? val) => _checkbox2 = val;

  void updateCheckbox2(Function(List<bool>) updateFn) {
    updateFn(_checkbox2 ??= []);
  }

  bool hasCheckbox2() => _checkbox2 != null;

  // "checkbox3" field.
  List<bool>? _checkbox3;
  List<bool> get checkbox3 => _checkbox3 ?? const [];
  set checkbox3(List<bool>? val) => _checkbox3 = val;

  void updateCheckbox3(Function(List<bool>) updateFn) {
    updateFn(_checkbox3 ??= []);
  }

  bool hasCheckbox3() => _checkbox3 != null;

  // "checkbox4" field.
  List<bool>? _checkbox4;
  List<bool> get checkbox4 => _checkbox4 ?? const [];
  set checkbox4(List<bool>? val) => _checkbox4 = val;

  void updateCheckbox4(Function(List<bool>) updateFn) {
    updateFn(_checkbox4 ??= []);
  }

  bool hasCheckbox4() => _checkbox4 != null;

  // "statusmsg" field.
  List<String>? _statusmsg;
  List<String> get statusmsg => _statusmsg ?? const [];
  set statusmsg(List<String>? val) => _statusmsg = val;

  void updateStatusmsg(Function(List<String>) updateFn) {
    updateFn(_statusmsg ??= []);
  }

  bool hasStatusmsg() => _statusmsg != null;

  static GetAllOtsFormStruct fromMap(Map<String, dynamic> data) =>
      GetAllOtsFormStruct(
        fName: getDataList(data['f_name']),
        lName: getDataList(data['l_name']),
        number: getDataList(data['Number']),
        email: getDataList(data['email']),
        streetaddress: getDataList(data['streetaddress']),
        state: getDataList(data['state']),
        city: getDataList(data['city']),
        branch: getDataList(data['branch']),
        pincode: getDataList(data['pincode']),
        liabilityOFSC: getDataList(data['LiabilityOFSC']),
        industry: getDataList(data['industry']),
        createdAt: getDataList(data['createdAt']),
        updatedAt: getDataList(data['UpdatedAt']),
        loanNumber: getDataList(data['loanNumber']),
        checkbox1: getDataList(data['checkbox1']),
        checkbox2: getDataList(data['checkbox2']),
        checkbox3: getDataList(data['checkbox3']),
        checkbox4: getDataList(data['checkbox4']),
        statusmsg: getDataList(data['statusmsg']),
      );

  static GetAllOtsFormStruct? maybeFromMap(dynamic data) => data is Map
      ? GetAllOtsFormStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'f_name': _fName,
        'l_name': _lName,
        'Number': _number,
        'email': _email,
        'streetaddress': _streetaddress,
        'state': _state,
        'city': _city,
        'branch': _branch,
        'pincode': _pincode,
        'LiabilityOFSC': _liabilityOFSC,
        'industry': _industry,
        'createdAt': _createdAt,
        'UpdatedAt': _updatedAt,
        'loanNumber': _loanNumber,
        'checkbox1': _checkbox1,
        'checkbox2': _checkbox2,
        'checkbox3': _checkbox3,
        'checkbox4': _checkbox4,
        'statusmsg': _statusmsg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'f_name': serializeParam(
          _fName,
          ParamType.String,
          isList: true,
        ),
        'l_name': serializeParam(
          _lName,
          ParamType.String,
          isList: true,
        ),
        'Number': serializeParam(
          _number,
          ParamType.String,
          isList: true,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
          isList: true,
        ),
        'streetaddress': serializeParam(
          _streetaddress,
          ParamType.String,
          isList: true,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
          isList: true,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
          isList: true,
        ),
        'branch': serializeParam(
          _branch,
          ParamType.String,
          isList: true,
        ),
        'pincode': serializeParam(
          _pincode,
          ParamType.String,
          isList: true,
        ),
        'LiabilityOFSC': serializeParam(
          _liabilityOFSC,
          ParamType.String,
          isList: true,
        ),
        'industry': serializeParam(
          _industry,
          ParamType.String,
          isList: true,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
          isList: true,
        ),
        'UpdatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
          isList: true,
        ),
        'loanNumber': serializeParam(
          _loanNumber,
          ParamType.String,
          isList: true,
        ),
        'checkbox1': serializeParam(
          _checkbox1,
          ParamType.bool,
          isList: true,
        ),
        'checkbox2': serializeParam(
          _checkbox2,
          ParamType.bool,
          isList: true,
        ),
        'checkbox3': serializeParam(
          _checkbox3,
          ParamType.bool,
          isList: true,
        ),
        'checkbox4': serializeParam(
          _checkbox4,
          ParamType.bool,
          isList: true,
        ),
        'statusmsg': serializeParam(
          _statusmsg,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static GetAllOtsFormStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetAllOtsFormStruct(
        fName: deserializeParam<String>(
          data['f_name'],
          ParamType.String,
          true,
        ),
        lName: deserializeParam<String>(
          data['l_name'],
          ParamType.String,
          true,
        ),
        number: deserializeParam<String>(
          data['Number'],
          ParamType.String,
          true,
        ),
        email: deserializeParam<String>(
          data['email'],
          ParamType.String,
          true,
        ),
        streetaddress: deserializeParam<String>(
          data['streetaddress'],
          ParamType.String,
          true,
        ),
        state: deserializeParam<String>(
          data['state'],
          ParamType.String,
          true,
        ),
        city: deserializeParam<String>(
          data['city'],
          ParamType.String,
          true,
        ),
        branch: deserializeParam<String>(
          data['branch'],
          ParamType.String,
          true,
        ),
        pincode: deserializeParam<String>(
          data['pincode'],
          ParamType.String,
          true,
        ),
        liabilityOFSC: deserializeParam<String>(
          data['LiabilityOFSC'],
          ParamType.String,
          true,
        ),
        industry: deserializeParam<String>(
          data['industry'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam<String>(
          data['createdAt'],
          ParamType.String,
          true,
        ),
        updatedAt: deserializeParam<String>(
          data['UpdatedAt'],
          ParamType.String,
          true,
        ),
        loanNumber: deserializeParam<String>(
          data['loanNumber'],
          ParamType.String,
          true,
        ),
        checkbox1: deserializeParam<bool>(
          data['checkbox1'],
          ParamType.bool,
          true,
        ),
        checkbox2: deserializeParam<bool>(
          data['checkbox2'],
          ParamType.bool,
          true,
        ),
        checkbox3: deserializeParam<bool>(
          data['checkbox3'],
          ParamType.bool,
          true,
        ),
        checkbox4: deserializeParam<bool>(
          data['checkbox4'],
          ParamType.bool,
          true,
        ),
        statusmsg: deserializeParam<String>(
          data['statusmsg'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'GetAllOtsFormStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GetAllOtsFormStruct &&
        listEquality.equals(fName, other.fName) &&
        listEquality.equals(lName, other.lName) &&
        listEquality.equals(number, other.number) &&
        listEquality.equals(email, other.email) &&
        listEquality.equals(streetaddress, other.streetaddress) &&
        listEquality.equals(state, other.state) &&
        listEquality.equals(city, other.city) &&
        listEquality.equals(branch, other.branch) &&
        listEquality.equals(pincode, other.pincode) &&
        listEquality.equals(liabilityOFSC, other.liabilityOFSC) &&
        listEquality.equals(industry, other.industry) &&
        listEquality.equals(createdAt, other.createdAt) &&
        listEquality.equals(updatedAt, other.updatedAt) &&
        listEquality.equals(loanNumber, other.loanNumber) &&
        listEquality.equals(checkbox1, other.checkbox1) &&
        listEquality.equals(checkbox2, other.checkbox2) &&
        listEquality.equals(checkbox3, other.checkbox3) &&
        listEquality.equals(checkbox4, other.checkbox4) &&
        listEquality.equals(statusmsg, other.statusmsg);
  }

  @override
  int get hashCode => const ListEquality().hash([
        fName,
        lName,
        number,
        email,
        streetaddress,
        state,
        city,
        branch,
        pincode,
        liabilityOFSC,
        industry,
        createdAt,
        updatedAt,
        loanNumber,
        checkbox1,
        checkbox2,
        checkbox3,
        checkbox4,
        statusmsg
      ]);
}

GetAllOtsFormStruct createGetAllOtsFormStruct() => GetAllOtsFormStruct();
