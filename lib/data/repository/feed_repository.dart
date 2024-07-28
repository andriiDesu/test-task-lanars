import 'package:daily_extensions/daily_extensions.dart';
import 'package:lanars_test/data/source/remote/api/feed_api/feed_api.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';

class FeedRepository {
  FeedRepository(this._feedApi);

  final FeedApi _feedApi;

  Future<List<CuratedPhoto>> getCuratedPhotosList() async {
    final photosList = await _feedApi.getCuratedPhotosList();
    final curatedPhotos = photosList.mapToList(
      (e) => e.toCuratedPhoto(),
    );

    return curatedPhotos;
  }
}
