int red = 0;
int green = 0;
int blue = 0;
boolean up = true;

void setup(){
 background(0,0,0);
 size(255*2,255*2);
}

//void draw(){
//  red = (mouseX*255)/width;
//   
//  green = (mouseY*255)/height;
//  
//  if(mousePressed){
//     if(up){
//     blue++;
//     if(blue>=255){
//      up = false; 
//     }
//    }
//    else{
//      blue--;
//      if(blue<=0){
//        up = true; 
//      }
//    }  
//  }
//  
// 
//  background(red, green, blue);
//  text(str(red) + " " + str(green)  + " " + str(blue), 5, 15);
//
//
//
//}

float xoff = 0.0;
void draw() {
  background(204);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
}

//mouseReleased()
//mousePressed()

