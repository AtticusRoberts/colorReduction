PImage img;
PImage trueImg;
int scale;
int percent;
void setup() {
  size(1123,500);
  scale=40;
  img = loadImage("jCole.jpg");
  trueImg = loadImage("jCole.jpg");
}
void draw() {
  background(255);
  percent=int(pow(scale+1,3));
  fill(0);
  textSize(50);
  text("available colors: "+percent,width/2-250,475);
  img.loadPixels();
  for (int x=0;x<img.width;x++) {
    for (int y=0;y<img.height;y++) {
      int index = x + y * img.width;
      color pix = trueImg.pixels[index];
      int r = round(scale * red(pix)/255) * (255/scale);
      int g = round(scale * green(pix)/255) * (255/scale);
      int b = round(scale * blue(pix)/255) * (255/scale);
      img.pixels[index]=color(r,g,b);
    }
  }
  img.updatePixels();
  image(trueImg,0,0);
  image(img,563,0);
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==DOWN && scale!=1) {
      scale-=1;
    }
    if (keyCode==UP && scale!=40) {
      scale+=1;
    }
  }
}
