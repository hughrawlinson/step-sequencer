class metro{
  int tempo;
  int prevTick;
  int beattime;
  int count;
  metro(int tempoarg,int divisions){
    tempo = tempoarg;
    beattime = ((60000/tempo)*4)/divisions;
    count = 0;
    prevtick = millis();
  }
  int beatID(){
    return 0;
  }
  int tick(){
    int time = millis();
    if(time>prevTick+beattime){
      count = count + 1;
      prevTick = time;
    }
    return count;
  }
}
