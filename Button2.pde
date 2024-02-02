class Button2
{
  PVector Pos2 = new PVector(0,0);
  float Width2 = 0;
  float Height2 = 0;
  color Colour2;
  String Text2;
  Boolean Pressed2 = false;
  Boolean Clicked2 = false;
  
  // Constructor to create button
  
  Button2()
  {
    Pos2.x = 450;
    Pos2.y = 200;
    Width2 = 300;
    Height2 = 400;
  }
  void update2() //must be placed in void draw() to work
  {
      if(mousePressed == true && mouseButton == LEFT && Pressed2 == false)
      {
         Pressed2 = true;
         if(mouseX >= Pos2.x && mouseX <= Pos2.x+Width2 && mouseY >= Pos2.y && mouseY <= Pos2.y+Height2)
         {
            Clicked2 = true;
         }
      } else
      {
        Clicked2 = false;
        Pressed2 = false;
      }
  }

  boolean isClicked2() // Use this in a if statement to check of the button has been clicked
  {
     return Clicked2; 
  }
}
