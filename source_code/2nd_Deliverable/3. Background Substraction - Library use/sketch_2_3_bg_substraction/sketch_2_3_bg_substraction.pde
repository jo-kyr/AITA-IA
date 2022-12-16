import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV opencv;

void setup() {

  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  
  opencv = new OpenCV(this, width, height);
  opencv.startBackgroundSubtraction(5, 5, 0.5);

}

void draw() {
  
  image(video, 0, 0);
  if (video.width == 0 || video.height == 0)
    return;

  opencv.loadImage(video);
  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}


void captureEvent(Capture video) {

  video.read();
  
}
