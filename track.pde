class track{
  button[] steps;
  boolean drawVarsSet = false;
  int xpos;
  int ypos;
  int margin;
  int trackHeight;
  int trackWidth;
  int buttonCount;
  int buttonWidth;
  
  track(int noSteps){
    steps = new button[noSteps];
    buttonCount = noSteps;
  }
  boolean getPosVal(int pos){
    return steps[pos - 1].getValue();
  }
  void setPosVal(int pos,boolean val){
    steps[pos - 1].setValue(val);
  }
  void setDrawVars(int posx, int posy,int marginArg,int trackWidthArg,int trackHeightArg){
    xpos = posx;
    ypos = posy;
    margin = marginArg;
    trackHeight = trackHeightArg;
    trackWidth = trackWidthArg;
    drawVarsSet = true;
    for(int i = 0;i<buttonCount;i++){
      steps[i]= new button();
    }
    buttonWidth = (trackWidth - ((buttonCount-1)*margin))/buttonCount;
    int xposButton = xpos;
    for(int i = 0; i<buttonCount;i++){
      steps[i].setDrawVars(xposButton,ypos,buttonWidth,trackHeight);
      xposButton += buttonWidth + margin;
    }
  }
  void drawTrack(){
    if(drawVarsSet){
      for(int i = 0;i<buttonCount;i++){
        steps[i].drawButton();
      }
    }
    else{
      println("Error: Draw variables for track");
    }
  }
  void click(int xposArg){
    if(xposArg>=xpos && xposArg <= xpos + trackWidth){
      steps[xposArg/(buttonWidth+margin)].toggleValue();
    }
  }
  boolean retValForBeat(int beat){
    return steps[beat].getValue();
  }
}
