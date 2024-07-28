import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/data/repository/feed_repository.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';
import 'package:lanars_test/modules/common/bloc/base_bloc.dart';

part 'feed_event.dart';

part 'feed_state.dart';

class FeedBloc extends BaseBloc<FeedState, FeedEvent> {
  FeedBloc(this._feedRepository) : super(const FeedState()) {
    on<GetPhotosEvent>(_onGetPhotos);
    on<UpdatePhotosEvent>(_onUpdatePhotos);
  }

  final FeedRepository _feedRepository;

  void _onGetPhotos(GetPhotosEvent event, Emitter<FeedState> emit) async {
    await execute(
      _feedRepository.getCuratedPhotosList(),
      retry: () => _onGetPhotos(event, emit),
      onSuccess: (result) async {
        result.sort(
          (a, b) => a.photographer.compareTo(
            b.photographer,
          ),
        );

        add(
          UpdatePhotosEvent(
            curatedPhotos: result,
          ),
        );
      },
    );
  }

  void _onUpdatePhotos(
    UpdatePhotosEvent event,
    Emitter<FeedState> emit,
  ) {
    emit(
      FeedState(
        curatedPhotos: event.curatedPhotos,
      ),
    );
  }
}
