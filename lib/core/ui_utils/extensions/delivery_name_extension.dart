extension DeliveryNameExtension on String {
  String get trimDeliveryName {
    if (this.isNotEmpty) {
      return this.split(' ')[0];
    }
    return '';
  }
}
