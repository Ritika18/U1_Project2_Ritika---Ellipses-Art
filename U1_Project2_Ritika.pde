/*


*/

//These are my x and y coordinates for the circles
float x1 = 100;
float y1 = 100;
float x2 = 1150;
float y2 = 700;
float x3 = 100;
float y3 = 100;
float x4 = 1150;
float y4 = 700;
float x5 = 100;
float y5 = 100;
float x6 = 1150;
float y6 = 700;

//These are my x and y speeds for the circles
float speedx1 = random(20);
float speedy1 = random(20);
float speedx2 = random(20);
float speedy2 = random(20);
float speedx3 = random(20);
float speedy3 = random(20);
float speedx4 = random(20);
float speedy4 = random(20);

//This is a true or false statement which creates a background with flashing circles
boolean background1 = false;
boolean background2 = false;

//This is a true or false statement which draws 2 more circles
boolean circle1 = false;
boolean circle2 = false;

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
  Speed ();

//The color of my background
  background (100,36,76);
  
//A white circle 
  fill (225);
  ellipse (x1,y1,50,50);

//A black circle
  fill (0);
  ellipse (x2,y2,50,50);
  
//What happens when the first and second circle collide
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
    ellipse(x3,y3,50,50);
    fill (247,72,166);
    ellipse(x4,y4,50,50);
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
  
//What happens when the third and fourth circle collide
  if (dist (x3,y3,x4,y4) < 50)
  {
//This will run both booleans once the first 2 circles collide
    background2 = true;
    circle2 = true;
  }
  
//Creates 2 new circles
  if (circle2==true)
  {
    fill (247,181,72);
    ellipse(x5,y5,50,50);
    fill (72,247,106);
    ellipse(x6,y6,50,50);
  }

//When the background statement is true, draw 2 circles
  if (background2==true)
  {
//These 2 circles will keep popping up in the background, it will keep reading until circle = false    
    fill(247,72,166);
    ellipse(random(width),random(height),50,50);
    fill(54,205,245);
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
  
//When the x position of the circle is off the screen to the right, the speed will become negative making it go backwards
  if (x3 > width)
  {
    speedx3 = -speedx3;
  }
   
//When the x position of the circle is off the screen to the left, the speed will become positive making it go forwards
  if (x3 <= 0)
  {
//makes the speed faster
    speedx3 = 12;
  }

//When the y position of the circle is off the screen to the bottom, the speed will become negative making it go up 
  if (y3 > height)
  {
    speedy3 = -speedy3;
  }

//When the y position of the circle is off the screen to the top, the speed will become positive making it go down
  if (y3 <= 0)
  {
//makes the speed slower    
    speedy3 = 6;
  }

//The next 4 'if statements' are the same as the ones above. Just for the second circle  
  if (x4 > width)
  {
    speedx4 = -speedx4;
  }
  
  if (x4 < 0)
  {
//makes the speed faster
    speedx4 = 12;
  }
  
  if (y4 > height)
  {
    speedy4 = -speedy4;
  }
  
  if (y4 <= 0)
  {
 //makes the speed slower
    speedy4 = 6;
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
  
  if (dist (x3,y3,x4,y4) < 50)
  {
//Make them both go back in the direction they came from. Making it look like they repel   
    speedx3 = -speedx3;
    speedx4 = -speedx4;
  }
}

void Speed()
{
  //The speed of my first circle
  x1 = x1 + speedx1;
  y1 = y1 + speedy1;
  
//The speed of my second circle
  x2 = x2 + speedx2;
  y2 = y2 + speedy2;
  
//The speed of my third circle
  x3 = x3 + speedx3;
  y3 = y3 + speedy3;

//The speed of my fourth circle
  x4 = x4 + speedx4;
  y4 = y4 + speedy4;
}