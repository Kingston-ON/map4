class FPlayer extends FBox {
  
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(300, 0);
    setFillColor(red);
  }
  
  
  void act() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if(akey) setVelocity(-300, vy);
    if(dkey) setVelocity(300, vy);
    if(skey) setVelocity(vx, 300);
    if(wkey) setVelocity(vx, -300);
    if(akey && wkey) setVelocity(-300, -300);
    if(dkey && wkey) setVelocity(300, -300);
  }
  
}
