import controlP5.*;
//import gifAnimation.GifMaker;
import java.awt.*;

ControlP5 cp5;

String filenameA = null;
String filenameB = null;

void setup(){
  size(300,200);
  cp5 = new ControlP5(this);
  
  cp5.addButton("fileA")
    .setLabel("File A")
    .setPosition(50,50)
    .setSize(60,30);
    
  cp5.addButton("fileB")
    .setLabel("File B")
    .setPosition(120,50)
    .setSize(60,30);
    
  cp5.addButton("mergeFiles")
    .setLabel("Create")
    .setPosition(50,90)
    .setSize(130,30);
}

void draw(){
}

String getFilePath(){
  String sp = System.getProperty("file.separator");
  FileDialog fd = new FileDialog(frame);
  fd.setVisible(true);
  
  String dir = fd.getDirectory();
  String name = fd.getFile();
  if(name == null){
    return null;
  }else{
    return dir + sp + name;
  }
}

void fileA(){
  filenameA = getFilePath();
  println(filenameA);
}

void fileB(){
  filenameB = getFilePath();
  println(filenameB);
}

void createStereogram(){
  if(filenameA != null && filenameB != null){
    PImage imgA = loadImage(filenameA);
    PImage imgB = loadImage(filenameB);
    int w = imgA.width + imgB.width + imgA.width;
    int h = imgA.height;
    
    PGraphics pg = createGraphics(w,h);
    pg.beginDraw();
    pg.image(imgA,0,0);
    pg.image(imgB,imgA.width,0);
    pg.image(imgA,imgA.width + imgB.width,0);
    pg.save("stereogram.png");
    pg.endDraw();
    
    println("saved to stereogram.png (in sketch directory)");
  }
}

void mergeFiles(){
  createStereogram();
  //createPurupuru();
  exit();
}