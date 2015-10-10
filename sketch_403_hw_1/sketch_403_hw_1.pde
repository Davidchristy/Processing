
/*
Programmer: David
Class ISTA 403
Date 09-03
*/
class Point{
  float x, y;
}

  float[][] firstCurve = {{21, 10},{23, 16},{31, 18},{51, 31},
                 {112, 55},{191, 37},{270, 18},{351, 18},
                 {428, 42}};  
  float[][] secondCurve = {{21, 10},{18, 17},{15, 34},{27, 57},
                {113, 76},{193, 58},{271, 36},{351, 29},{428, 42}};  
   
   float[][] thirdCurve = {{17, 121},{14, 104},{19, 80},{39, 65},
                         {112, 63},{193, 55},{271, 41},{351, 34},{427, 43}};
   
   float[][] forthCurve = {{17, 121},{21, 113},{51, 109},{71, 96},
                          {102, 79},{195, 120},{275, 143},{357, 132},{427, 43}};
void setup(){
  size(500,600);
  
  float amt = 0;
  float lines = 10;
  for(int j =0; j < lines; j++){
    for( int n = 1; n < firstCurve.length; n++){
     line(firstCurve[n-1][0], firstCurve[n-1][1], firstCurve[n][0], firstCurve[n][1]);
     line(secondCurve[n-1][0], secondCurve[n-1][1], secondCurve[n][0], secondCurve[n][1]);
     float oneX = lerp(firstCurve[n-1][0], secondCurve[n-1][0], amt);
     float oneY = lerp(firstCurve[n-1][1], secondCurve[n-1][1], amt);
     float twoX = lerp(firstCurve[n][0], secondCurve[n][0], amt);
     float twoY = lerp(firstCurve[n][1], secondCurve[n][1], amt);
     line(oneX, oneY, twoX, twoY);
    }
    amt += 1/lines;
  }
  
  amt = 0;
  lines = 10;
  for(int j =0; j < lines; j++){
    for( int n = 1; n < thirdCurve.length; n++){
      line(thirdCurve[n-1][0], thirdCurve[n-1][1], thirdCurve[n][0], thirdCurve[n][1]);
      line(forthCurve[n-1][0], forthCurve[n-1][1], forthCurve[n][0], forthCurve[n][1]);
      float oneX = lerp(thirdCurve[n-1][0], forthCurve[n-1][0], amt);
      float oneY = lerp(thirdCurve[n-1][1], forthCurve[n-1][1], amt);
      float twoX = lerp(thirdCurve[n][0], forthCurve[n][0], amt);
      float twoY = lerp(thirdCurve[n][1], forthCurve[n][1], amt);
      line(oneX, oneY, twoX, twoY);
    }
    amt += 1/lines;
  }
}

