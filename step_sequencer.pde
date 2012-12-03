import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audioPlayer1;
matrix b = new matrix(8,8,550,550,10,10,10);
metro m = new metro(120,8);
beatIndicator bi = new beatIndicator(8,20,580,30,530,40);
//sound s = new sound();

int prevtick = 0;

void setup(){
  minim = new Minim(this);
  size(570,640);
  smooth();
  audioPlayer1 = minim.loadFile("1.wav");
}

void draw(){
  b.drawMatrix();
  bi.drawBeatIndicator();
  if(m.tick() > prevtick){
    prevtick = m.tick();
    if(b.beat(m.tick()%8).length>0){
      audioPlayer1.play();
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
