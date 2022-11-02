//ISSUE 1_1: VIDEO CAPTURE

//Import video library
import processing.video.*;

//Declare Capture object
Capture video;

//Read from the camera
void captureEvent(Capture video) {
  video.read();
}

//Initialize Capture object and start video
void setup(){
  size(640, 320);
  video = new Capture(this, "pipeline:autovideosrc"); 
  video.start();
}

//Display the image
void draw(){
  image(video, 0, 0);
}
