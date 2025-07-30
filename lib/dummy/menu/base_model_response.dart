
import 'package:taza/interface/base_model_provider.dart';

class BaseModelResponse<T extends BaseModelProvider>
  implements BaseModelProvider {
  T? data;
  List<T>? dataList;
  BaseModelResponse({
    this.data,
  });

  @override
  fromJson(json) {
    if (json.runtimeType == List) {
      List arrData = json ?? [];
      List<T> outputData = [];
      for (var i = 0; i < arrData.length; i++) {
        outputData.add(data?.fromJson(arrData[i]));
      }
      dataList = outputData;
    } else {
      data = data?.fromJson(json ?? {}); //TODO: need to update key.
    }
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['data'] = data?.toJson();
    json.removeWhere((key, value) => value == null);
    return json;
  }
}

class WidgetModel implements BaseModelProvider {
  String? rfkid;
  String? usedIn;
  String? variationId;
  String? type;

  WidgetModel({this.rfkid, this.usedIn, this.variationId, this.type});

  WidgetModel.fromJson(Map<String, dynamic> json) {
    rfkid = json['rfkid'];
    usedIn = json['used_in'];
    variationId = json['variation_id'];
    type = json['type'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['rfkid'] = rfkid;
    data['used_in'] = usedIn;
    data['variation_id'] = variationId;
    data['type'] = type;
    data.removeWhere((key, value) => value == null);
    return data;
  }

  @override
  fromJson(json) {
    return WidgetModel.fromJson(json);
  }
}

class Result<T> {
  final T? result;
  final bool isError;

  final String? errorMessage;
  final String? responseBody;

  bool get hasData => result != null;
  bool get hasError => isError && errorMessage != null;
  bool get isSuccess => isError == false;
  bool get successfulWithData => hasData && isSuccess;

  Result(
      {this.result,
      required this.isError,
      this.errorMessage,
      this.responseBody});
}
