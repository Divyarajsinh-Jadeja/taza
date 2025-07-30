abstract class BaseModelProvider<T> {
  T fromJson(dynamic json);
  Map<String, dynamic> toJson();
}