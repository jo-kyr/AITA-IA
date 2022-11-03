// ISSUE 1-2: RECORDED VIDEO

// If mouseX is in the center, the speed is normal (=1)
// If mouseX is 0, the speed is 0
// If mouseX is width, the speed is double (=2)
// Scrub in between

import processing.video.*;

// Declare Movie object
Movie movie;

void setup(){
  size(1920, 1080);
  
  // Initialize Movie object
  movie = new Movie(this, "dog_video.mp4");
  
  // Start movie
  movie.play();
}

// Read new frames from movie
void movieEvent(Movie movie){
  movie.read();
}

void draw(){
  
  // Ratio of mouseX over width
  float ratio = mouseX / (float) width;
  
  image(movie, 0, 0);
  
  /* The ratio returns these values: 
  mouseX = 0, ratio = 0 
  mouseX = width/2, ratio = 0.5
  mouseX = width, ratio = 1
  
  Because we want the speed to be normal 
  when the mouse is in the center and 
  double at the far right, we have to 
  multiply by 2 */
  
  movie.speed (ratio * 2);
}
