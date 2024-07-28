import 'package:lanars_test/data/model/remote/curated_photo_dto.dart';
import 'package:lanars_test/data/source/remote/api/feed_api/feed_network_service.dart';
import 'package:lanars_test/data/source/remote/api/network_service.dart';
import 'package:daily_extensions/daily_extensions.dart';

class FeedApi {
  FeedApi(this._feedNetworkService);

  final FeedNetworkService _feedNetworkService;
  static const _getCuratedPhotosPath = 'curated';

  static const _curatedPhotosListQuery = {
    'per_page': 50,
  };

  static const _curatedPhotosKey = 'photos';

  Future<List<CuratedPhotoDto>> getCuratedPhotosList() {
    return _feedNetworkService.request<List<CuratedPhotoDto>>(
      _getCuratedPhotosPath,
      HttpMethod.get,
      queryParameters: _curatedPhotosListQuery,
      onParse: (response) {
        final photos = (response.data
            as Map<String, dynamic>)[_curatedPhotosKey] as List<dynamic>;
        final curatedPhotos =
            photos.mapToList((e) => CuratedPhotoDto.fromJson(e));

        return curatedPhotos;
      },
    );
  }
}
