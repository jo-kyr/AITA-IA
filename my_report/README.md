# Lesson: Advanced Interaction Technologies & Applications

### First and Last Name: Kyriakou Ioanna
### University Registration Number: dpsd18058
### GitHub Personal Profile: jo-kyr
### Advanced Interaction Tecnologies & Applications Github Personal Repository: https://github.com/jo-kyr/AITA-IA

# Introduction

# Summary


# 1st Deliverable
### 1. Video Capture
Firstly, I connected a web camera to my PC and checked that it is being recognised and working properly. The, I installed the Video Library for Processing 3 through the library manager. I copied the code from Example 16-1 and run it. At first, Processing wasn't able to find the camera.

![scr1](https://user-images.githubusercontent.com/97399069/200664041-efd4f63c-10ae-4d5a-a564-4a65b6dbe999.png)

After some searching, I found a solution on the Processing Foundation website. I fixed the code and ran the program again.

![scr2](https://user-images.githubusercontent.com/97399069/200664099-a7f91b81-da15-4a7b-983d-5ef49f822b5a.png)

### 2. Recorded Video
First, I studied Examples 16-4 and 16-5 from the Learning Processing website, as well as the speed() method on the Processing website. Then, I created a new sketch and made a "data" folder, where I placed the video I wanted. I combined the previous examples and tweaked the numbers so that the playback speed is controlled the way I wanted.

![scr3](https://user-images.githubusercontent.com/97399069/200667170-b36215db-2ac7-4b18-829e-9a06323cdc19.png)

### 3. QR Code
After downloading the QR Library, I created a QR code for my github profile. I created a "data" folder along with the sketch and place the image there. I followed the code from the example, changed the image source to my own and added the command to open the url that was decoded.

![scr4](https://user-images.githubusercontent.com/97399069/200668332-d1d4de27-0cee-4437-b1ef-996f3b7b4cbc.png)

### 4. QR Code - Camera Capture
Using the example from the QR Code Library, I made small adjustments to the code so that there weren't any unecessary processes.

![scr5](https://user-images.githubusercontent.com/97399069/200671215-5cd3ecb5-63a1-43ac-8e46-3801ec8df840.png)

### 5. Augmented Reality
After downloading the NyARToolkit Library and looking through the guide, I created a new sketch and a "data" folder which held the video I wanted to use. I copied the code from the simpleLite example and made a few changes so that my video plays when the Hiro marker is recognised. I noticed that the video wasn't showing up correctly on the marker and tried to fix it by transforming it. 

![scr6](https://user-images.githubusercontent.com/97399069/200689127-f0968d13-cc1e-4d56-a7b9-24a98b0b5310.png)

# 2nd Deliverable
### 1. Background Removal
Firstly, I had to make a solid coloured backdrop to capture on camera. Then, following Example 16-12 from the Learning Processing website, I made some changes to the code to fix the "ArrayIndexOutOfBoundsException" error, and replace the background with an image instead of the colour green.

![2_1](https://user-images.githubusercontent.com/97399069/208140371-d8b8fb9e-a575-4e0b-9e60-6ded37a0221b.gif)

### 2. Motion Detection
Following Examples 16-11 and 16-13, I made a black circle that tracks movement.

![2_2](https://user-images.githubusercontent.com/97399069/208140490-bf566469-e1ce-421f-9a23-ce7b61dec22a.gif)

### 3. Background Substraction - OpenCV
After installing and importing the OpenCV library to Processing, I opened the BackgroundSubstraction example. After removing the existing video, I added a new capture video element, so moving objects are tracked through the camera. 

![2_3](https://user-images.githubusercontent.com/97399069/208140634-4cc1cd42-6442-4b5e-937d-fd620572b56d.gif)

Using the OpenCV library is faster, more precise and easier. There are built in functions that automate the process of what we're trying to achieve, and also give us new abilities.

### 4. Object Tracking
Combining Example 16-11 and 9-8 from Learning Processing, there is a stream of rectangles that follow the colour that is selected with the mouse. This worked best when there was high contrast between the colours in the video.

![2_4](https://user-images.githubusercontent.com/97399069/208140848-77fb14b8-2d66-4374-b82c-3e7805fdf921.gif)


In my opinion, this method of tracking/navigating is less presise than a computer mouse. Firstly, because it would underperform in situations with low light or complex background. And secondly, because the added 3rd dimension makes navigating a 2D screen less intuitive.

# 3rd Deliverable 
#### Installation
To begin the third part of the assignment, I followed the provided steps:

1. Install the reacTIVision vision engine
2. Install the reacTIVision library in Processing
3. Install the TUIO Simulator application
4. Install the Java RUntime Environment
5. Run the TUIO Demo provided with the application

I faced some issues with the TUIO Simulator and tested a few different ones to run the TUIO Demo. 

#### Image Processing Application
After printing the fiducials and finding the images I would be using in the project, I started a new sketch and copied the TUIO Demo code into it. I began by loading the images in the setup function. Then, I assigned the fiducials 0 to 3 to each image, using a switch case. When the fiducial is recognized by the reacTIVision software, the corresponding image is drawn onto the display window. I set the imageMode to CENTER and drew the images using the center point of the window. 

https://user-images.githubusercontent.com/97399069/211919095-7a4b3314-a084-4b85-90f3-8fd8b2394838.mp4

After that, it was time to create the filters for my application. I made use of the PConstants class, since it has functions that can be used for image processing. The filters I created/used are: threshold, blur, gray, translate, posterize, scale, erode and brightness.

##### Threshold

https://user-images.githubusercontent.com/97399069/211919311-c8860929-5b9f-4cbe-9930-1a568761198d.mp4

##### Blur

https://user-images.githubusercontent.com/97399069/211923511-bbced7c6-9cb4-441a-9bd1-6931843ce722.mp4

##### Gray

https://user-images.githubusercontent.com/97399069/211923537-d7b2a863-7619-4387-8dac-d0b36c630858.mp4

##### Translate
For the translate filter, I wanted the image to follow the position of the mouse. To achieve that I had to first translate the center of the image to the origin point in the upper left corner. That way both the image and the cursor begin at the same point in the display window.

https://user-images.githubusercontent.com/97399069/211923582-713d8e30-ce8c-4346-95b0-f112eba92cd6.mp4

##### Posterize

https://user-images.githubusercontent.com/97399069/211919481-37d91e93-04fe-4fc2-90cc-32fecdbd76c7.mp4

##### Scale
For the scale filter, I used a variable to map the x position of the mouse. I constrained the scale between -2 and 2, so the image doesn't get too small or too big.

https://user-images.githubusercontent.com/97399069/211924184-60e74267-6c60-480b-96f5-f8733b359bf6.mp4

##### Erode

https://user-images.githubusercontent.com/97399069/211919423-2c6374c9-191b-43e7-b837-85680c38a57c.mp4

##### Brightness
For the brightness filter, I studied the exaple 15-08 from Learning Processing 2nd Edition. I modified the code so that the image isn't drawn twice on the display window.

https://user-images.githubusercontent.com/97399069/211923728-84bf2bab-0a2e-40f9-9c27-b3fff6a8f3b4.mp4

# Bonus 


# Sources
* http://learningprocessing.com/
* https://discourse.processing.org/
* https://processing.org/
