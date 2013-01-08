class sound{
  AudioPlayer audioPlayer1 = minim.loadFile("1.wav");
  void output(int[] inArr){
    if(inArr.length != 0){
      audioPlayer1.play();
    }
  }
  void close(){
    //for(int i = 0;i<player.length;i++);
      //player[i].close();
  }
}
