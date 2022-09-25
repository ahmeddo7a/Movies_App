import 'package:movies_app/features/movies_module/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(
      {required super.id, required super.title, super.image});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
     // RecommendationModel(id: json['id'], title: json['title'], image: json['backdrop_path']?? '/6cpRpfD3isvluFwXDGSiDVyibPJ.jpg');
  RecommendationModel(id: json['id'], title: json['title'], image: json['backdrop_path']);
}
