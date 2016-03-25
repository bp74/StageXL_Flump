import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'package:stagexl_flump/stagexl_flump.dart';

Future main() async {

  // configure StageXL default options

  StageXL.stageOptions.renderEngine = RenderEngine.WebGL;
  StageXL.stageOptions.backgroundColor = 0xFFD0D0D0;
  StageXL.bitmapDataLoadOptions.webp = false;

  // init Stage and RenderLoop

  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas, width: 800, height: 600);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  // load the FlumpLibrary

  var flumpLibrary = await FlumpLibrary.load('images/flumpLibrary.json');

  // create FlumpMovies from the FlumpLibrary

  var idle = new FlumpMovie(flumpLibrary, 'idle');
  idle.x = 150;
  idle.y = 350;
  stage.addChild(idle);
  stage.juggler.add(idle);

  var walk = new FlumpMovie(flumpLibrary, 'walk');
  walk.x = 400;
  walk.y = 250;
  stage.addChild(walk);
  stage.juggler.add(walk);

  var attack = new FlumpMovie(flumpLibrary, 'attack');
  attack.x = 650;
  attack.y = 350;
  stage.addChild(attack);
  stage.juggler.add(attack);

  var defeat = new FlumpMovie(flumpLibrary, 'defeat');
  defeat.x = 400;
  defeat.y = 500;
  stage.addChild(defeat);
  stage.juggler.add(defeat);
}
