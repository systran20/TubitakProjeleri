// Example by Tom Igoe
// ömer ermiş 15.11.2019
 
import processing.serial.*; 
 
Serial myPort;    // The serial port
String inString;  // Input string from serial port
int lf = 10;      // ASCII linefeed 
int uzunluk=0;
int intVeri=0;

//butonların temsili konumu 1
int[] b={1,1,1,1,1,1};

int yukseklik=40;    //buton dikdörtgen yüksekliği 
int genislik=80;    //buton dikdörtgen genisliği
int offset=18;      //
int bosluk=18;      //

color[] renk={
  color(255,0,0),  //red
  color(0,255,0),  //green
  color(0,0,255),  //blue
  color(255,255,0),//
  color(0,255,255),//
  color(255,0,255) //
};

void setup() { 
  size(600,400);
  //fullScreen();
  frameRate(60);
  textSize(22);   
  // List all the available serial ports: 
  printArray(Serial.list()); 
  // I know that the first port in the serial list on my mac 
  // is always my  Keyspan adaptor, so I open Serial.list()[0]. 
  // Open whatever port is the one you're using. 
  myPort = new Serial(this, Serial.list()[1], 9600); 
  myPort.bufferUntil(lf);
  rectMode(CORNER);
  
} 
 
void draw() { 
  background(0);
  noFill();
  noStroke();  
  text("<--GELEN VERİ-->",10,25);
  text("(String): " + inString, 10,50);  
  text("Uzunluk:" + uzunluk, 10,75);
  text("(İnt):" + intVeri, 10,100);
    
  text("<--Buton Durumları-->",290,25);
  for(int i=0;i<6;i++) {
    text("Butonx "+ i + " " + b[i],360,50+(i*15));
    int startX=i*bosluk+genislik*i+offset;
    int startY=350;
    if (b[i]==0) {      
      text("Renk:" + i + " "+ renk[i],290,180+(i*20));
      fill(renk[i]);
      rect(startX , startY , genislik, yukseklik);
    }
    else {
      noFill();
      stroke(renk[i]);
      rect(startX , startY , genislik, yukseklik);
      noStroke();
      
    }        
    fill(255);
  }   
  
} 
 
void serialEvent(Serial p) {
  
  //TRIM karakter gelen verideki \n yani LF ifadesini temizler
  inString = trim(p.readString());  
  uzunluk=inString.length();
  intVeri=int(inString);
  for (int i=0;i<6; i++) {
    float kuvvet=pow(2,i);
    b[i]=(intVeri & int(kuvvet)) >> i;
    
  }  
  
}
