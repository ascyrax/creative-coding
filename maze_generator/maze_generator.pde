void setup(){
 size(1000,1000);
 frameRate(60);
 //fullScreen();
 cellWidth = width / nRows;
 cellHeight = height / nCols;

 createGrid();
}

void draw(){
  background(55);
  updateGrid1Step();
  displayGrid();
}


// maze generator
// ascyrax


int nRows=50,nCols=50;
int cellWidth, cellHeight;
Cell current;

ArrayList<ArrayList<Cell>>grid = new ArrayList<ArrayList<Cell>>();

void createGrid(){
  for(int i=0;i<nRows;i++){
    ArrayList<Cell>arr = new ArrayList<Cell>();
    for(int j=0;j<nCols;j++){
      arr.add(new Cell( i, j, cellWidth, cellHeight));
    }
    grid.add(arr);
  }
  current = grid.get(0).get(0);
  current.visited=true;
  current.isCurrent=true;
  stack.add(current);
}

ArrayList<Cell> stack = new ArrayList<Cell>();

void updateGrid1Step(){
  int[] perm = getRandomPerm(0,3);
  boolean neighFound=false;
  for(int i=0;i<=3;i++){
   int nextR = current.row + dx[perm[i]];
   int nextC = current.col + dy[perm[i]];
   //println(nextR , nextC);
   if(check(nextR,nextC)){
     //println("perm[i]: ", perm[i]);
     //println(nextR , nextC);
     neighFound = true;
     // break the wall between (row,col) & (x,y) 
     current.walls[perm[i]]=false;
     current.isCurrent=false;
     current=grid.get(nextR).get(nextC);
     current.walls[(perm[i]+2)%4]=false;
     current.visited=true;
     current.isCurrent=true;
     stack.add(current);
     break;
   }
  }
  if(!neighFound){
    current.isCurrent=false;
    if(stack.size()>1){
      stack.remove(stack.size()-1);
      current=stack.get(stack.size()-1);
      current.isCurrent=true;
    }else if(stack.size()==1){
      println("MAZE GENERATED.");
      noLoop();
    }
  }
  return;
}

int[] dx={-1,0,1,0}; // top right bottom left
int[] dy={0,1,0,-1};



boolean check(int x , int y){
   if(x<0 || x>nCols-1 || y<0 || y>nRows-1) 
     return false;
   else if(grid.get(x).get(y).visited==true)
     return false;
   else
    return true;
}

int[] getRandomPerm(int l, int r){
 int[] ans = new int[r-l+1];
 for(int i=l;i<=r;i++)ans[i-l]=i;
 for(int i=0;i<=100;i++){
  int a=parseInt(random(0,r-l+1));
  int b=parseInt(random(0,r-l+1));
  int temp=ans[a];
  ans[a]=ans[b];
  ans[b]=temp;
 }
 return ans;
}

void displayGrid(){
  for(int i=0;i<nRows;i++){
    for(int j=0;j<nCols;j++){
      grid.get(i).get(j).render();
    }
  }
}
