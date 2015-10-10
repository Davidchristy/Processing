String TEXTONSCREEN = "Test";
int NUMOFFLOWERS = 10;
int NUMOFFUZZ = (int)pow(2,9);
float RANGE = 1;
float MAX = 100;
float TIME = 0;
float SPEED = .5;
float TotalRunTime = 0;

Flower[] flowers = new Flower[NUMOFFLOWERS];

void setup() {
  size(1000, 700);
  textSize(100);
  noStroke();
  for ( int i=0; i < NUMOFFLOWERS; i++){
      flowers[i] = new Flower(random(width), random(height)); 
  }
}
boolean mouseClick = false;
int red = 0;
void mouseClicked(){
  
  mouseClick = ! mouseClick;
  red = 0;
}

void draw() {

  background(150,255, 150);
  if(mouseClick){
  
  fill(250, 50, 50, red++);
  text(TEXTONSCREEN, width/2 - 450, height/2);
   
  }
  for (int j = 0; j < NUMOFFLOWERS; j++) {
    flowers[j].moveOut();
    flowers[j].drawFlower();
    flowers[j].currDisr += .5;
    if(flowers[j].currDisr > flowers[j].maxDist){
      flowers[j] = new Flower(random(width), random(height));
    }
  
  }
}

class Flower{
 Fuzz[] fuzzes = new Fuzz[NUMOFFUZZ]; 
 float X,Y,maxDist,currDisr, k;
 color colour;
 
 Flower(float x, float y){
  this.X=x;
  this.Y=y;
  this.currDisr = 0;
  this.maxDist = random(50,150);
  this.colour = color(random(100),random(50,255),random(50,255));
  int temp1, temp2;
  temp1 = round(random(6,15));
  temp2 = round(random(1,3));
  this.k = temp1/temp2; 
  
  for (int i = 0; i < NUMOFFUZZ; i++) {
      this.fuzzes[i] = new Fuzz(this.X, this.Y, k);
  }
    
 }
 
 void drawFlower(){

  for(int i = 0; i< NUMOFFUZZ; i++){
    this.fuzzes[i].drawFuzz();
    TIME += random(.001,.05);
    if(TIME > 1){
      TIME = 0;
      this.fuzzes[i].show = false;
    }
  }
 }
 
 void moveOut(){
   for(int i = 0; i< NUMOFFUZZ; i++){
    this.fuzzes[i].moveOut(SPEED); //SPEED might change later
  }
 }


class Fuzz {
  float k;
  float startX;
  float startY;
  float currX;
  float currY;
  float endX;
  float endY;
  float rad;
  float dist;
  float maxDist;
  boolean show;

  Fuzz(float startX, float startY, float k) {
    this.startX = startX;
    this.startY = startY;
    this.show = true;
    this.rad = random(360);
    this.dist = 0;

    this.k = k;
    
    this.endX = MAX * cos(this.k * this.rad) * cos(this.rad);
//this.endX = MAX * 16 * pow(sin(this.rad), 3);
    this.endX += startX;
    this.endY = MAX * cos(this.k * this.rad) * sin(this.rad);
//    this.endY = MAX * -15 * cos(this.rad) - 7 * cos(2 * this.rad) - 2 * cos(3 * this.rad) - cos(4 * this.rad);
    this.endY += startY;
    this.startX = endX;
    this.startY = endY;
    this.maxDist = distanceApart(endX, endY, startX, startY);
  }

  void moveOut(float dist) {
    this.dist -= dist;
//    this.currX = this.dist * 16 * pow(sin(this.rad), 3);
    this.currX = this.dist * cos(this.k * this.rad) * cos(this.rad);
    this.currX += startX;
//    this.currY=this.dist * -15 * cos(this.rad) - 7 * cos(2 * this.rad) - 2 * cos(3 * this.rad) - cos(4 * this.rad);
    this.currY = this.dist * cos(this.k * this.rad) * sin(this.rad);
    this.currY += startY;
  }

  void drawFuzz() {
    if(this.show){
      fill(colour);
      ellipse(currX, currY, 5, 5);
    }
  }
 }
}

float distanceApart(float tempX, float tempY, float middleX, float middleY) {
  float x = abs(tempX - middleX);
  float y = abs(tempY - middleY);

  return pow(pow(x, 2) + pow(y, 2), 0.5);
}

