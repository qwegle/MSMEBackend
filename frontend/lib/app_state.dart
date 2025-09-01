import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userReff') != null) {
        try {
          _userReff =
              jsonDecode(await secureStorage.getString('ff_userReff') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _branch = await secureStorage.getString('ff_branch') ?? _branch;
    });
    await _safeInitAsync(() async {
      _ShowHide = await secureStorage.getString('ff_ShowHide') ?? _ShowHide;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_OTSForm') != null) {
        try {
          _OTSForm =
              jsonDecode(await secureStorage.getString('ff_OTSForm') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _image = await secureStorage.getString('ff_image') ?? _image;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_otsCount') != null) {
        try {
          _otsCount =
              jsonDecode(await secureStorage.getString('ff_otsCount') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_otsCertificateCount') != null) {
        try {
          _otsCertificateCount = jsonDecode(
              await secureStorage.getString('ff_otsCertificateCount') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_ackFilter') != null) {
        try {
          _ackFilter =
              jsonDecode(await secureStorage.getString('ff_ackFilter') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_CertificateCountBarChart') !=
          null) {
        try {
          _CertificateCountBarChart = jsonDecode(
              await secureStorage.getString('ff_CertificateCountBarChart') ??
                  '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _currentPage =
          await secureStorage.getInt('ff_currentPage') ?? _currentPage;
    });
    await _safeInitAsync(() async {
      _RowPerPage = await secureStorage.getInt('ff_RowPerPage') ?? _RowPerPage;
    });
    await _safeInitAsync(() async {
      _isPreviousEnabled =
          await secureStorage.getBool('ff_isPreviousEnabled') ??
              _isPreviousEnabled;
    });
    await _safeInitAsync(() async {
      _PreCurrentPage =
          await secureStorage.getInt('ff_PreCurrentPage') ?? _PreCurrentPage;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_NDCFilter') != null) {
        try {
          _NDCFilter =
              jsonDecode(await secureStorage.getString('ff_NDCFilter') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_singleuserreff') != null) {
        try {
          _singleuserreff = jsonDecode(
              await secureStorage.getString('ff_singleuserreff') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _MemoReff = (await secureStorage.getStringList('ff_MemoReff'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _MemoReff;
    });
    await _safeInitAsync(() async {
      _SettlementOrderReff =
          (await secureStorage.getStringList('ff_SettlementOrderReff'))
                  ?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _SettlementOrderReff;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_GovtOrder') != null) {
        try {
          _GovtOrder =
              jsonDecode(await secureStorage.getString('ff_GovtOrder') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_floatTender') != null) {
        try {
          _floatTender =
              jsonDecode(await secureStorage.getString('ff_floatTender') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_SupplyOrder') != null) {
        try {
          _SupplyOrder =
              jsonDecode(await secureStorage.getString('ff_SupplyOrder') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_TenderResult') != null) {
        try {
          _TenderResult = jsonDecode(
              await secureStorage.getString('ff_TenderResult') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _OSICDashHideShow =
          await secureStorage.getString('ff_OSICDashHideShow') ??
              _OSICDashHideShow;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_OSICDashboardCount') != null) {
        try {
          _OSICDashboardCount = jsonDecode(
              await secureStorage.getString('ff_OSICDashboardCount') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_test') != null) {
        try {
          _test = jsonDecode(await secureStorage.getString('ff_test') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_memoFilter') != null) {
        try {
          _memoFilter =
              jsonDecode(await secureStorage.getString('ff_memoFilter') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_SettOrderReff') != null) {
        try {
          _SettOrderReff = jsonDecode(
              await secureStorage.getString('ff_SettOrderReff') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _loader = await secureStorage.getBool('ff_loader') ?? _loader;
    });
    await _safeInitAsync(() async {
      _EmailVerifyShowHide =
          await secureStorage.getString('ff_EmailVerifyShowHide') ??
              _EmailVerifyShowHide;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_ExistingLoanReff') != null) {
        try {
          _ExistingLoanReff = jsonDecode(
              await secureStorage.getString('ff_ExistingLoanReff') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _AttimerEnd = await secureStorage.getBool('ff_AttimerEnd') ?? _AttimerEnd;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_TrackStatusOSFC') != null) {
        try {
          _TrackStatusOSFC = jsonDecode(
              await secureStorage.getString('ff_TrackStatusOSFC') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_SanctionOrder') != null) {
        try {
          _SanctionOrder = jsonDecode(
              await secureStorage.getString('ff_SanctionOrder') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_ChoseL1Bidders') != null) {
        try {
          _ChoseL1Bidders = jsonDecode(
              await secureStorage.getString('ff_ChoseL1Bidders') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _TenderBidderDtails =
          (await secureStorage.getStringList('ff_TenderBidderDtails'))
                  ?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _TenderBidderDtails;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    secureStorage.setString('ff_authToken', value);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }

  dynamic _userReff;
  dynamic get userReff => _userReff;
  set userReff(dynamic value) {
    _userReff = value;
    secureStorage.setString('ff_userReff', jsonEncode(value));
  }

  void deleteUserReff() {
    secureStorage.delete(key: 'ff_userReff');
  }

  String _branch = '';
  String get branch => _branch;
  set branch(String value) {
    _branch = value;
    secureStorage.setString('ff_branch', value);
  }

  void deleteBranch() {
    secureStorage.delete(key: 'ff_branch');
  }

  String _ShowHide = '';
  String get ShowHide => _ShowHide;
  set ShowHide(String value) {
    _ShowHide = value;
    secureStorage.setString('ff_ShowHide', value);
  }

  void deleteShowHide() {
    secureStorage.delete(key: 'ff_ShowHide');
  }

  dynamic _OTSForm;
  dynamic get OTSForm => _OTSForm;
  set OTSForm(dynamic value) {
    _OTSForm = value;
    secureStorage.setString('ff_OTSForm', jsonEncode(value));
  }

  void deleteOTSForm() {
    secureStorage.delete(key: 'ff_OTSForm');
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
    secureStorage.setString('ff_image', value);
  }

  void deleteImage() {
    secureStorage.delete(key: 'ff_image');
  }

  dynamic _otsCount;
  dynamic get otsCount => _otsCount;
  set otsCount(dynamic value) {
    _otsCount = value;
    secureStorage.setString('ff_otsCount', jsonEncode(value));
  }

  void deleteOtsCount() {
    secureStorage.delete(key: 'ff_otsCount');
  }

  dynamic _otsCertificateCount;
  dynamic get otsCertificateCount => _otsCertificateCount;
  set otsCertificateCount(dynamic value) {
    _otsCertificateCount = value;
    secureStorage.setString('ff_otsCertificateCount', jsonEncode(value));
  }

  void deleteOtsCertificateCount() {
    secureStorage.delete(key: 'ff_otsCertificateCount');
  }

  dynamic _ackFilter;
  dynamic get ackFilter => _ackFilter;
  set ackFilter(dynamic value) {
    _ackFilter = value;
    secureStorage.setString('ff_ackFilter', jsonEncode(value));
  }

  void deleteAckFilter() {
    secureStorage.delete(key: 'ff_ackFilter');
  }

  dynamic _CertificateCountBarChart;
  dynamic get CertificateCountBarChart => _CertificateCountBarChart;
  set CertificateCountBarChart(dynamic value) {
    _CertificateCountBarChart = value;
    secureStorage.setString('ff_CertificateCountBarChart', jsonEncode(value));
  }

  void deleteCertificateCountBarChart() {
    secureStorage.delete(key: 'ff_CertificateCountBarChart');
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    secureStorage.setInt('ff_currentPage', value);
  }

  void deleteCurrentPage() {
    secureStorage.delete(key: 'ff_currentPage');
  }

  int _RowPerPage = 0;
  int get RowPerPage => _RowPerPage;
  set RowPerPage(int value) {
    _RowPerPage = value;
    secureStorage.setInt('ff_RowPerPage', value);
  }

  void deleteRowPerPage() {
    secureStorage.delete(key: 'ff_RowPerPage');
  }

  bool _isPreviousEnabled = false;
  bool get isPreviousEnabled => _isPreviousEnabled;
  set isPreviousEnabled(bool value) {
    _isPreviousEnabled = value;
    secureStorage.setBool('ff_isPreviousEnabled', value);
  }

  void deleteIsPreviousEnabled() {
    secureStorage.delete(key: 'ff_isPreviousEnabled');
  }

  int _PreCurrentPage = 0;
  int get PreCurrentPage => _PreCurrentPage;
  set PreCurrentPage(int value) {
    _PreCurrentPage = value;
    secureStorage.setInt('ff_PreCurrentPage', value);
  }

  void deletePreCurrentPage() {
    secureStorage.delete(key: 'ff_PreCurrentPage');
  }

  dynamic _NDCFilter;
  dynamic get NDCFilter => _NDCFilter;
  set NDCFilter(dynamic value) {
    _NDCFilter = value;
    secureStorage.setString('ff_NDCFilter', jsonEncode(value));
  }

  void deleteNDCFilter() {
    secureStorage.delete(key: 'ff_NDCFilter');
  }

  dynamic _singleuserreff;
  dynamic get singleuserreff => _singleuserreff;
  set singleuserreff(dynamic value) {
    _singleuserreff = value;
    secureStorage.setString('ff_singleuserreff', jsonEncode(value));
  }

  void deleteSingleuserreff() {
    secureStorage.delete(key: 'ff_singleuserreff');
  }

  List<dynamic> _MemoReff = [];
  List<dynamic> get MemoReff => _MemoReff;
  set MemoReff(List<dynamic> value) {
    _MemoReff = value;
    secureStorage.setStringList(
        'ff_MemoReff', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteMemoReff() {
    secureStorage.delete(key: 'ff_MemoReff');
  }

  void addToMemoReff(dynamic value) {
    MemoReff.add(value);
    secureStorage.setStringList(
        'ff_MemoReff', _MemoReff.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMemoReff(dynamic value) {
    MemoReff.remove(value);
    secureStorage.setStringList(
        'ff_MemoReff', _MemoReff.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMemoReff(int index) {
    MemoReff.removeAt(index);
    secureStorage.setStringList(
        'ff_MemoReff', _MemoReff.map((x) => jsonEncode(x)).toList());
  }

  void updateMemoReffAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    MemoReff[index] = updateFn(_MemoReff[index]);
    secureStorage.setStringList(
        'ff_MemoReff', _MemoReff.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMemoReff(int index, dynamic value) {
    MemoReff.insert(index, value);
    secureStorage.setStringList(
        'ff_MemoReff', _MemoReff.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _SettlementOrderReff = [];
  List<dynamic> get SettlementOrderReff => _SettlementOrderReff;
  set SettlementOrderReff(List<dynamic> value) {
    _SettlementOrderReff = value;
    secureStorage.setStringList(
        'ff_SettlementOrderReff', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteSettlementOrderReff() {
    secureStorage.delete(key: 'ff_SettlementOrderReff');
  }

  void addToSettlementOrderReff(dynamic value) {
    SettlementOrderReff.add(value);
    secureStorage.setStringList('ff_SettlementOrderReff',
        _SettlementOrderReff.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSettlementOrderReff(dynamic value) {
    SettlementOrderReff.remove(value);
    secureStorage.setStringList('ff_SettlementOrderReff',
        _SettlementOrderReff.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSettlementOrderReff(int index) {
    SettlementOrderReff.removeAt(index);
    secureStorage.setStringList('ff_SettlementOrderReff',
        _SettlementOrderReff.map((x) => jsonEncode(x)).toList());
  }

  void updateSettlementOrderReffAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    SettlementOrderReff[index] = updateFn(_SettlementOrderReff[index]);
    secureStorage.setStringList('ff_SettlementOrderReff',
        _SettlementOrderReff.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSettlementOrderReff(int index, dynamic value) {
    SettlementOrderReff.insert(index, value);
    secureStorage.setStringList('ff_SettlementOrderReff',
        _SettlementOrderReff.map((x) => jsonEncode(x)).toList());
  }

  dynamic _GovtOrder;
  dynamic get GovtOrder => _GovtOrder;
  set GovtOrder(dynamic value) {
    _GovtOrder = value;
    secureStorage.setString('ff_GovtOrder', jsonEncode(value));
  }

  void deleteGovtOrder() {
    secureStorage.delete(key: 'ff_GovtOrder');
  }

  dynamic _floatTender;
  dynamic get floatTender => _floatTender;
  set floatTender(dynamic value) {
    _floatTender = value;
    secureStorage.setString('ff_floatTender', jsonEncode(value));
  }

  void deleteFloatTender() {
    secureStorage.delete(key: 'ff_floatTender');
  }

  dynamic _SupplyOrder;
  dynamic get SupplyOrder => _SupplyOrder;
  set SupplyOrder(dynamic value) {
    _SupplyOrder = value;
    secureStorage.setString('ff_SupplyOrder', jsonEncode(value));
  }

  void deleteSupplyOrder() {
    secureStorage.delete(key: 'ff_SupplyOrder');
  }

  dynamic _TenderResult;
  dynamic get TenderResult => _TenderResult;
  set TenderResult(dynamic value) {
    _TenderResult = value;
    secureStorage.setString('ff_TenderResult', jsonEncode(value));
  }

  void deleteTenderResult() {
    secureStorage.delete(key: 'ff_TenderResult');
  }

  String _OSICDashHideShow = '';
  String get OSICDashHideShow => _OSICDashHideShow;
  set OSICDashHideShow(String value) {
    _OSICDashHideShow = value;
    secureStorage.setString('ff_OSICDashHideShow', value);
  }

  void deleteOSICDashHideShow() {
    secureStorage.delete(key: 'ff_OSICDashHideShow');
  }

  dynamic _OSICDashboardCount;
  dynamic get OSICDashboardCount => _OSICDashboardCount;
  set OSICDashboardCount(dynamic value) {
    _OSICDashboardCount = value;
    secureStorage.setString('ff_OSICDashboardCount', jsonEncode(value));
  }

  void deleteOSICDashboardCount() {
    secureStorage.delete(key: 'ff_OSICDashboardCount');
  }

  dynamic _test;
  dynamic get test => _test;
  set test(dynamic value) {
    _test = value;
    secureStorage.setString('ff_test', jsonEncode(value));
  }

  void deleteTest() {
    secureStorage.delete(key: 'ff_test');
  }

  dynamic _memoFilter;
  dynamic get memoFilter => _memoFilter;
  set memoFilter(dynamic value) {
    _memoFilter = value;
    secureStorage.setString('ff_memoFilter', jsonEncode(value));
  }

  void deleteMemoFilter() {
    secureStorage.delete(key: 'ff_memoFilter');
  }

  dynamic _SettOrderReff;
  dynamic get SettOrderReff => _SettOrderReff;
  set SettOrderReff(dynamic value) {
    _SettOrderReff = value;
    secureStorage.setString('ff_SettOrderReff', jsonEncode(value));
  }

  void deleteSettOrderReff() {
    secureStorage.delete(key: 'ff_SettOrderReff');
  }

  bool _loader = false;
  bool get loader => _loader;
  set loader(bool value) {
    _loader = value;
    secureStorage.setBool('ff_loader', value);
  }

  void deleteLoader() {
    secureStorage.delete(key: 'ff_loader');
  }

  String _EmailVerifyShowHide = '';
  String get EmailVerifyShowHide => _EmailVerifyShowHide;
  set EmailVerifyShowHide(String value) {
    _EmailVerifyShowHide = value;
    secureStorage.setString('ff_EmailVerifyShowHide', value);
  }

  void deleteEmailVerifyShowHide() {
    secureStorage.delete(key: 'ff_EmailVerifyShowHide');
  }

  dynamic _ExistingLoanReff;
  dynamic get ExistingLoanReff => _ExistingLoanReff;
  set ExistingLoanReff(dynamic value) {
    _ExistingLoanReff = value;
    secureStorage.setString('ff_ExistingLoanReff', jsonEncode(value));
  }

  void deleteExistingLoanReff() {
    secureStorage.delete(key: 'ff_ExistingLoanReff');
  }

  String _resetPassHideShow = '';
  String get resetPassHideShow => _resetPassHideShow;
  set resetPassHideShow(String value) {
    _resetPassHideShow = value;
  }

  bool _AttimerEnd = false;
  bool get AttimerEnd => _AttimerEnd;
  set AttimerEnd(bool value) {
    _AttimerEnd = value;
    secureStorage.setBool('ff_AttimerEnd', value);
  }

  void deleteAttimerEnd() {
    secureStorage.delete(key: 'ff_AttimerEnd');
  }

  dynamic _TrackStatusOSFC;
  dynamic get TrackStatusOSFC => _TrackStatusOSFC;
  set TrackStatusOSFC(dynamic value) {
    _TrackStatusOSFC = value;
    secureStorage.setString('ff_TrackStatusOSFC', jsonEncode(value));
  }

  void deleteTrackStatusOSFC() {
    secureStorage.delete(key: 'ff_TrackStatusOSFC');
  }

  String _appCheckToken = '';
  String get appCheckToken => _appCheckToken;
  set appCheckToken(String value) {
    _appCheckToken = value;
  }

  dynamic _SanctionOrder;
  dynamic get SanctionOrder => _SanctionOrder;
  set SanctionOrder(dynamic value) {
    _SanctionOrder = value;
    secureStorage.setString('ff_SanctionOrder', jsonEncode(value));
  }

  void deleteSanctionOrder() {
    secureStorage.delete(key: 'ff_SanctionOrder');
  }

  dynamic _ChoseL1Bidders;
  dynamic get ChoseL1Bidders => _ChoseL1Bidders;
  set ChoseL1Bidders(dynamic value) {
    _ChoseL1Bidders = value;
    secureStorage.setString('ff_ChoseL1Bidders', jsonEncode(value));
  }

  void deleteChoseL1Bidders() {
    secureStorage.delete(key: 'ff_ChoseL1Bidders');
  }

  List<dynamic> _TenderBidderDtails = [];
  List<dynamic> get TenderBidderDtails => _TenderBidderDtails;
  set TenderBidderDtails(List<dynamic> value) {
    _TenderBidderDtails = value;
    secureStorage.setStringList(
        'ff_TenderBidderDtails', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTenderBidderDtails() {
    secureStorage.delete(key: 'ff_TenderBidderDtails');
  }

  void addToTenderBidderDtails(dynamic value) {
    TenderBidderDtails.add(value);
    secureStorage.setStringList('ff_TenderBidderDtails',
        _TenderBidderDtails.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTenderBidderDtails(dynamic value) {
    TenderBidderDtails.remove(value);
    secureStorage.setStringList('ff_TenderBidderDtails',
        _TenderBidderDtails.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTenderBidderDtails(int index) {
    TenderBidderDtails.removeAt(index);
    secureStorage.setStringList('ff_TenderBidderDtails',
        _TenderBidderDtails.map((x) => jsonEncode(x)).toList());
  }

  void updateTenderBidderDtailsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    TenderBidderDtails[index] = updateFn(_TenderBidderDtails[index]);
    secureStorage.setStringList('ff_TenderBidderDtails',
        _TenderBidderDtails.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTenderBidderDtails(int index, dynamic value) {
    TenderBidderDtails.insert(index, value);
    secureStorage.setStringList('ff_TenderBidderDtails',
        _TenderBidderDtails.map((x) => jsonEncode(x)).toList());
  }

  String _captchaToken = '';
  String get captchaToken => _captchaToken;
  set captchaToken(String value) {
    _captchaToken = value;
  }

  String _CaptchaNumber = '';
  String get CaptchaNumber => _CaptchaNumber;
  set CaptchaNumber(String value) {
    _CaptchaNumber = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
