part of stagexl_flump;

class FlumpMovie extends DisplayObject implements Animatable {

  final FlumpLibrary _flumpLibrary;
  final _FlumpMovieData _flumpMovieData;
  final List<_FlumpMovieLayer> _flumpMovieLayers = new List<_FlumpMovieLayer>();

  num _time = 0.0;
  num _duration = 0.0;
  int _frame = 0;
  int _frames = 0;

  // ToDo: add features like playOnce, playTo, goTo, loop, stop, isPlaying, label events, ...

  FlumpMovie(FlumpLibrary flumpLibrary, String name) :
    _flumpLibrary = flumpLibrary,
    _flumpMovieData = flumpLibrary._getFlumpMovieData(name) {

    for(var flumpLayerData in _flumpMovieData.flumpLayerDatas) {
      var flashMovieLayer = new _FlumpMovieLayer(_flumpLibrary, flumpLayerData);
      _flumpMovieLayers.add(flashMovieLayer);
    }

    _frames = _flumpMovieData.frames;
    _duration = _frames / _flumpLibrary._frameRate;
  }

  bool advanceTime(num time) {
    _time += time;

    var frameTime = _time % _duration;
    _frame = min(_frames * frameTime ~/ _duration, _frames - 1);

    for(var flumpMovieLayer in _flumpMovieLayers) {
      flumpMovieLayer.advanceTime(time);
      flumpMovieLayer.setFrame(_frame);
    }

    return true;
  }

  void render(RenderState renderState) {
    for(var flumpMovieLayer in _flumpMovieLayers) {
      if (flumpMovieLayer.visible) {
        renderState.renderObject(flumpMovieLayer);
      }
    }
  }
}
