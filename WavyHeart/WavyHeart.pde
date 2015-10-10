import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer in;
FFT fft;

int NUMOFFUZZ = (int)pow(2,13);
float RANGE = 1;
float SCALE = .6;
float TIME = 0;
float SPEED = .5;
Fuzz[] fuzzes = new Fuzz[NUMOFFUZZ];


void setup() {
    size(512, 512, P3D);
    smooth();
    noStroke();

    // object creation
    minim = new Minim(this);

    // fft creation
    in = minim.loadFile("/home/david/Downloads/Afirelove.WAV", 2048);
    in.loop();
    fft = new FFT(in.bufferSize(), in.sampleRate());
    fft.window(FFT.HAMMING);

// for heart
  for (int i = 0; i < NUMOFFUZZ; i++) {
    fuzzes[i] = new Fuzz(width/2, height/2);

  }
}


void draw() {

    // colors
    background(255);
//    colorMode(HSB, 255);
  


    int temp;
    int max = 0;
    fft.forward(in.mix);
    for (int i = 0; i < fft.specSize() ; ++i) {
        // fill in the new column of spectral values (and scale)
        temp = (int)Math.round(Math.max(0, 52 * Math.log10(1000 * fft.getBand(i))));
        if(temp > max){
          max = temp;
        }
    }
    

    for (int i = 0; i < NUMOFFUZZ; i++) {
      
      fuzzes[i].moveOut(SPEED);
      fuzzes[i].drawFuzz();
      if (fuzzes[i].dist > fuzzes[i].maxDist) {
        fuzzes[i] = new Fuzz(width/2, height/2);
        fuzzes[i].maxDist += max/20;
      }
  }
  
//  for(int i = 0; i < 360; i++){
//   int rad = (int)random(360);
//   float tempX = SCALE * 16 * pow(sin(rad), 1);
//   tempX += width/2;
//   float tempY = SCALE * 15 * cos(rad) - 7 * cos(2 * rad) - 2 * cos(3 * rad) - cos(4 * rad); 
//   tempY *= -1;
//   tempY += height/2;  
//   fill(250, 50, 50, 50);
//   ellipse(tempX, tempY, 5, 5);
//  }
}


void stop() {
    // always close Minim audio classes when you finish with them
    in.close();
    minim.stop();
    super.stop();
}

class Fuzz {
  float startX;
  float startY;
  int rad;
  float dist;
  float maxDist;

  Fuzz(int startX, int startY) {
    this.startX = startX;
    this.startY = startY;
    this.rad = (int)random(360);
    this.dist = 0;

    float tempX = SCALE * 16 * pow(sin(this.rad), 1);
    tempX += startX;
    float tempY = SCALE * 15 * cos(this.rad) - 7 * cos(2 * this.rad) - 2 * cos(3 * this.rad) - cos(4 * this.rad);
    tempY *= -1;
    tempY += startY;

//    this.startX = tempX;
//    this.startY = tempY;

    this.maxDist = distanceApart(tempX, tempY, startX, startY);
  }

  void moveOut(float dist) {
    this.dist += dist;
  }

  void drawFuzz() {

    float tempX = SCALE * this.dist * 16 * pow(sin(this.rad), 3);
    tempX += startX;
    float tempY = SCALE * this.dist * -15 * cos(this.rad) - 7 * cos(2 * this.rad) - 2 * cos(3 * this.rad) - cos(4 * this.rad);    
    tempY += startY;

    fill(250, 50, 50, this.dist + 100);
    ellipse(tempX, tempY, 5, 5);
    
    
    tempX = SCALE * this.maxDist * 16 * pow(sin(this.rad), 3);
    tempX += startX;
    tempY = SCALE * this.maxDist * -15 * cos(this.rad) - 7 * cos(2 * this.rad) - 2 * cos(3 * this.rad) - cos(4 * this.rad);    
    tempY += startY;

//    fill(250, 50, 50, 5);
//    ellipse(tempX, tempY, 5, 5);

  }
}


float distanceApart(float tempX, float tempY, float middleX, float middleY) {
  float x = abs(tempX - middleX);
  float y = abs(tempY - middleY);

  return pow(pow(x, 2) + pow(y, 2), 0.5);
}
