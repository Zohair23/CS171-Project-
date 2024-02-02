class Button3
{
  PVector Pos3 = new PVector(0,0);
  float Width3 = 0;
  float Height3 = 0;
  color Colour3;
  String Text3;
  Boolean Pressed3 = false;
  Boolean Clicked3 = false;
  
  // Constructor to create button
  
  Button3()
  {
    Pos3.x = 800;
    Pos3.y = 200;
    Width3 = 300;
    Height3 = 400;
  }
  void update3() //must be placed in void draw() to work
  {
      if(mousePressed == true && mouseButton == LEFT && Pressed3 == false)
      {
         Pressed3 = true;
         if(mouseX >= Pos3.x && mouseX <= Pos3.x+Width3 && mouseY >= Pos3.y && mouseY <= Pos3.y+Height3)
         {
            Clicked3 = true;
         }
      } else
      {
        Clicked3 = false;
        Pressed3 = false;
      }
  }

  boolean isClicked3() // Use this in a if statement to check of the button has been clicked
  {
     return Clicked3; 
  }
}
