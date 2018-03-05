# G-AthArt-CompFoodEating
Alex Urbanski and Ryan Craig

## Goals

The goals of this project was to help the new up and coming extream eating competitors a way to train. This lets them train the correct form by the prefessional Joey Chestnut!

## Sensors 
We used the microbit to access the accelerator. We started off trying to get bluetooth to work but ran in to troubles on set up. With it being serialised we used [BBC micro:bit](http://www.wekinator.org/examples/#BBC_microbit) to set up our microbit. The when starting the 3 to 5 input program we send that to wekinator.

## Feature Extractor
We extracted 2 different gestures that were recognised by out accelerometer. Currently we are using our best simulation for Joey Chestnut by watching hours and hours of footage and mimicking his motions.

## ML Model
We used wekinator dynaminc tyme warping to train out model. 
The gestures were:
 * "Eat a Hotdog" - Fluid motion from the table of dogs to you mouth 
 * "Jump" - Quick Jump up and down

## How to Improve
To improve we would like to:
* Add a wirless training device
* Train with the actuall Joey Chestnut
* Train on different professional food eating athleats
* Add indication if you got the move 

## Demo

[Demo](https://youtu.be/bwKrGYALXVc)

