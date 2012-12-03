class beatIndicator{
  button[] steps;
  int xpos;
  int ypos;
  int margin;
  int trackHeight;
  int trackWidth;
  int buttonCount;
  int buttonWidth;
  boolean setBeatCalledPreviously = false;
  
  beatIndicator(int buttonCount, int posx, int posy,int marginArg,int trackWidthArg,int trackHeightArg){
    steps = new button[buttonCount];
    xpos = posx;
    ypos = posy;
    margin = marginArg;
    trackHeight = trackHeightArg;
    trackWidth = trackWidthArg;
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
  
  void setBeat(int i){
    for(int n = 0;n<steps.length;n++){
      steps[n].setValue(false);
    }
    steps[i].toggleValue();
  }
  
  void drawBeatIndicator(){
    for(int i = 0;i<steps.length;i++){
      steps[i].drawButton();
    }
  }
}
