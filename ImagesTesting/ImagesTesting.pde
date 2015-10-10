import java.util.Scanner;

PImage img;
PImage myImage;
int pixelSize = 1;
int[][] pic;
int max = 0;
int min = max;
int temp;

String hiddenString = "Hello, this is a hidden message";

void setup(){
 img = loadImage("cat.jpg"); 
 pic = new int[img.height][img.width];
 size(img.width, img.height); 
 noStroke();
 frameRate(1);
//myImage = img.get(0,0,0,img.height); 






int temp2 = 0;
if(count==1){
  //This section will be for reading in the data
for(int x = 0; x < img.width; x += 1){
  for(int y = 0; y < img.height; y += 1){
    color c = img.get(x,y);
//    temp = (c & (round(pow(2,30)) ^ round(pow(2,32)))+1);
//    temp = (c | (round(pow(2,4)-1)));
//    temp = (c - mouseY*10000);
//    temp = c;
      //keep these three for 0-ing out
      String bitString = "11111111";
      for(int i = 0; i < 3; i++){
        bitString += "11000000";
      }
      bitString = "0" + bitString.substring(1,bitString.length());
      temp2 = Integer.parseInt(bitString, 2);
      temp2 = temp2 | (round(pow(2,32))+1);
      temp = c & temp2;
      //these to 1 out
//      temp2 = Integer.parseInt("01111100111111001111110011111100", 2);
//      temp2 = temp2 | (round(pow(2,32))+1);
//      temp2 = temp2 ^ Integer.parseInt(binary((round(pow(2,32))+0)),2 );
//      temp = c | temp2;

      pic[y][x] = temp;
  }
}
if(count==1){
  print("No change:"+binary(pic[0][0]) + "\n");
  print("\t"+binary((round(pow(2,32))+0))+"\n");
  print("\t"+binary(temp));
  
//  print("Anding: \t"+binary((round(pow(2,5)) ^ round(pow(2,32)))+1) + "\n");
//  print("Oring: \t"+binary((round(pow(2,5))-1)) + "\n");
//  print(round(pow(2,5)) + "\n");
//  print(img.height * img.width);
//  for(int i = 0; i < hiddenString.length(); i++){
//    print(hiddenString.charAt(i));
//  }
//  for(int i = 0; i < hiddenString.length(); i++){
//    print(binary(hiddenString.charAt(i))+"\n");
//  }

}

//Somewhere here I need to encode the message
String binaryString = "";
  for(int i = 0; i < hiddenString.length(); i++){
    binaryString += (binary(hiddenString.charAt(i)));
  }
  //this is the end of message char, so the decoder knows when to stop
  binaryString += binary(round(pow(2,32)-1));

//  print(binaryString.substring(0, 4));
  int count2 = 0;


      
  for(int x = 0; x < img.width-5; x += 1){
    for(int y = 0; y < img.height-5; y += 1){
  
      if(count2<binaryString.length()){
      temp = pic[y][x];
      temp = (temp & (round(pow(2,4)) ^ round(pow(2,32)))+1);
//      print("\n"+binary(temp));
      temp = temp | (round(pow(2,32))+1);
//      print("\n"+binary(temp));
      temp = temp | Integer.parseInt(binaryString.substring(count2, count2+4), 2);
      
      pic[y][x] = temp; 
      
//      print("\n"+binary(temp));
//      print("\n"+binaryString.length());  
      count2 += 4;
      
      }
    }
  }
  
  //I forgot I needed an end of line char...I have decided to make it 2**16-1
  
    Scanner keyboard = new Scanner(System.in);
  //by now the picture should be encoded, now I will try to take message out of it
  String newBinaryString = "";
  
//  String tempStr = binary(pic[0][0]);
//  tempStr = tempStr.substring(tempStr.length()-4,tempStr.length());
//  print("\n\n");
//  print(tempStr);
      
boolean finished = false;
int count3 = 0;
//print(binaryString+"\n");
  for(int x = 0; x < img.width-5; x += 1){
    for(int y = 0; y < img.height-5; y += 1){
      if(!finished && count3 < 300){
        String tempStr = binary(pic[y][x]);
        tempStr = tempStr.substring(tempStr.length()-4,tempStr.length());
        newBinaryString += tempStr;
//        count3 += 1;
//        print(tempStr);
        if(tempStr.equalsIgnoreCase("1111")){
//            print(++count3 + "\n");
              ++count3;
//            print(newBinaryString + "\n");
        } else {
         count3 = 0; 
        }
        if(count3 >= 3){
         finished = true; 
        }
            
        if(newBinaryString.length()>=16 && newBinaryString.substring(newBinaryString.length()-16,newBinaryString.length())==
          "111111111111111"){
            finished = true;
        }
      }
    }
  }
  //end (for loops)
//  print("here!");
//  print(newBinaryString);
  

}
count += .01;


 
}
float count = 1;
boolean first = true;
void draw(){
if(first){
  first = false;
//This section will be for output the final picture
for(int x = 0; x < img.width; x += pixelSize){
  for(int y = 0; y < img.height; y += pixelSize){
//    temp = (pic[y][x]-min)*(round(pow(2,31))/(max-min));
    temp = pic[y][x];
    fill(color(temp));
    rect(x,y, pixelSize, pixelSize); 
  }
}

}

}
