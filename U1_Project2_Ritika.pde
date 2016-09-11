/*
Name: Ellipses Art (version 2)

Description: This program is where after the first 2 circles collide, that creates 2
more circles, and it also creates a flashing background. When the second two circles 
that were made, collide together, then it creates 2 more circles, and those colors 
add to the flashing background. This keeps continuing. Every collision of the 2 new
circles, creates 2 more circles and adds different colors to the background.

*/

//These are my x and y coordinate arrays for the circles
float x1 [];
float y1 [];
float x2 [];
float y2 [];

//These are my x and y speed arrays for the circles
float x1Direction [];
float y1Direction [];
float x2Direction [];
float y2Direction [];

//Width and height of the circles which collide
float w = 50;
float h = 50;

//Boolean arrays
//background = flashing circles in background
boolean background [];
//circle = draws 2 more circles
boolean circle [];

//Tells me how many circles can be displayed
int currentCirclesShowing = 2;

void setup()
{
//size of the screen
  fullScreen ();

//index for arrays
  x1 = new float[1000];
  y1 = new float[1000];
  x2 = new float[1000];
  y2 = new float[1000];
  x1Direction = new float[1000];
  y1Direction = new float[1000];
  x2Direction = new float[1000];
  y2Direction = new float[1000];
  background = new boolean[1000];
  circle = new boolean[1000];

//for loop for when i is less than 1000
  for(int i=0; i < 1000; i++)
  {
//assigning the arrays
    x1 [i] = (100);
    y2 [i] = (100);
    x2 [i] = (1150);
    y2 [i] = (700);
    x1Direction [i] = 4;
    y1Direction [i] = 4;
    x2Direction [i] = 4;
    y2Direction [i] = 4;    
    background [i] = false;
    circle [i] = false;
  }
}

void draw()
{
//The next 2 lines link to my other voids, so that they draw
  dist ();
  Boundaries ();

//The color of my background
  background (100,36,76);

//for loop for when i is less than the number of circles visible on the screen
  for(int i=0; i<currentCirclesShowing; i++)
  {
//draw two circles. 1 black and 1 white
    noStroke();
    fill (225);
    ellipse (x1[i],y1[i],w,h);

    fill (0);
    ellipse (x2[i],y2[i],w,h);

//speed of both circles
    x1[i] = x1[i] + x1Direction[i];
    y1[i] = y1[i] + y1Direction[i];
  
    x2[i] = x2[i] + x2Direction[i];
    y2[i] = y2[i] + y2Direction[i];

//What happens when two circles collide
    if (dist (x1[i],y1[i],x2[i],y2[i]) < 50)
    {
//making them true which will run the code below
      background[i] = true;
      circle[i] = true;
//every time two circles collide, show 2 more circles from the array of circles
      currentCirclesShowing = currentCirclesShowing + 2;
    }

//Draws 2 new circles 
    if (circle[i]==true)
    {
      fill (54,205,245);
      ellipse(x1[i],y1[i],50,50);
      fill (247,72,166);
      ellipse(x2[i],y2[i],50,50);
    }

//When the background statement is true, continuously draw 2 circles at random locations
    if (background[i]==true)
    {
      fill(255);
      ellipse(random(width),random(height),random(30,50),random(30,50));
      fill(0);
      ellipse(random(width),random(height),random(30,50),random(30,50));
    }
  }
}

//Makes sure that none of the circles go off of the screen
void Boundaries ()
{
//for loop for when i is less than the number of circles shown
  for(int i=0; i<currentCirclesShowing; i++)
  {
//When the x position of the circle is off the screen to the right, the speed will become negative making it go backwards
    if (x1[i] > width)
    {
//Makes it go left
      x1Direction[i] = x1Direction[i] * -1;
    }
//When the x position of the circle is off the screen to the left, the speed will become positive making it go forwards   
    if (x1[i] <= 0)
    {
//Makes the speed 12
      x1Direction[i] = 12;
    }

//When the y position of the circle is off the screen to the bottom, the speed will become positive making it go up
    if (y1[i] > height)
    {
//Makes it go up
      y1Direction[i] = y1Direction[i] * -1;
    }

//When the y position of the circle is off the screen to the top, the speed will become positive making it go down
    if (y1[i] <= 0)
    {
//Makes the speed 6
      y1Direction[i] = 6;
    }
    
//When the x position of the circle is off the screen to the right, the speed will become negative making it go backwards
    if (x2[i] > width)
    {
//Makes it go left
      x2Direction[i] = x2Direction[i] * -1;
    }
//When the x position of the circle is off the screen to the left, the speed will become positive making it go forwards   
    if (x2[i] <= 0)
    {
//Makes the speed 12
      x2Direction[i] = 12;
    }

//When the y position of the circle is off the screen to the bottom, the speed will become positive making it go up
    if (y2[i] > height)
    {
//Makes it go up
      y2Direction[i] = y2Direction[i] * -1;
    }

//When the y position of the circle is off the screen to the top, the speed will become positive making it go down
    if (y2[i] <= 0)
    {
//Makes the speed 6
      y2Direction[i] = 6;
    }
  }
}

//Collisions
void dist ()
{
//for loop for when i is less than the number of circles drawn
  for(int i=0; i<currentCirclesShowing; i++)
  {
//If two circles collide
    if (dist (x1[i],y1[i],x2[i],y2[i]) < 50)
    {
//Make them both repel away
      x1Direction[i] = x1Direction[i] * -1;
      y1Direction[i] = y1Direction[i] * -1; 
      x2Direction[i] = x2Direction[i] * -1;
      y2Direction[i] = y2Direction[i] * -1;      
    }
  }
}