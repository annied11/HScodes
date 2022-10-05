int centerX = 25;

void setup()
{
  centerX = 25;//25 is centerx
  
  size(500,500);
  background(255);
  
}

void draw()//just keep doing, return to first line of 'draw'
{
   background(255);//white backgrounds
  
   fill(255);
   circle(mouseX,mouseY, 50);
   line(pmouseX,pmouseY,mouseX,mouseY);//all lines exsits as long as u draw(if theres no circle above)
}

//clears when mouth pressed
void mousePressed()
{
  background(255);//if only line commands is there, no circle commands)
}
