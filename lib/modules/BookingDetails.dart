class BookingDetails {
  BookingDetails({required this.date, required this.time, required this.restaurant, required this.name, required this.phone});
  final DateTime date;
  final String time;
  final String restaurant;
  final String name;
  final String phone;

  BookingDetails.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        restaurant = json['restaurant'] as String,
        name = json['name'] as String,
        phone = json['contact'] as String,
        time = json['time'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'date': date.toString(),
    'restaurant' : restaurant,
    'name' : name,
    'contact' : phone,
    'time' : time,
  };
}