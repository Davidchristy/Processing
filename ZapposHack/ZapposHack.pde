import java.nio.*;
PImage img;
void setup() {
  size(320,240);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("/home/david/temp/zappos/uofa_challenge.bmp");

  ByteBuffer byteBuffer = ByteBuffer.allocate(img.width * img.height * 4);        
        IntBuffer intBuffer = byteBuffer.asIntBuffer();
        intBuffer.put(img.pixels);

        byte[] array = byteBuffer.array();
        byte[] str = new byte[img.width * img.height * 4];
      
        int k = 1;
        for (int i=0; i < img.width * img.height * 4; i++)
        {
          str[i] = (byte)(array[i]|k);
            print((byte)(array[i]|k));
        }
        print((byte)(array[0]|k));
//        print(str);

  

}

