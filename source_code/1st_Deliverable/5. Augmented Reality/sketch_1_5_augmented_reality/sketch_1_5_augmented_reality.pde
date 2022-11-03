import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
Movie movie;

void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  
  movie = new Movie(this, "videoplayback.mp4");
  cam=new Capture(this,"pipeline:autovideosrc");
  nya=new MultiMarker(this,width,height,"../../data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("../../data/patt.hiro",80);
  cam.start();
  //movie.loop();
}

void movieEvent(Movie movie) {
  movie.read();
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  movie.loop();
  image(movie, 0, 0);
  nya.endTransform();
}
