import processing.core.PConstants;
import TUIO.*;

// declare a TuioProcessing client
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks

// declare images 
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img;

void setup()
{
  size(640, 480);

  // Instance of TuioProcessing client
  tuioClient  = new TuioProcessing(this);

  // Load images
  img1 = loadImage("image_1.jpg");
  img1.resize(450, 0);
  
  img2 = loadImage("image_2.jpg");
  img2.resize(450, 0);
  
  img3 = loadImage("image_3.jpg");
  img3.resize(450, 0);
  
  img4 = loadImage("image_4.jpg");
  img4.resize(450, 0);

  // GUI setup
  noCursor();
  size(640, 480);
  noStroke();
  fill(0);

  // periodic updates
  if (!callback) 
  {
    frameRate(60);
    loop();
  } else noLoop(); // or callback updates 

  font = createFont("Arial", 18);
  scale_factor = height/table_size;
}



void draw()
{
  imageMode(CENTER);
  background(255);
  textFont(font, 18*scale_factor);
  float cur_size = cursor_size*scale_factor; 

  // Get Objects
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();

  for (int i = 0; i < tuioObjectList.size(); i++) 
  {
    TuioObject tobj = tuioObjectList.get(i);
    
    switch(tobj.getSymbolID())
    {
      // Images
    case 0:
      {
        image(img1, width/2, height/2);
        break;
      }

    case 1:
      {
        image(img2, width/2, height/2);
        break;
      }

    case 2:
      {
        image(img3, width/2, height/2);
        break;
      }

    case 3:
      {
        image(img4, width/2, height/2);
        break;
      }

      // Filters
    case 4:
      {
       filter(THRESHOLD);
        break;
      }

    case 5:
      {
        filter(BLUR, 10);
        break;
      }

    case 6:
      {
        filter(GRAY);
        break;
      }

    case 7:
      {
        
        translate(-width/2, -height/2);

        // Grab mouse coordinates, constrained to window
        int mx = constrain(mouseX, 0, width);
        int my = constrain(mouseY, 0, height);

        // Translate to the mouse location
        translate(mx, my);
        break;
      }

    case 8:
      {
        filter(POSTERIZE, 5);
        break;
      }
      
    case 9:
      {
        float mx = map(mouseX, -2, width, 0, 2);
        scale(mx);
        break;
      }
      
    case 10:
      {
        filter(ERODE);
        break;
      }
      
    case 11:
      {
        brightnessFilter();
        break;
      }
    }
  }

    // Get the current list of TUIO cursors
    ArrayList<TuioCursor> tuioCursorList = tuioClient.getTuioCursorList();

    for (int i = 0; i < tuioCursorList.size(); i++)
    {
      TuioCursor tcur = tuioCursorList.get(i);

      ArrayList<TuioPoint> pointList = tcur.getPath();

      if (pointList.size()>0) 
      {
        stroke(0, 0, 255);
        TuioPoint start_point = pointList.get(0);

        for (int j = 0; j < pointList.size(); j++)
        {
          TuioPoint end_point = pointList.get(j);
          line(start_point.getScreenX(width), start_point.getScreenY(height), end_point.getScreenX(width), end_point.getScreenY(height));
          start_point = end_point;
        }

        stroke(192, 192, 192);
        fill(192, 192, 192);
        ellipse( tcur.getScreenX(width), tcur.getScreenY(height), cur_size, cur_size);
        fill(0);
        text(""+ tcur.getCursorID(), tcur.getScreenX(width)-5, tcur.getScreenY(height)+5);
        
      }
    }

    // Get Blobs
    ArrayList<TuioBlob> tuioBlobList = tuioClient.getTuioBlobList();

    for (int i = 0; i < tuioBlobList.size(); i++) {
      TuioBlob tblb = tuioBlobList.get(i);
      stroke(0);
      fill(0);
      pushMatrix();
      translate(tblb.getScreenX(width), tblb.getScreenY(height));
      rotate(tblb.getAngle());
      ellipse(-1*tblb.getScreenWidth(width)/2, -1*tblb.getScreenHeight(height)/2, tblb.getScreenWidth(width), tblb.getScreenWidth(width));
      popMatrix();
      fill(255);
      text(""+tblb.getBlobID(), tblb.getScreenX(width), tblb.getScreenX(width));
    }

   
  }


//------------------------------------ Copied from TUIO Demo --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  if (verbose) println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

// --------------------------------------------------------------
// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  if (verbose) println("add cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
  //redraw();
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  if (verbose) println("set cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
    +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
  //redraw();
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  if (verbose) println("del cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called when a blob is added to the scene
void addTuioBlob(TuioBlob tblb) {
  if (verbose) println("add blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea());
  //redraw();
}

// called when a blob is moved
void updateTuioBlob (TuioBlob tblb) {
  if (verbose) println("set blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea()
    +" "+tblb.getMotionSpeed()+" "+tblb.getRotationSpeed()+" "+tblb.getMotionAccel()+" "+tblb.getRotationAccel());
  //redraw()
}

// called when a blob is removed from the scene
void removeTuioBlob(TuioBlob tblb) {
  if (verbose) println("del blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}

// ----------------------------- FILTER METHODS -----------------------------------------------------------------------

//Brightness
void brightnessFilter()
{ loadPixels();
 
  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*width;

      // Get the R,G,B values from image
      float r = red  (pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue (pixels[loc]);
      
       // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = map(mouseX, 0, width, 0, 8);  
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // The RGB values are constrained between 0 and 255 before being set as a new color.      
      r = constrain(r, 0, 255); 
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }
  updatePixels();
}
