part of stagexl_flump;

class _FlumpTexture implements BitmapDrawable {

  num x, y, width, height;
  num originX, originY;
  ImageElement imageElement;

  _FlumpTexture(this.x, this.y, this.width, this.height, this.originX, this.originY, this.imageElement);

  void render(RenderState renderState) {
    renderState.context.drawImageScaledFromSource(imageElement, x, y, width, height, 0, 0, width, height);
  }
}
