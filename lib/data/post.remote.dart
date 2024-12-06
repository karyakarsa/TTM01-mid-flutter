import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchAll();
}

class PostRemoteDataSourceImpl extends GetConnect
    implements PostRemoteDataSource {
  PostRemoteDataSourceImpl() {
    super.baseUrl = 'https://jsonplaceholder.typicode.com';
  }

  @override

  /// Fetches a list of PostModel objects from the remote server.
  ///
  /// Sends a GET request to the '/posts' endpoint. If the request is
  /// successful, it parses the response body and returns a List of
  /// PostModel objects. If the request fails, it throws a
  /// ServerException with details about the error.
  Future<List<PostModel>> fetchAll() async {
    logger.i('Fetching posts');
    final response = await get('/posts');
    if (response.status.hasError) {
      logger.e('Error fetching posts: ${response.statusCode}',
          error: response.body);
      throw ServerException(response.statusText!,
          statusCode: response.statusCode!, details: response.body);
    }

    logger.i('Posts fetched successfully', error: response.body.length);
    return (response.body as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
