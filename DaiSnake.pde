//variables:
//intial values of each block of the snake
int[] snakeX={60,40,20,0};
int[] snakeY={400,400,400,400};
//snake size
int snakeSize=20; //20 pixels long, 20 pixels wide
//food positions
int foodX;
int foodY;
//score/count
int score=0;
//speed
int speed=snakeSize;


void setup(){
  size(800,800);
 
  foodX=int (random(0,width-snakeSize));//random value between..()
  foodY=int (random(0,height-snakeSize));//minus snakeSize ensure the food is always in the screen, not on the border
  background(100,255,50);
}

void draw(){
  //clear the old screen so that the snake is not infinitely long
  background(100,255,50);
  //draw snake
  fill(0);
  stroke(255);
  //for each item in the snake, draw a rect
  for(int i = 0; i<snakeX.length; i++){
  rect(snakeX[i],snakeY[i],snakeSize,snakeSize);
  }
  //draw food
  fill(255,0,0);
  stroke(255,0,0);
  rect(foodX,foodY,snakeSize,snakeSize);
  //pressing a certain key makes it move
  //start by javing all but the head bloock move to the next block's pos
  if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT){
    for(int i=snakeX.length-1; i>0; i--){
      snakeX[i] = snakeX[i-1];
      snakeY[i] = snakeY[i-1];
    }
   }
  //depending on which ket is pressed, move the head block in a given direction
  if (keyCode == UP){//does smth if UP key was pressed
   snakeY[0]-=speed;
  }
  if (keyCode == DOWN){//does smth if DOWN key was pressed
   snakeY[0]+=speed;
  }
  if (keyCode == LEFT){//does smth if LEFT key was pressed
   snakeX[0]-=speed;
  }
  if (keyCode == RIGHT){//does smth if RIGHT key was pressed
   snakeX[0]+=speed;
  }
}
  //when the snake touches the food:
  if(abs(snakeX[0]-foodX<snakeSize && abs(snakeY[0]-foodY)<snakeSize){//check snake's head if its overlapping food
    
    //snakeSize increase
    snakeX = expand(snakeX,snakeX.length+1);
    snakeY = expand(snakeY,snakeY.length+1);
    //after growing, make the new item the end of snake
    snakeX[snakeX.length -1]=snakeX[snakeX.length-2];
    snakeY[snakeY.length -1]=snakeY[snakeY.length-2];
    //score+1
    score ++;
    //foodX&foodY moves
    foodX=int (random(0,width-snakeSize));//random value between..()
    foodY=int (random(0,height-snakeSize));//minus snakeSize ensure the food is always in the screen, not on the border
}
  //end game if:
    //hits the wall
      //if it hits the left wall
      if(snakeX[0]<0){
        print();
        exit();
      }
      //if it hits the right wall
      if(snakeX[0]>width){
         exit();
      }
      //if it hits the upper wall
      if(snakeY[0]<0){
         exit();
      }
      //if it hits the bottom wall
      if(snakeY[0]>height){
         exit();
      }
    //OR hits itself
    //for each item in the snake(excp. head), check if head is overlapping
    for (int i=1; i<snakeX.length; i++){
      if(abs(snakeX[0]-snakeX[i])<snakeSize&&abs(snakeY[0]-snakeY[i])<snakeSize){
        exit();
      }
    }
    delay(500);//wait 50 milliseconds
}
