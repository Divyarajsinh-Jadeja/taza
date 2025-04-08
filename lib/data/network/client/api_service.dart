import 'package:taza/taza.dart';
import 'dart:developer' as taza_logger;

class ApiService implements ApiProvider {
  final GetConnect _connect = GetConnect();

  /// Returns common headers, including the auth token if available.
  Map<String, String> _getCommonHeaders({Map<String, String>? additionalHeaders}) {
    String? token = StorageManager.instance.getAuthToken();

    printWrapped("Token ::::: $token");

    Map<String, String> headers = {
      if (token.isNotNullNorEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
      // Content-Type is omitted as GetConnect handles it automatically
    };

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    return headers;
  }

  /// Generic method to send HTTP requests using GetConnect.
  Future<Either<ErrorResponse, dynamic>?> _sendRequest<T>(
    _ApiType method,
    String url, {
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, String>? headers,
    bool withFullResponse = false,
  }) async {
    try {
      // Check internet connectivity
      if (!await ConnectivityManager().checkInternet()) {
        return Left(ErrorResponse(code: 0, message: LocaleKeys.checkInternet.tr));
      }

      // Convert method enum to string
      String methodString = method.toString().split('.').last;

      // Log request details
      taza_logger.log(
        'Request URL: $url method: $methodString headers: ${_getCommonHeaders(additionalHeaders: headers)} Body: ${jsonEncode(body)} Query: ${jsonEncode(query)}',
      );

      // Send the request using GetConnect
      Response res = await _connect.request(
        url,
        methodString,
        body: body,
        headers: _getCommonHeaders(additionalHeaders: headers),
        query: query,
      );

      // Log response details
      taza_logger.log('Request URL: $url Response: ${res.body} StatusCode: ${res.statusCode}');

      // Process the response body
      var json = res.body;
      var commonResponse = CommonResponse<T>.fromJson(json);

      if (commonResponse.isTokenExpired) {
        StorageManager.instance.clearSession();
        // TODO: Show token expired popup
        // Utils.showSmartModalBottomSheet(context: getNavigatorKeyContext, builder: (context) => const TokenExpireDialog());
        return null;
      }

      return commonResponse.isSuccess
          ? withFullResponse
              ? Right(commonResponse)
              : Right(commonResponse.responseData)
          : Left(ErrorResponse.fromJson(json));
    } on ErpException catch (e) {
      return Left(ErrorResponse(code: 0, message: e.message));
    } catch (e) {
      return Left(ErrorResponse(code: 0, message: LocaleKeys.somethingWrong.tr));
    }
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> getMethod<T>(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool withFullResponse = false,
  }) async {
    return _sendRequest<T>(_ApiType.get, url, query: query, headers: headers, withFullResponse: withFullResponse);
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> postMethod<T>(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    bool withFullResponse = false,
  }) async {
    return _sendRequest<T>(_ApiType.post, url, body: body, headers: headers, withFullResponse: withFullResponse);
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> putMethod<T>(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    bool withFullResponse = false,
  }) async {
    return _sendRequest<T>(_ApiType.put, url, body: body, headers: headers, withFullResponse: withFullResponse);
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> updateMethod<T>(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    bool withFullResponse = false,
  }) async {
    return _sendRequest<T>(_ApiType.patch, url, body: body, headers: headers, withFullResponse: withFullResponse);
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> deleteMethod<T>(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool withFullResponse = false,
  }) async {
    return _sendRequest<T>(_ApiType.delete, url, body: body, query: query, withFullResponse: withFullResponse);
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> postMultipartMethod<T>(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    List<ModelMultiPartFile>? files,
    bool withFullResponse = false,
  }) async {
    try {
      if (!await ConnectivityManager().checkInternet()) {
        return Left(ErrorResponse(code: 0, message: LocaleKeys.checkInternet.tr));
      }

      // Create FormData instance
      final formData = FormData({});

      // Add all fields from body to formData
      if (body.isNotEmpty) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      // Add files to formData if provided
      if (files != null && files.isNotEmpty) {
        for (final file in files) {
          formData.files.add(
            MapEntry(
              'file',
              MultipartFile(
                File(file.filePath),
                filename: file.filePath.split('/').last,
                // The headers parameter should be added to the request headers, not here
              ),
            ),
          );
        }
      }

      // Prepare headers
      final Map<String, String> requestHeaders = headers ?? {};

      // Add API keys from files to headers if needed
      if (files != null && files.isNotEmpty) {
        for (final file in files) {
          if (file.apiKey.isNotEmpty) {
            requestHeaders['X-API-KEY'] = file.apiKey;
          }
        }
      }

      // Prepare query parameters
      String queryString = '';
      if (query != null && query.isNotEmpty) {
        queryString = '?';
        query.forEach((key, value) {
          queryString += '$key=${Uri.encodeComponent(value.toString())}&';
        });
        queryString = queryString.substring(0, queryString.length - 1);
      }

      // Make the POST request
      final response = await _connect.post(url + queryString, formData, headers: requestHeaders);

      // Handle response
      if (response.status.isOk) {
        if (withFullResponse) {
          return Right(response);
        } else {
          return Right(response.body);
        }
      } else {
        // Parse error response
        final errorResponse = ErrorResponse(code: response.statusCode ?? 0, message: response.statusText ?? 'Unknown error');
        return Left(errorResponse);
      }
    } catch (e) {
      // Handle exceptions
      return Left(ErrorResponse(code: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, dynamic>?> updateMultipartMethod<T>(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    List<ModelMultiPartFile>? files,
    bool withFullResponse = false,
  }) async {
    try {
      if (!await ConnectivityManager().checkInternet()) {
        return Left(ErrorResponse(code: 0, message: LocaleKeys.checkInternet.tr));
      }

      // Create FormData instance
      final formData = FormData({});

      // Add all fields from body to formData
      if (body.isNotEmpty) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      // Add files to formData if provided
      if (files != null && files.isNotEmpty) {
        for (final file in files) {
          formData.files.add(MapEntry(file.apiKey, MultipartFile(File(file.filePath), filename: file.filePath.split('/').last)));
        }
      }

      // Prepare headers
      final Map<String, String> requestHeaders = headers ?? {};

      // Prepare query parameters
      String queryString = '';
      if (query != null && query.isNotEmpty) {
        queryString = '?';
        query.forEach((key, value) {
          queryString += '$key=${Uri.encodeComponent(value.toString())}&';
        });
        queryString = queryString.substring(0, queryString.length - 1);
      }

      // Make the PATCH request
      final response = await _connect.patch(url + queryString, formData, headers: requestHeaders);

      // Handle response
      if (response.status.isOk) {
        if (withFullResponse) {
          return Right(response);
        } else {
          return Right(response.body);
        }
      } else {
        // Parse error response
        final errorResponse = ErrorResponse(code: response.statusCode ?? 0, message: response.statusText ?? 'Unknown error');
        return Left(errorResponse);
      }
    } catch (e) {
      // Handle exceptions
      return Left(ErrorResponse(code: 500, message: e.toString()));
    }
  }
}

enum _ApiType { get, post, put, patch, delete }

///[ModelMultiPartFile] is used for file value
class ModelMultiPartFile {
  String filePath;
  String apiKey;

  ModelMultiPartFile({required this.filePath, required this.apiKey});
}
