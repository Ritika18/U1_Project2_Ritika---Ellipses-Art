/*
Name: Ellipses Art

Description: This program is where after the first 2 circles collide, that creates 2
more circles, and it also creates a flashing background. When the second two circles 
that were made, collide together, then it creates 2 more circles, and those colors 
add to the flashing background. This keeps continuing. Every collision of the 2 new
circles, creates 2 more circles and adds different colors to the background.

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
float x7 = 100;
float y7 = 100;
float x8 = 1150;
float y8 = 700;

//These are my x and y speeds for the circles
float speedx1 = 14;
float speedy1 = 13;
float speedx2 = 13;
float speedy2 = 13;
float speedx3 = 13;
float speedy3 = 13;
float speedx4 = 14;
float speedy4 = 13;
float speedx5 = 14;
float speedy5 = 13;
float speedx6 = 13;
float speedy6 = 13;

//This is a true or false statement which creates a background with flashing circles
boolean background1 = false;
boolean background2 = false;
boolean background3 = false;

//This is a true or false statement which draws 2 more circles
boolean circle1 = false;
boolean circle2 = false;
boolean circle3 = false;

//This is so that the circles can move
boolean movement1 = false;
boolean movement2 = false;
boolean movement3 = false;

//This statement is to move the background to void setup at the end so there is no background erasing the circles
boolean end = true;

void setup()
{
//size of the screen
  fullScreen ();

//When this is false, the background will be drawn in void setup, so all of the circles will be shown
  if(end==false)
  {
    background(100,36,76);
  }
}

void draw()
{
//The next 2 lines link to my other voids, so that they draw
  dist ();
  Boundaries ();
  
//Until the end, the background will be drawn in void draw erasing all of the previous circles
  if(end==true)
  {
//The color of my background    
    background (100,36,76);
  }
  
//A white circle 
  noStroke();
  fill (225);
  ellipse (x1,y1,50,50);

//A black circle
  fill (0);
  ellipse (x2,y2,50,50);
  
//The speed of my first circle (white)
  x1 = x1 + speedx1;
  y1 = y1 + speedy1;
  
//The speed of my second circle (black)
  x2 = x2 + speedx2;
  y2 = y2 + speedy2;
  
//What happens when the first and second circle collide (white and black)
  if (dist (x1,y1,x2,y2) < 50)
  {
//This will run all these booleans once the first white and black collide
    background1 = true;
    circle1 = true;
    movement1 = true;
  }
  
//Creates 2 new circles
  if (circle1==true)
  {
    fill (54,205,245);
    ellipse(x3,y3,50,50);
    fill (247,72,166);
    ellipse(x4,y4,50,50);
  }

//When the background statement is true, continuously draw 2 circles at random locations
  if (background1==true)
  {
//These 2 circles will keep popping up in the background (random locations), it will keep reading until circle = false    
    fill(0);
    ellipse(random(width),random(height),random(30,50),random(30,50));
    fill(225);
    ellipse(random(width),random(height),random(30,50),random(30,50));
  }

//Enables circles 3 and 4 to move  
  if(movement1 == true)
  {
//The speed of my third circle (blue)
    x3 = x3 + speedx3;
    y3 = y3 + speedy3;

//The speed of my fourth circle (pink)
    x4 = x4 + speedx4;
    y4 = y4 + speedy4;
  }
  
//What happens when the third and fourth circle collide (blue and pink)
  if (dist (x3,y3,x4,y4) < 50)
  {
//This will run all these booleans once the first 2 circles collide
    background2 = true;
    circle2 = true;
    movement2 = true;
  }
  
//Creates 2 new circles
  if (circle2==true)
  {
    fill (247,181,72);
    ellipse(x5,y5,50,50);
    fill (76,229,110);
    ellipse(x6,y6,50,50);
  }

//When the background statement is true, continuously draw 2 circles at random locations
  if (background2==true)
  {
//These 2 circles will keep popping up in the background, it will keep reading until circle = false    
    fill(247,72,166);
    ellipse(random(width),random(height),random(30,50),random(30,50));
    fill(54,205,245);
    ellipse(random(width),random(height),random(30,50),random(30,50));
  }
  
  if (movement2==true)
  {
//The speed of my fifth circle (orange)
    x5 = x5 + speedx5;
    y5 = y5 + speedy5;

//The speed of my sixth circle (green)
    x6 = x6 + speedx6;
    y6 = y6 + speedy6;
  }
//What happens when the fifth and sixth circle collide (orange and green)
  if (dist (x5,y5,x6,y6) < 50)
  {
//This will run all these booleans once the first 2 circles collide
    background3 = true;
    circle3 = true;
    movement3 = true;
    end = false;
  }
  
//Creates 2 new circles
  if (circle3==true)
  {
    fill (8,8,8);
    ellipse(x7,y7,50,50);
    fill (247,247,247);
    ellipse(x8,y8,50,50);
  }

//When the background statement is true, continuously draw 2 circles at random locations
  if (background3==true)
  {
//These 2 circles will keep popping up in the background, it will keep reading until circle = false    
    fill(247,181,72);
    ellipse(random(width),random(height),random(30,50),random(30,50));
    fill(76,229,110);
    ellipse(random(width),random(height),random(30,50),random(30,50));
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
//changes speed
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
//changes speed    
    speedy1 = 6;
  }

//The next 4 'if statements' are the same as the ones above. Just for the second circle  
  if (x2 > width)
  {
    speedx2 = -speedx2;
  }
  
  if (x2 < 0)
  {
//changes speed
    speedx2 = 12;
  }
  
  if (y2 > height)
  {
    speedy2 = -speedy2;
  }
  
  if (y2 <= 0)
  {
//changes speed
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
//changes speed
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
//changes speed    
    speedy3 = 6;
  }

//The next 4 'if statements' are the same as the ones above. Just for the second circle  
  if (x4 > width)
  {
    speedx4 = -speedx4;
  }
  
  if (x4 < 0)
  {
//changes speed
    speedx4 = 12;
  }
  
  if (y4 > height)
  {
    speedy4 = -speedy4;
  }
  
  if (y4 <= 0)
  {
//changes speed
    speedy4 = 6;
  }

//When the x position of the circle is off the screen to the right, the speed will become negative making it go backwards
  if (x5 > width)
  {
    speedx5 = -speedx5;
  }
   
//When the x position of the circle is off the screen to the left, the speed will become positive making it go forwards
  if (x5 <= 0)
  {
//changes speed
    speedx5 = 12;
  }

//When the y position of the circle is off the screen to the bottom, the speed will become negative making it go up 
  if (y5 > height)
  {
    speedy5 = -speedy5;
  }

//When the y position of the circle is off the screen to the top, the speed will become positive making it go down
  if (y5 <= 0)
  {
//changes speed    
    speedy5 = 6;
  }

//The next 4 'if statements' are the same as the ones above. Just for the second circle  
  if (x6 > width)
  {
    speedx6 = -speedx6;
  }
  
  if (x6 < 0)
  {
//changes speed
    speedx6 = 12;
  }
  
  if (y6 > height)
  {
    speedy6 = -speedy6;
  }
  
  if (y6 <= 0)
  {
//changes speed
    speedy6 = 6;
  }
}

//Collisions
void dist ()
{
//If the two circles collide (white and black)
  if (dist (x1,y1,x2,y2) < 50)
  {
//Make them both go back in the direction they came from. Making it look like they repel   
    speedx1 = -speedx1;
    speedx2 = -speedx2; 
  }

//If these two circles collide (blue and pink)
  if (dist (x3,y3,x4,y4) < 50)
  {
//Make them both go back in the direction they came from. Making it look like they repel   
    speedx3 = -speedx3;
    speedx4 = -speedx4;
  }

//If these two circles collide (green and orange)
  if (dist (x5,y5,x6,y6) < 50)
  {
//Make them both go back in the direction they came from. Making it look like they repel   
    speedx5 = -speedx5;
    speedx6 = -speedx6;
  }
}