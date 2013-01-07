class matrix{
  int ypos;
  int xpos;
  int h;
  int w;
  int trackHeight;
  int margin;
  int beatNo;
  track[] trackset;
  beatIndicator beatTracker;
  
  matrix(int trackCount, int beatCount, int warg, int harg, int xposarg, int yposarg, int marginarg){
    ypos = yposarg;
    xpos = xposarg;
    h = harg;
    w = warg;
    beatNo = beatCount;
    margin = marginarg;
    trackset = new track[trackCount];
    for(int i = 0;i<trackCount;i++){
      trackset[i]= new track(beatCount);
    }
    trackHeight = (h-((trackCount-1)*margin))/trackCount;
    int yposTrack = ypos;
    for(int i = 0;i<trackset.length;i++){
      trackset[i].setDrawVars(xpos,yposTrack,margin,w,trackHeight);
      yposTrack += trackHeight + margin;
    }
  }
  
  int[][] matrixArray(){
    int[][] m = new int[0][0];
    for(int i = 0; i < beatNo;i++){
      m = (int[][])append(m,this.beat(i));
      println(this.beat(i));
    }
    return m;
  }
  
  void drawMatrix(){
    for(int i=0;i<trackset.length;i++){
      trackset[i].drawTrack();
    }
  }
  
  void click(int mousexPos, int mouseyPos){
    if(mouseyPos>=ypos && mouseyPos <= ypos + h){
      trackset[mouseyPos/(trackHeight+margin)].click(mousexPos);
    }
  }
  int[] beat(int b){
    int[] retArr = new int[0];
    for(int i = 0;i<trackset.length;i++){
      if(trackset[i].retValForBeat(b)==true){
        retArr = append(retArr, i);
      }
    }
    return retArr;
  }
  void setBeat(int track, int beat){
    trackset[track].setPosVal(beat+1,true);
  }
  void init(){
    for(int i = 0; i < beatNo; i++){
      for(int j = 1; j <= trackset[i].buttonCount; j++){
        trackset[i].setPosVal(j,false);
      }
    }
  }
}
