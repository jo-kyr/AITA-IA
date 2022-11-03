import qrcodeprocessing.*;

// Declaring variable for the image
PImage img;

// Declaring a decoder object
Decoder dec;

void setup(){
  size(200, 200);
  
  // New instance of image
  img = loadImage("qr_code.png");
  
  // New instance of decoder
  dec = new Decoder(this);
  
   // Decode the image
  dec.decodeImage(img);
}

void draw(){
  background(0);
  // Display the image
  image(img, 0, 0, width, height);
  
}

void decoderEvent(Decoder dec){
  link(dec.getDecodedString());
}
