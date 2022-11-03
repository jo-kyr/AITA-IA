// ISSUE 1_4: QR CODE CAPTURE VIDEO

import processing.video.*;
import qrcodeprocessing.*;

// Declare Capture object
Capture video;
String statusMsg = "Waiting for an image";

// Declare Decoder object 
Decoder decoder;

void setup(){
  size(640, 320);
  video = new Capture(this, "pipeline:autovideosrc"); 
  video.start();
  
  // Create decoder object
  decoder = new Decoder(this);
}

// When the decoder finishes this will be invoked
void decoderEvent(Decoder decoder){
  link(decoder.getDecodedString());
}

void captureEvent(Capture video){
  video.read();
}

void draw(){
  
  // Display video
  image(video, 0, 0);
  
  // Display status
  text(statusMsg, 10, height-4);
  
  // If we are currently decoding
  if (decoder.decoding()) {
    // Display the image being decoded
    PImage show = decoder.getImage();
    image(show, 0, 0, show.width/4, show.height/4); 
    statusMsg = "Decoding image";
    for (int i = 0; i < (frameCount/2) % 10; i++) statusMsg += ".";
  } 
}

void keyReleased() {
  // Depending on which key is hit, do different things:
  if (key == ' ') {      
    // Spacebar takes a picture and tests it:
    // copy it to the PImage savedFrame:
    PImage savedFrame = createImage(video.width, video.height, RGB);
    savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    savedFrame.updatePixels();
    // Decode savedFrame
    decoder.decodeImage(savedFrame);
 
  }
}
    
