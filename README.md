# G-AthArt-CompFoodEating
Alex Urbanski and Ryan Craig

## Goals

The goals of this project was to provide a way that professional hotdog eaters or amateurs could train to eat hotdogs without eating hotdogs and experiencing the negative effects of binge eating so that they would be able to perform at a higher level in competition.

## Sensors 
We used the microbit to access the accelerator. We started off trying to get bluetooth to work but ran in to troubles on set up. With it being serialised we used [BBC micro:bit](http://www.wekinator.org/examples/#BBC_microbit) to set up our microbit. The when starting the 3 to 5 input program we send that to wekinator. The microbit was the only sensor that we used during the project. 

## Feature Extractor
We extracted 2 different gestures that were recognized by out accelerometer. The first gesture was bringing the hotdog from the table to the mouth and then the second gesture was jumping up and down. In order recognize these gestures we extracted the x, y, and z dimension accelerometer data and used those values as our features.

## ML Model
We used wekinator dynamic time warping to train out model. It seemed like a reasonable choice because we were training on motions that could be larger or smaller based on the user. The user could also perform the actions with different speeds, and dynamic time warping would allow the action to still be recognized despite these variations in the motion. 

We tried to experiment with changing the threshold for a match with our DTW and this helped a lot in differentiating user actions. We also tried adding more and fewer samples and concluded that more samples increased the accuracy of the project. We also tried to train with different motion sizes and motion speeds to ensure our model would work correctly.

## How to Improve
In order to improve this project, we could have some sort of measure of hand strength, so we know that the user is grasping the hotdog firmly enough. Wireless would also benefit the project, but we weren't able to get it to work. And we could use some other sort of sensor like maybe Kinect in addition to the micro bit to increase accuracy of our gesture readings.

## Demo

[Demo](https://youtu.be/bwKrGYALXVc)

