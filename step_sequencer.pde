import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import org.json.*;
import javax.swing.*;
import java.io.*;

Minim minim;
AudioPlayer audioPlayer1;
AudioPlayer audioPlayer2;
AudioPlayer audioPlayer3;
AudioPlayer audioPlayer4;
AudioPlayer audioPlayer5;
AudioPlayer audioPlayer6;
AudioPlayer audioPlayer7;
AudioPlayer audioPlayer8;
button startstoptoggle = new button();
pushButton initialise = new pushButton();

//Set tempo here; it cannot be changed later on.
int tempo = 90;
//Set ID of pattern to load on keypress of 'l'
int loadID = 75;

file f = new file();
matrix b = new matrix(8,8,550,550,10,10,10);
metro m = new metro(tempo,8);
beatIndicator bi = new beatIndicator(8,20,580,30,530,40);
//sound s = new sound();

int prevtick = 0;

void setup(){
  //frameRate(100);
  minim = new Minim(this);
  size(618,640);
  smooth();
  startstoptoggle.setDrawVars(578,10,20,20);
  initialise.setDrawVars(578,40,20,20);
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
  startstoptoggle.drawButton();
  b.drawMatrix();
  bi.drawBeatIndicator();
  if(startstoptoggle.getValue()){
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
    }
    //s.output(b.beat(m.tick()%8));
    bi.setBeat(m.tick()%8);
  }
}
void mouseClicked(){
  //startstoptoggle.setDrawVars(578,10,20,20);
  b.click(mouseX,mouseY);
  if(mouseX>578 && mouseX<598 && mouseY>10 && mouseY<30){
    startstoptoggle.toggleValue();
  }
  if(mouseX > initialise.xpos && mouseY > initialise.ypos && mouseX < initialise.xpos + initialise.buttonWidth && mouseY < initialise.ypos + initialise.buttonHeight){
    startstoptoggle.toggleValue();
    
  }
}
void keyPressed(){
  if (key==(char)'i'){
    b.init();
  }
  else if(key == (char)'l'){
    /*
    Again, having a problem with JOptionPane. It works in blank sketches, but not here or in file.pde
    To load a specific patch, please set the 'arg' variable in the source code before launching,
    then press 'l'.
    */
    JFrame frame = new JFrame("InputDialog Example #2");
    int arg = int(JOptionPane.showInputDialog(frame,"Enter Beat ID:"));
    //int arg = loadID;
    f.readFromWebsite(arg,b);
  }
  else if(key == (char)'s'){
    f.writeAndUpload(b.matrixArray());
  }
}
void stop(){

  //s.close();
  minim.stop();
  super.stop();
}
