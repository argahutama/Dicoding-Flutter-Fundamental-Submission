part of 'models.dart';

class CustomerReview extends Equatable {
  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  final String name;
  final String review;
  final String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  @override
  List<Object> get props => [name, review, date];
}
