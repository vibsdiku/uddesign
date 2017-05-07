boolean kp=false;

float r=10;
int total=200;
PVector[][] globe;
void setup(){
 size(800,800,P3D);
 globe=new PVector[total+1][total+1];
 noStroke(); 
 colorMode(HSB);
}

void draw(){
  background(0);
  lights();
  translate(width/2,height/2,mouseY);
  rotateY(frameCount*0.01);
  for(int i=0;i<total+1;i++){
      float lon=map(i,0,total,-2*PI,2*PI);
      for(int j=0;j<total+1;j++){
        float lat=map(j,0,total,-PI,PI);
        float x=r*lon*sin(lon*cos(lat));
        float y=r*lon*sin(lon*sin(lat));
        float z=r*lon*cos(lon*sin(lat));
        globe[i][j]=new PVector(x,y,z);
      }
        
  }
  
  for(int i=0;i<total;i++){
   beginShape(TRIANGLE_STRIP);
   
   for(int j=0;j<total+1;j++){
     float hu1=map(i,0,total,0,128*20);
     float hu2=map(j,0,total,129,255*30);
     fill(hu1%128,255,255);
     PVector v1=globe[i][j];
     vertex(v1.x,v1.y,v1.z);
     fill(hu2%255,255,255);
     PVector v2=globe[i+1][j];
     vertex(v2.x,v2.y,v2.z);
     
   }
   endShape(); 
  }
 
 
 if(kp){
    saveFrame("###ComplexGeo.jpg");
    exit();
  }
   
 }
 
 

void mousePressed(){
 if(mouseButton==LEFT) noLoop();
 if(mouseButton==RIGHT)loop();
  
}

void keyPressed(){
  if(keyCode==ENTER) 
      kp=true;
  else 
     kp=false;
}