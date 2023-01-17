import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color green = #00FF00;
color red   = #FF0000;
color blue  = #0000FF;
color orange= #F0A000;
color brown = #996633;

color cyan  = #00FFFF;
color middleGreen = #00FF00;
color leftGreen = #009F00;
color rightGreen = #006F00;
color centerGreen = #004F00;
color treeTrunkBrown = #FF9500;
color bounce = #05daff;

color lava01 = #ff5b03;
//color lava02 = #ff7105;
//color lava03 = #ff7a05;
//color lava04 = #ffa305;
//color lava05 = #ffb805;
//color lava06 = #ffc105;


PImage map, ice, stone, treeTrunk, middleTree, leftTree, rightTree, centerTree, lava0, lava1, lava2, lava3, lava4, lava5;
int gridSize = 32;
float zoom = 1.5;
boolean wkey, akey, skey, dkey, qkey, ekey, spacekey, upkey, downkey, leftkey, rightkey;
FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  ice = loadImage("blueBlock.png");
  stone = loadImage("brick.png");
  treeTrunk = loadImage("tree_trunk.png");
  middleTree = loadImage("treetop_center.png");
  leftTree = loadImage("treetop_w.png");
  rightTree = loadImage("treetop_e.png");
  centerTree = loadImage("tree_intersect.png");
  lava0 = loadImage("lava0.png");
  lava1 = loadImage("lava1.png");
  lava2 = loadImage("lava2.png");
  lava3 = loadImage("lava3.png");
  lava4 = loadImage("lava4.png");
  lava5 = loadImage("lava5.png");
  //0 = loadImage("lava0.png");
  //1 = loadImage("lava1.png");
  //2 = loadImage("lava2.png");
  //3 = loadImage("lava3.png");
  //4 = loadImage("lava4.png");
  //5 = loadImage("lava5.png");

  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = map.get(x, y);

      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == black) { //stone block
        b.attachImage(stone);
        b.setFriction(4);
        b.setName("stone");
        world.add(b);
      }

      if (c == cyan) { //ice block
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }

      if (c == treeTrunkBrown) { //ice block
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("treeTrunk");
        world.add(b);
      }

      if (c == middleGreen) { //ice block
        b.attachImage(middleTree);
        //b.setSensor(true);
        b.setName("middleTree");
        world.add(b);
      }

      if (c == leftGreen) { //ice block
        b.attachImage(leftTree);
        //b.setSensor(true);
        b.setName("letfTree");
        world.add(b);
      }

      if (c == rightGreen) { //ice block
        b.attachImage(rightTree);
        //b.setSensor(true);
        b.setName("rightTree");
        world.add(b);
      }

      if (c == centerGreen) { //ice block
        b.attachImage(centerTree);
        //b.setSensor(true);
        b.setName("centerTree");
        world.add(b);
      }

      //if (c == lava01) { //stone block
      //  int i = 0;
      //  if (i < 6) {
      //    b.attachImage(lava + i);
      //    i++;
      //  }
      //  b.setFriction(4);
      //  b.setName("lava");
      //  world.add(b);
      //}
      
      //if (c == lava02) { //stone block
      //  b.attachImage(lava1);
      //  b.setFriction(4);
      //  b.setName("lava1");
      //  world.add(b);
      //}
      //if (c == lava03) { //stone block
      //  b.attachImage(lava2);
      //  b.setFriction(4);
      //  b.setName("lava2");
      //  world.add(b);
      //}
      //if (c == lava04) { //stone block
      //  b.attachImage(lava3);
      //  b.setFriction(4);
      //  b.setName("lava3");
      //  world.add(b);
      //}
      //if (c == lava05) { //stone block
      //  b.attachImage(lava4);
      //  b.setFriction(4);
      //  b.setName("lava4");
      //  world.add(b);
      //}
      
      //if (c == lava06) { //stone block
      //  b.attachImage(lava5);
      //  b.setFriction(4);
      //  b.setName("lava5");
      //  world.add(b);
      //}
    }
  }
}


  void loadPlayer() {
    player = new FPlayer();
    world.add(player);
  }

  void draw() {
    background(white);
    square (100, 100, 100);
    drawWorld();
    player.act();
  }

  void drawWorld() {
    pushMatrix();
    translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
    scale(zoom);
    world.step();
    world.draw();
    popMatrix();
  }
