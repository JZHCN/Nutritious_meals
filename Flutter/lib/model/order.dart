class Order {
  final int id;
  final int userId;
  final DateTime orderTime;
  final DateTime pickupTimeStart;
  final DateTime pickupTimeEnd;
  final double totalPrice;
  final int type;

  Order(
      {required this.id,
      required this.userId,
      required this.orderTime,
      required this.pickupTimeStart,
      required this.pickupTimeEnd,
      required this.totalPrice,
      required this.type});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userid'],
      orderTime: DateTime.parse(json['ordertime']),
      // json['ordertime'] != null ? DateTime.parse(json['ordertime']) : null,
      pickupTimeStart: DateTime.parse(json['pickuptimestart']),
      pickupTimeEnd: DateTime.parse(json['pickuptimeend']),
      totalPrice: json['totalprice'].toDouble(),
      type: json['type'],
    );
  }
}
