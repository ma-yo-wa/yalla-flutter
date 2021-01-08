class PaymentHistoryModel {
  String sId;
  int amount;
  String userEmail;
  String orderRef;
  String paymentReference;
  String paymentStatus;
  String gatewayResponse;
  String transactionDate;

  PaymentHistoryModel(
      {this.sId,
        this.amount,
        this.userEmail,
        this.orderRef,
        this.paymentReference,
        this.paymentStatus,
        this.gatewayResponse,
        this.transactionDate});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    amount = json['amount'];
    userEmail = json['user_email'];
    orderRef = json['order_ref'];
    paymentReference = json['payment_reference'];
    paymentStatus = json['payment_status'];
    gatewayResponse = json['gateway_response'];
    transactionDate = json['transaction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['amount'] = this.amount;
    data['user_email'] = this.userEmail;
    data['order_ref'] = this.orderRef;
    data['payment_reference'] = this.paymentReference;
    data['payment_status'] = this.paymentStatus;
    data['gateway_response'] = this.gatewayResponse;
    data['transaction_date'] = this.transactionDate;
    return data;
  }
}
