PImage rock, paper, scissors;
int user;
int[] prevchoices;
int computer;
boolean win, tie;

void setup() {
  size(800, 600);
  rock = loadImage("rock.png");
  paper = loadImage("paper.png");
  scissors = loadImage("scissors.png");
  
  user = 0;
  prevchoices = new int[3];
  computer = 0;
  win = false;
}

void draw() {
  background(255);
  
  image(rock, 80, 450, 100, 100);
  image(paper, 300, 450, 100, 100);
  image(scissors, 520, 450, 100, 100);
  
  stroke(0);
  noFill();
  rect(80, 450, 100, 100);
  rect(300, 450, 100, 100);
  rect(520, 450, 100, 100);
  
  if (user != 0) {
    switch (user) {
      case 1: image(rock, 100, 200, 100, 100); break;
      case 2: image(paper, 100, 200, 100, 100); break;
      case 3: image(scissors, 100, 200, 100, 100); break;
    }
    
    switch (computer) {
      case 1: image(rock, 300, 200, 100, 100); break;
      case 2: image(paper, 300, 200, 100, 100); break;
      case 3: image(scissors, 300, 200, 100, 100); break;
    }
    
    if (user == 1 && computer == 3) win = true;
    if (user == 2 && computer == 1) win = true;
    if (user == 3 && computer == 2) win = true;
    
    if (user == computer) tie = true;
    
    fill(0);
    if (win == true && tie == false) text("you win!", 100, 50);
    if (win == false && tie == false) text("you lose!", 100, 50);
    if (tie == true && win == false) text("tie", 100, 50);
  }
}

void mousePressed() {
  if (mouseX >= 80 && mouseX <= 180 && mouseY >= 450 && mouseY <= 550) user = 1;
  if (mouseX >= 300 && mouseX <= 400 && mouseY >= 450 && mouseY <= 550) user = 2;
  if (mouseX >= 520 && mouseX <= 620 && mouseY >= 450 && mouseY <= 550) user = 3;
  
  prevchoices[user - 1]++;
  
  //computer = 3;      // computer always chooses scissors
  //computer = (int)random(1, 4);      // computer chooses randomly
  
  int max = -1;
  int mostplayed = 0;
  for (int i = 0; i < 3; i++) {
    if (prevchoices[i] > max) {
      max = prevchoices[i];
      mostplayed = i + 1;
    }
    
  }
  
  switch (mostplayed) {
    case 1: computer = 2; break;
    case 2: computer = 3; break;
    case 3: computer = 1; break;
  }
  

  win = false;
}
