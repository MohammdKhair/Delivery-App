class AppLinks {
  static const server = "http://192.168.1.8/ecommerce";
  
  //======================== Images =============================//
  static const imageCategories = "$server/upload/categories";
  static const imageItems = "$server/upload/items";
  //======================== Auth =============================//
  static const login = "$server/delivery/auth/login.php";
  static const resend = "$server/delivery/auth/resend.php";
  //======================== ForgetPassword =============================//
  static const checkemail = "$server/delivery/forgetpassword/checkemail.php";
  static const verifycode = "$server/delivery/forgetpassword/verifycode.php";
  static const resetpassword = "$server/delivery/forgetpassword/resetpassword.php";
  //======================== home =============================//
  static const home = "$server/home/home.php";
  //========================= Address =============================//
  static const addressView = "$server/address/view.php";
  static const addressAdd = "$server/address/add.php";
  static const addressEdit = "$server/address/edit.php";
  static const addressDelete = "$server/address/delete.php";
  //======================== Orders =============================//
  static const ordersPending = "$server/delivery/orders/pending.php";
  static const ordersApprove = "$server/delivery/orders/approve.php";
  static const ordersAccepted = "$server/delivery/orders/accepted.php";
  static const ordersDone = "$server/delivery/orders/done.php";
  static const ordersDetails = "$server/delivery/orders/details.php";
  static const ordersArchive = "$server/delivery/orders/archive.php";

  
}
