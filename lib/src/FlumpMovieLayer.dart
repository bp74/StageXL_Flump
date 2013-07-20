part of stagexl_flump;

class _FlumpMovieLayer extends Warp implements Animatable {

  final FlumpLibrary flumpLibrary;
  final _FlumpLayerData flumpLayerData;
  final Map<String, BitmapDrawable> symbols = new Map<String, BitmapDrawable>();
  BitmapDrawable symbol;

  _FlumpMovieLayer(FlumpLibrary flumpLibrary, _FlumpLayerData flumpLayerData) :
    this.flumpLibrary = flumpLibrary,
    this.flumpLayerData = flumpLayerData {

    for(var keyframe in flumpLayerData.flumpKeyframeDatas) {
      if (keyframe.ref != null && symbols.containsKey(keyframe.ref) == false) {
        symbols[keyframe.ref] = flumpLibrary._createSymbol(keyframe.ref);
      }
    }

    setFrame(0);
  }

  bool advanceTime(num time) {
    if (symbol is Animatable) {
      var animatable = symbol as Animatable;
      animatable.advanceTime(time);
    }
  }

  void setFrame(int frame) {
    var keyframe = flumpLayerData.getKeyframeForFrame(frame);

    num x = keyframe.x, y = keyframe.y;
    num scaleX = keyframe.scaleX, scaleY = keyframe.scaleY;
    num skewX = keyframe.skewX, skewY = keyframe.skewY;
    num pivotX = keyframe.pivotX, pivotY = keyframe.pivotY;
    num alpha = keyframe.alpha;

    if (keyframe.index != frame && keyframe.tweened) {
      var nextKeyframe = flumpLayerData.getKeyframeAfter(keyframe);

      if (nextKeyframe != null) {
        var interped = (frame - keyframe.index) / keyframe.duration;
        var ease = keyframe.ease;

        if (ease != 0) {
          var t = 0.0;
          if (ease < 0) {
            var inv = 1 - interped;
            t = 1 - inv * inv;
            ease = 0 - ease;
          } else {
            t = interped * interped;
          }
          interped = ease * t + (1 - ease) * interped;
        }

        x = x + (nextKeyframe.x - x) * interped;
        y = y + (nextKeyframe.y - y) * interped;
        scaleX = scaleX + (nextKeyframe.scaleX - scaleX) * interped;
        scaleY = scaleY + (nextKeyframe.scaleY - scaleY) * interped;
        skewX = skewX + (nextKeyframe.skewX - skewX) * interped;
        skewY = skewY + (nextKeyframe.skewY - skewY) * interped;
        alpha = alpha + (nextKeyframe.alpha - alpha) * interped;
      }
    }

    /*
    _transformationMatrixPrivate.identity();
    _transformationMatrixPrivate.translate(-pivotX, -pivotY);
    _transformationMatrixPrivate.scale(scaleX, scaleY);
    _transformationMatrixPrivate.skew(skewX, skewY);
    _transformationMatrixPrivate.translate(x, y);
    */

    num a =   scaleX * cos(skewY);
    num b =   scaleX * sin(skewY);
    num c = - scaleY * sin(skewX);
    num d =   scaleY * cos(skewX);
    num tx =  x - (pivotX * a + pivotY * c);
    num ty =  y - (pivotX * b + pivotY * d);

    this.matrix.setTo(a, b, c, d, tx, ty);
    this.alpha = alpha;
    this.visible = keyframe.visible;

    symbol = (keyframe.ref != null) ? symbols[keyframe.ref] : null;
  }

  void render(RenderState renderState) {
    if (symbol != null) {
      symbol.render(renderState);
    }
  }
}
