class RideDetails {
  final String id; 
  final String name;
  final String image;
  final String price;
  final String distance;
  final String time;
  final String pickupLocation;
  final String dropLocation;
  final String paymentMethod;

  const RideDetails({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.distance,
    required this.time,
    required this.pickupLocation,
    required this.dropLocation,
    required this.paymentMethod,
  });
}