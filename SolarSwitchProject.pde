//initialise font variables
PFont fontsmall;
PFont fontbig;

//allow audio and initialise audio variable
import ddf.minim.*;

Minim minim;
AudioPlayer mySound;

// Initialise variables for images
PImage img1;
PImage img2;
PImage img3;
PImage treeimg;
PImage dollarimg;
PImage powerimg;
PImage panelimg;
PImage noareaimg;
PImage nopowerimg;

//Button Classes
Button resetButton;
Button2 resetButton2;
Button3  resetButton3;

//Initialise Solar Panel Information  
float userPanelPrice = 0; 
float userPanelArea = 0;
float userPanelPower = 0;

//Initialise the number of solar panels which can be installed(within a given area) and required
int myNumOfSolarP = 0;
int theirNumOfSolarP = 0;

//Initialise variable for estimated cost
int myEstimatedCost = 0;

//Initialise User Inputs
String userInput = "Type input: ";
String userInput2 = " ";

float userPowerToCalculate = 0; //IN KW PER DAY
int userAreaToCalculate = 0; //IN M^2

char myChar = ' ';

//Initialise variables for visualisation of area 
int myDisplayArea = 0;
boolean inBox = false;

//Initialise insufficient variables
int powerProduced = 0;
float spaceNeeded = 0.00;

//Initialise variable used to switch between stages
String myStage;

void setup()
{
  size(1200,800); //size of canvas
  
  //load audio and loop audio
  minim = new Minim(this);
  mySound = minim.loadFile("Bird_Watching.mp3");
  mySound.play();
  mySound.loop();
  
  myStage = "Stage 1"; //assign string to load string1()
  
  //assign variables to buttons
  resetButton = new Button();
  resetButton2 = new Button2();
  resetButton3 = new Button3();
  
  //load in images to be used
  img1 = loadImage("mySUNPOWER.png");
  img2 = loadImage("mySILFAB.png");
  img3 = loadImage("myQCELLS.png");
  treeimg = loadImage("freeTreeIconUse.png");
  dollarimg = loadImage("myDollarIcon.png");
  powerimg = loadImage("myPowerIcon.png");
  panelimg = loadImage("myPanelIcon.png");
  noareaimg = loadImage("myNoAreaIcon.png");
  nopowerimg = loadImage("myNoPowerIcon.png");
  
  //load font
  fontbig = loadFont("TwCenMT-CondensedExtraBold-48.vlw");
  fontsmall = loadFont("TwCenMT-Regular-48.vlw");
}

void draw()
{
  
  clearBackground(); //clear screen  between stages
  
  if(myStage == "Stage 1")
  {
    stage1(); //go to stage 1
  } else if (myStage == "Stage 2")
  {
    stage2(); //go to stage 2
  } else if (myStage == "Stage 3")
  {
    stage3(); //go to stage 3
  } else if (myStage == "No Power")
  {
    stageNoPower(); //go to stageNoPower
  } else if (myStage == "No Area")
  {
    stageNoArea(); //go to stageNoPower
  } else if (myStage == "reset")
  {  
    reset(); //go to reset (to reset variables)
  }
}

void stage1(){ 

  //text on top of front page
  fill(0);
  textSize(40);
  text("Select one",511,110);
  
  //display custom images
  image(img1,100,200);
  image(img2,450,200);
  image(img3,800,200);
  
  if(resetButton.isClicked()) //if button 1 is clicked
  {
    //assign corresponding variables
    userPanelPrice = 256.50;
    userPanelArea = 2.04;
    userPanelPower = 4.92;
    myStage = "Stage 2";
  }  
  resetButton.update();
  
  if(resetButton2.isClicked2()) //if button 2 is clicked
  {
    //assign corresponding variables
    userPanelPrice = 342.98;
    userPanelArea = 2.43;
    userPanelPower = 4.80;
    myStage = "Stage 2";
  }  
  resetButton2.update2();
  
  if(resetButton3.isClicked3()) //if button 3 is clicked
  {
    //assign corresponding variables
    userPanelPrice =  340.0;
    userPanelArea = 2.82;
    userPanelPower = 5.70;
    myStage = "Stage 2";
  }  
  resetButton3.update3();
}  

void stage2(){
  
  //background colour for stage 2
  fill(244,224,181);
  rect(0,-1,1200,801);
  
  //instructions...
  textFont(fontbig,42);
  fill(42,33,13);
  text("Input Rules:",510,80);
  
  textFont(fontsmall,30);
  text("-Numerical values only",470,130);
  text("-First the value for the power needed per day(to 1 or 2 decimal places)",230,170);
  text("should be inserted followed by a single comma and then the total area",238,200);
  text("(to the nearest whole number)",237,231);
  text("-Limit values for power needed -> 50000 (preferably)",230,270);
  text("-Limit values for available area -> 4400000",230,310);
  
  textFont(fontbig,42);
  text("Make sure:",510,400);
  
  textFont(fontsmall,30);
  text("-Available area is in metres squared",370,445);
  text("-Power needed per day(12hrs) is in kW (KiloWatt)",300,485);
  
  //text box for input (dark brown)
  fill(42,33,13);
  rect(205,560,800,120,20,20,20,20);
  
  fill(255,140,0);
  textSize(30);
  //user input
  text(userInput,270,625);
  myStage = "Stage 2"; //loop again until user is finished
}

void keyPressed()
{
  if (keyCode == ENTER){ //if enter is pressed
    for(int i = 13; i < userInput.length(); i++) //for loop to find the comma
    {
      myChar = userInput.charAt(i); //check each character
      if (myChar == ',') //if comma found
      {
        //split the string
        userInput2 = userInput.substring(i+1,userInput.length()); 
        userInput = userInput.substring(12,i);
      }
      
    }
    
    try {
      //assign first string to power needed from user and convert to float
      userPowerToCalculate = Float.valueOf(userInput); 
      //assign second string to available area and convert to integer
      userAreaToCalculate = Integer.valueOf(userInput2);
    } catch (NumberFormatException e) {
      
    }
    
    myStage = "Stage 3"; //go to stage 3
    
  } else {
    if (keyCode == BACKSPACE){ //if backspace is pressed, remove one character from the string
      if (userInput.length() > 0){
        userInput = userInput.substring(0,userInput.length()-1);
      }
    } else if (keyCode == DELETE) { //if delete is pressed, reset the user input
      userInput = "";
    } else if (keyCode != CONTROL && keyCode != SHIFT && keyCode != ALT) { //if either of these keys are not pressed
      userInput = userInput + key; //keep adding characters to the user input
    }
  }
  
}
  

void stage3(){ //main calculation stage
  
  //check if value for power needed is greater than minimum value(for 1 panel) 
  if (userPowerToCalculate > userPanelPower) 
  {
    //if greater...
    //calculate number of solar panels needed for that much power and add 1(cant use one part of a solar panel,only whole piece)
    myNumOfSolarP = (int)(userPowerToCalculate/userPanelPower)+1 ; 
    //calculate number of solar panels that can be installed in the area given(round down);
    theirNumOfSolarP = (int)(userAreaToCalculate/userPanelArea);
    
  } else
  {
    myStage = "No Power"; //else go to No Power stage
  }
  
  //visualise
  //if no. of panels needed for that much power is <= no. of panels that can be installed...then..
  if (myNumOfSolarP <= theirNumOfSolarP)
  {
    //draw line to split the statistics and area visualisation
    fill(0);
    strokeWeight(7);
    line(800,0,800,800);
    
    //background for area visualisation
    strokeWeight(1); //reset stroke weight
    fill(246,243,231);
    rect(0,0,800,800);
    
    fill(0,200,0); //area colour(green)
    myDisplayArea = (int)Math.sqrt(userAreaToCalculate); //take the square root of the area to evenly spread the area(square)
    //reduce area size if area too big
    if (myDisplayArea >= 700 && myDisplayArea <= 1400)
    {
      myDisplayArea = myDisplayArea/2;
    } else if (myDisplayArea <= 350 && myDisplayArea > 0)
    {
       myDisplayArea = myDisplayArea*2; 
    } else if (myDisplayArea > 1400 && myDisplayArea <= 1200000)
    {
      myDisplayArea = myDisplayArea/3;
    } else if (myDisplayArea > 350 && myDisplayArea < 700)
    {
      myDisplayArea = (int)Math.sqrt(userAreaToCalculate);
    } else  
    {
      myDisplayArea = 700;
    }
    
    //display trees around area visualisation
    image(treeimg,0,0);
    image(treeimg,0,50);
    image(treeimg,0,100);
    image(treeimg,0,150);
    image(treeimg,0,200);
    image(treeimg,0,250);
    image(treeimg,0,300);
    image(treeimg,0,350);
    image(treeimg,0,400);
    image(treeimg,0,450);
    image(treeimg,0,500);
    image(treeimg,0,550);
    image(treeimg,0,600);
    image(treeimg,0,650);
    image(treeimg,0,700);
    image(treeimg,0,750);
    image(treeimg,50,0);
    image(treeimg,100,0);
    image(treeimg,150,0);
    image(treeimg,200,0);
    image(treeimg,250,0);
    image(treeimg,300,0);
    image(treeimg,350,0);
    image(treeimg,400,0);
    image(treeimg,450,0);
    image(treeimg,500,0);
    image(treeimg,550,0);
    image(treeimg,600,0);
    image(treeimg,650,0);
    image(treeimg,700,0);
    image(treeimg,750,0);
    image(treeimg,750,50);
    image(treeimg,750,100);
    image(treeimg,750,150);
    image(treeimg,750,200);
    image(treeimg,750,250);
    image(treeimg,750,300);
    image(treeimg,750,350);
    image(treeimg,750,400);
    image(treeimg,750,450);
    image(treeimg,750,500);
    image(treeimg,750,550);
    image(treeimg,750,600);
    image(treeimg,750,650);
    image(treeimg,750,700);
    image(treeimg,750,750);
    image(treeimg,50,750);
    image(treeimg,100,750);
    image(treeimg,150,750);
    image(treeimg,200,750);
    image(treeimg,250,750);
    image(treeimg,300,750);
    image(treeimg,350,750);
    image(treeimg,400,750);
    image(treeimg,450,750);
    image(treeimg,500,750);
    image(treeimg,550,750);
    image(treeimg,600,750);
    image(treeimg,650,750);
    image(treeimg,700,750);
    
    //area visualisation
    rect(50,50,(float)myDisplayArea,(float)myDisplayArea);
    
    //background for statistics side
    fill(164,219,232);
    rect(800,0,400,800);
    
    //display statistics
    fill(0,51,102);
    textSize(50);
    text("Statistics: ",920,100); //heading
    
    image(dollarimg,950,130); //display dollar image
    
    myEstimatedCost = (int)(myNumOfSolarP*userPanelPrice)+1; //calculate cost and add one(estimate)
    
    powerProduced = (int)(myNumOfSolarP*userPanelPower)+1; //calculate power produced from panels and add one(estimate)
    
    //subheading
    textSize(30);
    text("Estimated cost: $"+myEstimatedCost,860,270);
    
    image(powerimg,950,290); //display power image
    
    //subheading
    text("Amount of power",860,449);
    text("producible(approx.): ",860,480);
    text(powerProduced+"kW",860,515);
    
    image(panelimg,945,545); //display panel image
    
    //subheading
    text("Number of solar",860,690);
    text("panels that can be",860,720);
    text("installed: "+myNumOfSolarP,860,750);
    
  } else
  {
    powerProduced = (int)(theirNumOfSolarP*userPanelPower)+1; //calculate power(approx.) that could be produced from panels and add one(estimate)
    //calculate more area needed by first calculating the area needed for that much power and subtracting area inputted,also add one(estimate)
    spaceNeeded = (int)((myNumOfSolarP*userPanelArea)-userAreaToCalculate)+1;
    myStage = "No Area"; //go to No Area stage
  }
  
}

void stageNoPower(){ //No Power stage
 
  mySound.pause(); //pause the audio
  
  //background
  fill(58,59,60);
  rect(0,0,1200,800);
  
  image(nopowerimg,300,110); //display no power image
  
  fill(255); //white text
  textSize(40); //text size
  text("Not enough power was inputted",368,630); //display text
}

void stageNoArea(){ //No Area Stage
  
  mySound.pause(); //pause the audio
  
  //background
  fill(58,59,60);
  rect(0,0,1200,800);
  
  image(noareaimg,445,40); //display no area image
  
  fill(255); //text colour
  textSize(40); //text size
  //display text(main message,producible power,more area needed)
  text("Not enough area available",400,600);
  text("Able to produce about: "+powerProduced+"kW",400,710);
  text("More area needed: "+(int)spaceNeeded+"m^2",400,655);
}

void reset() // reset all variables
{
  userPanelPrice = 0; 
  userPanelArea = 0;
  userPanelPower = 0;

  myNumOfSolarP = 0;
  theirNumOfSolarP = 0;

  userInput = "Type input: ";
  userInput2 = " ";

  userPowerToCalculate = 0;
  userAreaToCalculate = 0;

  myChar = ' ';

  myDisplayArea = 0;
  inBox = false;

  powerProduced = 0;
  spaceNeeded = 0.00;
  
}

void clearBackground(){ //clear background(white)(used between stages)
  fill(255);
  rect(0,0,1200,800);
}
