import 'package:taza/taza.dart';

class AppRepository extends ApiService {

  // Singleton instance of AppRepository
  static final AppRepository instance = AppRepository._internal();

  // Private constructor for singleton
  AppRepository._internal();

  // Singleton factory for AppRepository
  factory AppRepository() => instance;

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    // Replace with your API Key
    final String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${AppConst.googleApiKey}';

    try {
      final GetConnect connect = GetConnect();
      final response = await connect.get(url);

      if (response.status.isOk) {
        final data = response.body;
        if (data['status'] == 'OK') {
          String address = data['results'][0]['formatted_address'];
          return address;
        } else {
          return "No address found";
        }
      } else {
        return "Error fetching address: ${response.statusText}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
}
