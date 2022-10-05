int count = 0;
float numX = random(0,500);//between 0 and 500
float numY = random(0,550);
int score = 0;

void setup(){ 
  background(0,4,59);
  size(500,550);
  circle(numX,numY,60);
  while (count<6)
  {
    circle(random(0,500),random(0,550),60);
    count ++;
  }
}
   
void draw(){
  text("S C O R E : "+score,220,20);
  textSize(10);

}

//does this whenever mouth is pressed
void mousePressed(){
  //check if mouse is in the circle
  //if it is inside the object(circle)
  if(dist(numX,numY,mouseX,mouseY)<30){//dist(x,y,x,y),30 is the radius
     //clear the background
     background(0,4,59);
     
    //add a point to score
    score ++;
    
    //draw normal circles
    count = 0;//reset count or does not work
    while (count<6)
  {
    circle(random(0,500),random(0,550),60);
    count ++;
  }
  
    //draw new circles
    numX=random(0,500);
    numY=random(0,550);
    circle(numX,numY,60);
  }
  //if it's not in the circle, do nothing
}
