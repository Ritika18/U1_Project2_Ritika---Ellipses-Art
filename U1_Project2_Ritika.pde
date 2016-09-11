/*


*/

//These are my x and y coordinates for my 2 circles
float x1 = 20;
float y1 = 300;
float x2 = 680;
float y2 = 300;

//These are my x and y speeds for the 2 circles
float speedx1 = 9;
float speedx2 = -9;
float speedy1 = 9;
float speedy2 = -9;

void setup()
{
//size of the screen
  size (700,650);
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