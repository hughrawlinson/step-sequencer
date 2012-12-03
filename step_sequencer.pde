import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audioPlayer1;
AudioPlayer audioPlayer2;
AudioPlayer audioPlayer3;
AudioPlayer audioPlayer4;
AudioPlayer audioPlayer5;
AudioPlayer audioPlayer6;
AudioPlayer audioPlayer7;
AudioPlayer audioPlayer8;

matrix b = new matrix(8,8,550,550,10,10,10);
metro m = new metro(120,8);
beatIndicator bi = new beatIndicator(8,20,580,30,530,40);
//sound s = new sound();

int prevtick = 0;

void setup(){
  frameRate(100);
  minim = new Minim(this);
  size(570,640);
  smooth();
  audioPlayer1 = minim.loadFile("1.wav");
  audioPlayer2 = minim.loadFile("2.wav");
  audioPlayer3 = minim.loadFile("3.wav");
  audioPlayer4 = minim.loadFile("4.wav");
  audioPlayer5 = minim.loadFile("5.wav");
  audioPlayer6 = minim.loadFile("6.wav");
  audioPlayer7 = minim.loadFile("7.wav");
  audioPlayer8 = minim.loadFile("8.wav");
}

void draw(){
  b.drawMatrix();
  bi.drawBeatIndicator();
  if(m.tick() > prevtick){
    prevtick = m.tick();
    for(int i = 0;i<b.beat(m.tick()%8).length;i++){
      if(b.beat(m.tick()%8)[i] == 0){
        audioPlayer1.pause();
        audioPlayer1.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 1){
        audioPlayer2.pause();
        audioPlayer2.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 2){
        audioPlayer3.pause();
        audioPlayer3.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 3){
        audioPlayer4.pause();
        audioPlayer4.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 4){
        audioPlayer5.pause();
        audioPlayer5.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 5){
        audioPlayer6.pause();
        audioPlayer6.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 6){
        audioPlayer7.pause();
        audioPlayer7.play(0);
      }
      else if(b.beat(m.tick()%8)[i] == 7){
        audioPlayer8.pause();
        audioPlayer8.play(0);
      }
    }
    //s.output(b.beat(m.tick()%8));
    println(b.beat(m.tick()%8));
    bi.setBeat(m.tick()%8);
  }
}
void mouseClicked(){
  b.click(mouseX,mouseY);
}
void stop(){

  //s.close();
  minim.stop();
  super.stop();
}
