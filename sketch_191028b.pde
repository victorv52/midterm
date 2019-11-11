import processing.serial.*;

Serial myPort;
int potState;
int buttonState;
int[] inputVars = {0, 0, 0}; //make array to be populated from serial (note number of variables)

import processing.sound.*;

SinOsc sine;

SinOsc sine2;


void setup () {
  size(200, 200);
    background(255);

  // create and start the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
   sine2 = new SinOsc(this);
  sine2.play();
  rectMode(CENTER);
  println(Serial.list()); //print serial devices (remember to count from 0)
  myPort = new Serial(this, Serial.list()[0], 9600); //make sure the baudrate matches arduino
  myPort.bufferUntil('\n'); // don't generate a serialEvent() unless you get a newline character
}
void draw () {
  background(0);
  
  // Map mouseY from 0.0 to 1.0 for amplitude
  float amplitude = 1;
  sine.amp(amplitude);
  float amplitude2 = 1;
  sine2.amp(amplitude2);

  // Map mouseX from 20Hz to 1000Hz for frequency  
  float frequency = inputVars[0];
  sine.freq(frequency);
  float frequency2 = inputVars[1];
  sine2.freq(frequency2);
  //if (inputVars[1] == 1){
  //  fill(color(int(random(255)),int(random(255)),int(random(255))));
  //}
  //else{
    fill(255);
  //}
  //rect(width/2, height/2, map(inputVars[0], 0, 1023, 0, width), map(inputVars[0], 0, 1023, 0, width));
println(inputVars[0] + " " + inputVars[1] + " " + inputVars[2]);
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n'); //read until new line (Serial.println on Arduino)
  if (inString != null) {
    inString = trim(inString); // trim off whitespace
    inputVars = int(split(inString, '&')); // break string into an array and change strings to ints 
}
}
