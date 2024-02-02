class Button
{
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color Colour;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;
  
  // Constructor to create button
  
  Button()
  {
    Pos.x = 100;
    Pos.y = 200;
    Width = 300;
    Height = 400;
    //Colour = color(r,g,b);
    //Text = t;
  }
  void update() //must be placed in void draw() to work
  {
      if(mousePressed == true && mouseButton == LEFT && Pressed == false)
      {
         Pressed = true;
         if(mouseX >= Pos.x && mouseX <= Pos.x+Width && mouseY >= Pos.y && mouseY <= Pos.y+Height)
         {
            Clicked = true;
         }
      } else
      {
        Clicked = false;
        Pressed = false;
      }
  }

  boolean isClicked() // Use this in a if statement to check of the button has been clicked
  {
     return Clicked; 
  }
}
