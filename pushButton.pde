class pushButton extends button{
  void pressed(){
    this.toggleValue();
    int time = millis();
    while(millis() < time + 50){
      
    }
    this.toggleValue();
  }
}
