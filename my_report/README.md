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

![Uploading 2_1.gif…]()

### 2. Motion Detection
Following Examples 16-11 and 16-13, I made a black circle that tracks movement.

![Uploading 2_2.gif…]()

### 3. Background Substraction - OpenCV
After installing and importing the OpenCV library to Processing, I opened the BackgroundSubstraction example. After removing the existing video, I added a new capture video element, so moving objects are tracked through the camera. 

![Uploading 2_3.gif…]()

Using the OpenCV library is faster, more precise and easier. There are built in functions that automate the process of what we're trying to achieve, and also give us new abilities.

### 4. Object Tracking
Combining Example 16-11 and 9-8 from Learning Processing, there is a stream of rectangles that follow the colour that is selected with the mouse. This worked best when there was high contrast between the colours in the video.

![Uploading 2_4.gif…]()

In my opinion, this method of tracking/navigating is less presise than a computer mouse. Firstly, because it would underperform in situations with low light or complex background. And secondly, because the added 3rd dimension makes navigating a 2D screen less intuitive.

# 3rd Deliverable 


# Bonus 


# Conclusions


# Sources
* http://learningprocessing.com/
* https://discourse.processing.org/
* https://processing.org/
