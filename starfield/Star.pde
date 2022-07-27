class Star{
   float x,y,z;
   float sizeX,sizeY; 
   Star(){
    x=random(-width/2,width/2);
    y=random(-height/2,height/2);
    z=random(0,width);
    sizeX=5;
    sizeY=5;
   }
   
   void display(){
     noStroke();
     float sx=map(x/z,0,1,0,width);
     float sy=map(y/z,0,1,0,height);
     sizeX=map(z,0,width,10,1);
     sizeY=map(z,0,width,10,1);
     ellipse(sx,sy,sizeX,sizeY);
   }
   
   void update(){
     z-=speed;
     if(z<=0)z=width;
   } 

}
Star[] arrStars= new Star[1000];
float speed;
void setup(){
  //size(600,600);
  fullScreen();
  createStars();
  background(0);
}

void draw(){
  speed = map(mouseX,0,width,0,50);
  background(0);
  translate(width/2,height/2);
  updateStars();
  displayStars();
}

void createStars(){
   for(int i=0;i<arrStars.length;i++)
     arrStars[i]=new Star();
   return;
}


void updateStars(){
  for(int i=0;i<arrStars.length;i++){
    arrStars[i].update();
  }
}

void displayStars(){
  for(int i=0;i<arrStars.length;i++){
    arrStars[i].display();
  }
}
