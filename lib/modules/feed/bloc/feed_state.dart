part of 'feed_bloc.dart';

class FeedState extends BaseState {
  const FeedState({
    this.curatedPhotos = const [],
  });

  final List<CuratedPhoto> curatedPhotos;

  FeedState copyWith({
    List<CuratedPhoto>? curatedPhotos,
  }) {
    return FeedState(
      curatedPhotos: curatedPhotos ?? this.curatedPhotos,
    );
  }
}
