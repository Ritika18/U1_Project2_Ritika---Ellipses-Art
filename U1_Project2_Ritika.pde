/*


*/

//These are my x and y coordinates for my 2 circles
float x1 = 100;
float y1 = 100;
float x2 = 1150;
float y2 = 700;

//These are my x and y speeds for the 2 circles
float speedx1 = random(20);
float speedx2 = random(20);
float speedy1 = random(20);
float speedy2 = random(20);

//This is a true or false statement which creates a background with flashing circles
boolean background1 = false;
//This is a true or false statement which draws 2 more circles
boolean circle1 = false;

void setup()
{
//size of the screen
  fullScreen ();
}

void draw()
{
//The next 2 lines link to my other voids, so that they draw
  dist ();
  Boundaries ();

//The color of my background
  background (100,36,76);
  
//A white circle 
  fill (225);
  ellipse (x1,y1,50,50);
  
//The speed of my first circle
  x1 = x1 + speedx1;
  y1 = y1 + speedy1;

//A black circle
  fill (0);
  ellipse (x2,y2,50,50);

//The speed of my second circle
  x2 = x2 + speedx2;
  y2 = y2 + speedy2;
  
//If they collide then the circle statement is true
  if (dist (x1,y1,x2,y2) < 50)
  {
//This will run both booleans once the first 2 circles collide
    background1 = true;
    circle1 = true;
  }
  
//Creates 2 new circles
  if (circle1==true)
  {
    fill (54,205,245);
    ellipse(100,100,50,50);
    fill (247,72,166);
    ellipse(150,100,50,50);
  }

//When the background statement is true, draw 2 circles
  if (background1==true)
  {
//These 2 circles will keep popping up in the background, it will keep reading until circle = false    
    fill(0);
    ellipse(random(width),random(height),50,50);
    fill(225);
    ellipse(random(width),random(height),50,50);
  }
}

//Making sure that the 2 circles don't go off of the screen
void Boundaries ()
{
//When the x position of the circle is off the screen to the right, the speed will become negative making it go backwards
  if (x1 > width)
  {
    speedx1 = -speedx1;
  }
   
//When the x position of the circle is off the screen to the left, the speed will become positive making it go forwards
  if (x1 <= 0)
  {
//makes the speed faster
    speedx1 = 12;
  }

//When the y position of the circle is off the screen to the bottom, the speed will become negative making it go up 
  if (y1 > height)
  {
    speedy1 = -speedy1;
  }

//When the y position of the circle is off the screen to the top, the speed will become positive making it go down
  if (y1 <= 0)
  {
//makes the speed slower    
    speedy1 = 6;
  }

//The next 4 'if statements' are the same as the ones above. Just for the second circle  
  if (x2 > width)
  {
    speedx2 = -speedx2;
  }
  
  if (x2 < 0)
  {
//makes the speed faster
    speedx2 = 12;
  }
  
  if (y2 > height)
  {
    speedy2 = -speedy2;
  }
  
  if (y2 <= 0)
  {
 //makes the speed slower
    speedy2 = 6;
  }
}

//Collisions
void dist ()
{
//If the two circles collide
  if (dist (x1,y1,x2,y2) < 50)
  {
//Make them both go back in the direction they came from. Making it look like they repel   
    speedx1 = -speedx1;
    speedx2 = -speedx2;
  }
}