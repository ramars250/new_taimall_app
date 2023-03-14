// // ignore_for_file: constant_identifier_names

// class Api {
//   static const String AppToken = 'A608DDD5-8DFF-490B-93B5-348F11C688F5';
//
//   static const String MemberGuid = 'A608DDD5-8DFF-490B-93B5-348F11C688F5';
//   //根路徑
//   static const String BASE_URL = 'https://www2.taimall.com.tw:8443/api';
//
//   //停車資訊
//   static const String PARKING_Info = '$BASE_URL/Parkings';
//
//   //店家資訊
//   static const String Tenants = '$BASE_URL/Tenants/';
//
//   //美食店家資訊
//   static const String Tenants2 = '$BASE_URL/Tenants/2';
//
//   //使用手機取得會員代碼
//   static const String Tests = '$BASE_URL/Tests/0900009999';
//
//   //新增裝置註冊資訊(POST)
//   static const String Devices = '$BASE_URL/Devices';
//
//   //修改裝置註冊資訊(PUT)
//   static const String Devices_revise = '$BASE_URL/Devices';
//
//   //新增裝置事件紀錄(POST)
//   static const String Devices_add = '$BASE_URL/Devices';
//
//   //登入會員(需要有AppToken，PUT)
//   static const String Devices_login = '$BASE_URL/Devices/$AppToken/login';
//
//   //登出會員(需要有AppToken，PUT)
//   static const String Devices_logout = '$BASE_URL/Devices/$AppToken/logout';
//
//   //通知券類到期(需有MemberGuid)
//   static const String Members_expiringcoupon =
//       '$BASE_URL/Members/$MemberGuid/expiringcoupon';
//
//   //通知點數到期(需有MemberGuid)
//   static const String Members_notifypoint =
//       '$BASE_URL/Members/$MemberGuid/NotifyPoints';
//
//   //重要訊息清單(需有MemberGuid)
//   static const String Members_expiringpoints =
//       '$BASE_URL/Members/$MemberGuid/expiringpoints';
//
//   //VIP門檻提醒通知(需有MemberGuid)
//   static const String Members_VIPAlert =
//       '$BASE_URL/Members/$MemberGuid/VIPAlert';
//
//   //忘記(變更)密碼時驗證會員身分(PUT)
//   static const String Members_verify = '$BASE_URL/Members/verify';
//
//   //忘記(變更)密碼時輸入新密碼(需有MemberGuid，PUT)
//   static const String Members_smscomplete =
//       '$BASE_URL/Members/$MemberGuid/smscomplete';
//
//   //申請新會員取得簡訊認證碼(POST)
//   static const String Members_newsms = '$BASE_URL/Members/newsms';
//
//   //檢查身分證是否已申請(需有身分證號)
//   static const String Members_id = '$BASE_URL/Members/identityID/id';
//
//   //檢查手機號碼是否已申請(需有手機號碼)
//   static const String Members_phone = '$BASE_URL/Members/cellPhone/phone';
//
//   //新增會員(POST)
//   static const String Members = '$BASE_URL/Members';
//
//   //取得會員資料(需有MemberGuid)
//   static const String Members_info = '$BASE_URL/Members/$MemberGuid';
//
//   //修改會員資料(需有MemberGuid，PUT)
//   static const String Member_revise = '$BASE_URL/Members/$MemberGuid';
//
//   //取得會員車牌資料(需有MemberGuid)
//   static const String Members_plate = '$BASE_URL/Members/$MemberGuid/plate';
//
//   //會員車牌綁定(需有MemberGuid，PUT)
//   static const String Members_plate2 = '$BASE_URL/Members/$MemberGuid/plate';
//
//   //會員載具綁定(需有MemberGuid，PUT)
//   static const String Members_carrierID =
//       '$BASE_URL/Members/$MemberGuid/CarrierID';
//
//   //取得會員點數及身分標記(需有MemberGuid)
//   static const String Members_summary = '$BASE_URL/Members/$MemberGuid/summary';
//
//   //取得會員商品券(需有MemberGuid)
//   static const String Members_coupons = '$BASE_URL/Members/$MemberGuid/coupons';
//
//   //取得會員交易明細(需有MemberGuid)
//   static const String Members_detail = '$BASE_URL/Members/$MemberGuid/detail';
//
//   //取得會員交易明細發票內容(需有MemberGuid)
//   static const String Members_invoicedata =
//       '$BASE_URL/Members/$MemberGuid/invoicedata';
//
//   //發票補登(需有MemberGuid，POST)
//   static const String Members_invoice = '$BASE_URL/Members/$MemberGuid/invoice';
//
//   //取得點數兌換贈品清單(需有MemberGuid)
//   static const String Members_gifts = '$BASE_URL/Members/$MemberGuid/gifts';
//
//   //點數贈品兌換(多品項一次兌換，需有MemberGuid，POST)
//   static const String Members_redeem = '$BASE_URL/Members/$MemberGuid/redeem';
//
//   //點數贈品兌換(單品項兌換多個，需有MemberGuid，POST)
//   static const String Members_redeem2 = '$BASE_URL/Members/$MemberGuid/redeem2';
//
//   //取得好禮兌換清單(需有MemberGuid)
//   static const String Members_redeemlist =
//       '$BASE_URL/Members/$MemberGuid/redeemlist';
//
//   //好禮贈品兌換取消(需有MemberGuid，POST)
//   static const String Members_redeemcancel =
//       '$BASE_URL/Members/$MemberGuid/RedeemCancel';
//
//   //取得線上購物推薦商品(需有MemberGuid)
//   static const String Members_favorite = '$BASE_URL/Members/$MemberGuid/favorite';
//
//   //取得活動列表(需有MemberGuid)
//   static const String Sps_list = '$BASE_URL/Sps/$MemberGuid/splist';
//
//   //取得卡友禮資料(需有MemberGuid)
//   static const String Sps_card = '$BASE_URL/Sps/$MemberGuid/spcard';
//
//   //兌換卡友禮(需有MemberGuid，POST)
//   static const String Sps_exchangecard = '$BASE_URL/Sps/$MemberGuid/spcard';
//
//   //取得全館滿額(需有MemberGuid)
//   static const String Sps_coupon = '$BASE_URL/Sps/$MemberGuid/spcoupon';
//
//   //兌換全館(需有MemberGuid，POST)
//   static const String Sps_exchamgeall = '$BASE_URL/Sps/$MemberGuid/spcoupon';
//
//   //取得銀行禮(需有MemberGuid)
//   static const String Sps_bank = '$BASE_URL/Sps/$MemberGuid/spbank';
//
//   //兌換銀行禮(需有MemberGuid，POST)
//   static const String Sps_exchangebank = '$BASE_URL/Sps/$MemberGuid/spbank';
//
//   //取得專區(需有MemberGuid)
//   static const String Sps_area = '$BASE_URL/Sps/$MemberGuid/sparea';
//
//   //取消專區(需有MemberGuid，POST)
//   static const String Sps_cancelarea = '$BASE_URL/Sps/$MemberGuid/sparea';
//
//   //銀行禮兌畢確認
//   static const String Sps_bankexchange = '$BASE_URL/Sps/bankexchange';
//
//   //卡友禮兌畢確認
//   static const String Sps_cardexchange = '$BASE_URL/Sps/cardexchange';
// }

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class Api {

  set getMemGuid(String guid) {
    memberGuid = guid;
  }

  static String memberGuid = '';

  static const String AppToken = 'A608DDD5-8DFF-490B-93B5-348F11C688F5';

  //根路徑
  static const String BASE_URL = 'https://www2.taimall.com.tw:8443/api';

  //停車資訊
  static const String PARKING_Info = '$BASE_URL/Parkings';

  //店家資訊
  static const String Tenants = '$BASE_URL/Tenants/';

  //美食店家資訊
  static const String Tenants2 = '$BASE_URL/Tenants/2';

  //使用手機取得會員代碼
  static const String Tests = '$BASE_URL/Tests/0900009999';

  //新增裝置註冊資訊(POST)
  static const String Devices = '$BASE_URL/Devices';

  //修改裝置註冊資訊(PUT)
  static const String Devices_revise = '$BASE_URL/Devices';

  //新增裝置事件紀錄(POST)
  static const String Devices_add = '$BASE_URL/Devices';

  //登入會員(需要有AppToken，PUT)
  static const String Devices_login = '$BASE_URL/Devices/$AppToken/login';

  //登出會員(需要有AppToken，PUT)
  static const String Devices_logout = '$BASE_URL/Devices/$AppToken/logout';

  //通知券類到期(需有MemberGuid)
  static String get Members_expiringcoupon =>
      '$BASE_URL/Members/$memberGuid/expiringcoupon';

  //通知點數到期(需有MemberGuid)
  static String get Members_notifypoint =>
      '$BASE_URL/Members/$memberGuid/NotifyPoints';

  //重要訊息清單(需有MemberGuid)
  static String get getMembers_expiringpoints =>
      '$BASE_URL/Members/$memberGuid/expiringpoints';

  //VIP門檻提醒通知(需有MemberGuid)
  static String get Members_VIPAlert => '$BASE_URL/Members/$memberGuid/VIPAlert';

  //忘記(變更)密碼時驗證會員身分(PUT)
  static const String Members_verify = '$BASE_URL/Members/verify';

  //忘記(變更)密碼時輸入新密碼(需有MemberGuid，PUT)
  static String get Members_smscomplete =>
      '$BASE_URL/Members/$memberGuid/smscomplete';

  //申請新會員取得簡訊認證碼(POST)
  static const String Members_newsms = '$BASE_URL/Members/newsms';

  //檢查身分證是否已申請(需有身分證號)
  static const String Members_id = '$BASE_URL/Members/identityID/id';

  //檢查手機號碼是否已申請(需有手機號碼)
  static const String Members_phone = '$BASE_URL/Members/cellPhone/phone';

  //新增會員(POST)
  static const String Members = '$BASE_URL/Members';

  //取得會員資料(需有MemberGuid)
  static String get Members_info => '$BASE_URL/Members/$memberGuid';

  //修改會員資料(需有MemberGuid，PUT)
  static String get Member_revise => '$BASE_URL/Members/$memberGuid';

  //取得會員車牌資料(需有MemberGuid)
  static String get Members_plate => '$BASE_URL/Members/$memberGuid/plate';

  //會員車牌綁定(需有MemberGuid，PUT)
  static String get Members_plate2 => '$BASE_URL/Members/$memberGuid/plate';

  //會員載具綁定(需有MemberGuid，PUT)
  static String get Members_carrierID => '$BASE_URL/Members/$memberGuid/CarrierID';

  //取得會員點數及身分標記(需有MemberGuid)
  static String get Members_summary => '$BASE_URL/Members/$memberGuid/summary';

  //取得會員商品券(需有MemberGuid)
  static String get Members_coupons => '$BASE_URL/Members/$memberGuid/coupons';

  //取得會員交易明細(需有MemberGuid)
  static String get Members_detail => '$BASE_URL/Members/$memberGuid/detail';

  //取得會員交易明細發票內容(需有MemberGuid)
  static String get Members_invoicedata =>
      '$BASE_URL/Members/$memberGuid/invoicedata';

  //發票補登(需有MemberGuid，POST)
  static String get Members_invoice => '$BASE_URL/Members/$memberGuid/invoice';

  //取得點數兌換贈品清單(需有MemberGuid)
  static String get Members_gifts => '$BASE_URL/Members/$memberGuid/gifts';

  //點數贈品兌換(多品項一次兌換，需有MemberGuid，POST)
  static String get Members_redeem => '$BASE_URL/Members/$memberGuid/redeem';

  //點數贈品兌換(單品項兌換多個，需有MemberGuid，POST)
  static String get Members_redeem2 => '$BASE_URL/Members/$memberGuid/redeem2';

  //取得好禮兌換清單(需有MemberGuid)
  static String get Members_redeemlist => '$BASE_URL/Members/$memberGuid/redeemlist';

  //好禮贈品兌換取消(需有MemberGuid，POST)
  static String get Members_redeemcancel =>
      '$BASE_URL/Members/$memberGuid/RedeemCancel';

  //取得線上購物推薦商品(需有MemberGuid)
  static String get Members_favorite => '$BASE_URL/Members/$memberGuid/favorite';

  //取得活動列表(需有MemberGuid)
  static String get Sps_list => '$BASE_URL/Sps/$memberGuid/splist';

  //取得卡友禮資料(需有MemberGuid)
  static String get Sps_card => '$BASE_URL/Sps/$memberGuid/spcard';

  //兌換卡友禮(需有MemberGuid，POST)
  static String get Sps_exchangecard => '$BASE_URL/Sps/$memberGuid/spcard';

  //取得全館滿額(需有MemberGuid)
  static String get Sps_coupon => '$BASE_URL/Sps/$memberGuid/spcoupon';

  //兌換全館(需有MemberGuid，POST)
  static String get Sps_exchamgeall => '$BASE_URL/Sps/$memberGuid/spcoupon';

  //取得銀行禮(需有MemberGuid)
  static String get Sps_bank => '$BASE_URL/Sps/$memberGuid/spbank';

  //兌換銀行禮(需有MemberGuid，POST)
  static String get Sps_exchangebank => '$BASE_URL/Sps/$memberGuid/spbank';

  //取得專區(需有MemberGuid)
  static String get Sps_area => '$BASE_URL/Sps/$memberGuid/sparea';

  //取消專區(需有MemberGuid，POST)
  static String get Sps_cancelarea => '$BASE_URL/Sps/$memberGuid/sparea';

  //銀行禮兌畢確認
  static const String Sps_bankexchange = '$BASE_URL/Sps/bankexchange';

  //卡友禮兌畢確認
  static const String Sps_cardexchange = '$BASE_URL/Sps/cardexchange';
}
