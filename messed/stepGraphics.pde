class stepGraphics{
  void softGlow(float xPos, float yPos, int glowWidth, int glowHeight, color glowColour, int glowOpacity) {
    // create a new graphics object to store the glow effect
    size(glowWidth,glowHeight);
    PGraphics pg = createGraphics(glowWidth, glowHeight, P2D);
    pg.beginDraw();
    pg.background(glowColour, 0);
    pg.noStroke();
    // draw a white ellipse and apply a blur filter to imitate the glow of the light
    pg.fill(255, glowOpacity);
    pg.rect(pg.width/2, pg.height/2, pg.width*0.5, pg.height*0.3);
    pg.filter(BLUR, 5);
    pg.endDraw();
    pushStyle();
    // draw the graphic to the main canvas, centred at the coordinates specified
    image(pg, xPos, yPos);
    popStyle();
  }
}
