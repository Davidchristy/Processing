int numberOfCirlces = 40;
int distanceOfCirlces = 50;
int distanceOfLine = 80;
float gravity = 0.1;

class myCircle{
  int x;
  int y;
  int currY;
  int currX;
  float offsetY;
  float offsetX;
  float myRandom;
  
  public myCircle(int x, int y){
    
    this.x = x;
    
    this.y = y;
    
    this.offsetX = 0;
    
    this.offsetY = 0;
    
    this.myRandom = (int)random(width);
    
  }
  
}

myCircle[] circles = new myCircle[numberOfCirlces];

void setup(){
  size(750,500);
  for(int i = 0; i < numberOfCirlces; i++){

     circles[i] = new myCircle((int)random(width),(int)random(height));
  }



}

void draw(){
  background(0,00,200);
  for(int i = 0; i < numberOfCirlces; i++){
    
    if(circles[i].currX + (int) circles[i].offsetX < 0 ||
        circles[i].currY + (int) circles[i].offsetY < 0 ||
        circles[i].currX + (int) circles[i].offsetX > width ||
        circles[i].currY + (int) circles[i].offsetY > height){
      //it's outside the visable space
        circles[i] = new myCircle((int)random(width),(int)random(height));
        }    
    
    float t = millis()/500.0f;
    circles[i].currX = (int)(circles[i].x + distanceOfCirlces*cos(t + circles[i].myRandom));
    circles[i].currY = (int)(circles[i].y + distanceOfCirlces*sin(t + circles[i].myRandom));
    
    
    for(int j = 0; j < numberOfCirlces; j++){
      if(distanceFrom(circles[i].currX + (int)circles[i].offsetX, circles[i].currY + (int)circles[i].offsetY, circles[j].currX + (int)circles[j].offsetX, circles[j].currY + (int) circles[j].offsetY) < distanceOfLine){
         line(circles[i].currX + circles[i].offsetX, circles[i].currY + circles[i].offsetY, circles[j].currX + circles[j].offsetX, circles[j].currY + (int) circles[j].offsetY);
            if(circles[i].currY + circles[i].offsetY > circles[j].currY + circles[j].offsetY){
              circles[i].offsetY -= gravity;
            } else {
              circles[i].offsetY += gravity;
            }
            if(circles[i].currX + circles[i].offsetX > circles[j].currX + circles[j].offsetX){
              circles[i].offsetX -= gravity;
            } else {
              circles[i].offsetX += gravity;
            }
      }
    }
    ellipse(circles[i].currX + (int) circles[i].offsetX,circles[i].currY + (int)circles[i].offsetY,10,10);
  }
  
}

float distanceFrom(int middleX, int middleY, int currentX, int currentY) {
  int tempX = abs(middleX - currentX);
  int tempY = abs(middleY - currentY);

  float distance = pow(pow(tempX, 2)+pow(tempY, 2), 0.5);

  return distance;
}
