class button{
  int xpos;
  int ypos;
  int buttonHeight;
  int buttonWidth;
  boolean value;
  stepGraphics graphics = new stepGraphics();

  void setDrawVars(int xposarg, int yposarg, int buttonWidtharg, int buttonHeightarg){
    xpos = xposarg;
    ypos = yposarg;
    buttonWidth = buttonWidtharg;
    buttonHeight = buttonHeightarg;
    value = false;
  }

  void setValue(boolean val){
    value = val;
  }
  
  boolean getValue(){
    return value;
  }

  void toggleValue(){
    if(value == true){
      value = false;
    }
    else{
      value = true;
    }
  }
  
  void drawButton(){
    rect(xpos,ypos,buttonWidth,buttonHeight);
    if(value == true){
      // stepGraphics.softGlow(xpos,ypos,xpos+buttonWidth,ypos+buttonHeight,#FFCC00,1);
      line(xpos,ypos,xpos+buttonWidth,ypos+buttonHeight);
      line(xpos,ypos+buttonHeight,xpos+buttonWidth,ypos);
    }
  }
}
