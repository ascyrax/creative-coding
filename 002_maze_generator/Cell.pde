class Cell{
 int row,col;
 int x,y;
 int cellWidth,cellHeight;
 boolean[] walls={true,true,true,true}; // top right bottom left
 boolean visited=false;
 int r,g,b;
 boolean isCurrent= false;
 
 Cell(int i,int j, int cellWidth, int cellHeight){
   this.row=i;
   this.col=j;
   this.x = j*cellWidth;
   this.y = i*cellHeight;
   this.cellWidth=cellWidth;
   this.cellHeight=cellHeight;
   
   // color
   this.r = 50;
   this.g = 100;
   this.b = 100;
 }
 
 void render(){
   noStroke();
   if(this.isCurrent){
     this.r=75;
     this.g=222;
     this.b=23;
   }else if(this.visited){
     r=200;
     g=80;
     b=80;
   }
   
   fill(r,g,b);
   rect(x,y,cellWidth,cellHeight);
   
   this.drawWalls();
 }
 
 void drawWalls(){
  stroke(255); 
  for(int i=0;i<=3;i++){
   if(this.walls[i]){
     if(i==0) // top wall
       line(x,y,x+cellWidth,y);
     else if(i==1) // right wall
        line(x+cellWidth, y , x+cellWidth, y+cellHeight);
     else if(i==2)
       line(x,y+cellHeight, x+cellWidth, y+cellHeight);
      else if(i==3)
        line(x,y+cellHeight, x , y);
   }
  }
 }
}
