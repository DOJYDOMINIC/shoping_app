class RequirementsModel {
  final String itemName;
  final num qty;
  final num rate;

  RequirementsModel({
    required this.itemName,
    required this.qty,
    required this.rate,
  });

  RequirementsModel copywith({
    String? itemName,
    num? qty,
    num? rate,
  }) {
    return RequirementsModel(
      itemName: itemName ?? this.itemName,
      qty: qty ?? this.qty,
      rate: rate ?? this.rate,
    );
  }
}
