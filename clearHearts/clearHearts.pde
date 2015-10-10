float h;
float k;
float r = 0;

void setup(){
  size(600, 400);
  noStroke();
  
  
  h = width/2;
  k = height/2;
}

void draw(){
  background(0);
  drawHeart(h,k,r);
  r+= 0.01;
}


void drawHeart(float h, float k, float r){
 fill(255, 0, 0, 255-(r*60));
 for (float t = 0; t < 2 * PI; t += 0.01){
   rect(r * 16 * pow(sin(t),3) + h, 
        -r * ((13 * cos(t)) - (5 * cos(2 * t)) - (2 * cos(3 * t)) - (cos(4 * t))) + k,
         3, 3);
  } 
}

void drawCircle(float h, float k, float r){
  for(float x = h-r; x <= h+r; x += 0.01){
    rect(x, sqrt(pow(r,2) - pow(x - h, 2)) + k,
         1, 1);
    rect(x, -sqrt(pow(r,2) - pow(x - h, 2)) + k,
         1, 1);
  }
}
