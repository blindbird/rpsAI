PImage rock, paper, scissors;
int user;
int[] prevchoices;
int computer;
int ai;
int win;
boolean played;

// win = 0 -> lose
// win = 1 -> tie
// win = 2 -> win

void setup() {
  size(800, 600);
  rock = loadImage("rock.png");
  paper = loadImage("paper.png");
  scissors = loadImage("scissors.png");
  
  user = 0;
  prevchoices = new int[3];
  computer = 0;
  win = -1;
  
  ai = 1;
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
  
  rect(700, 100, 80, 50);
  rect(700, 200, 80, 50);
  rect(700, 300, 80, 50);
  
  stroke(0, 255, 0);
  switch (ai) {
    case 1: rect(700, 100, 80, 50); break;
    case 2: rect(700, 200, 80, 50); break;
    case 3: rect(700, 300, 80, 50); break;
  }
  
  fill(0);
  stroke(0);
  text("stupid", 710, 115);
  text("(scissors)", 710, 135);
  text("random", 710, 230);
  text("smart??", 710, 330);
  
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
    
    
    if (user == 1 && computer == 3) win = 2;
    if (user == 2 && computer == 1) win = 2;
    if (user == 3 && computer == 2) win = 2;
    
    if (computer == 1 && user == 3) win = 0;
    if (computer == 2 && user == 1) win = 0;
    if (computer == 3 && user == 2) win = 0;
    
    if (user == computer) win = 1;
    
    if (win == 2) text("you win!", 100, 50);
    if (win == 0) text("you lose!", 100, 50);
    if (win == 1) text("tie", 100, 50);
    
    prevchoices[user - 1]++;
  
    if (played == false) {
      if (ai == 1) computer = 3;      // computer always chooses scissors
      if (ai == 2) computer = (int)random(1, 4);      // computer chooses randomly
    
      if (ai == 3) {
        int max = -1;
        int min = 999;
        int mostplayed = 0;
        int leastplayed = 0;
        for (int i = 0; i < 3; i++) {
          if (prevchoices[i] > max) {
            max = prevchoices[i];
            mostplayed = i + 1;
          }
          if (prevchoices[i] < min) {
            min = prevchoices[i];
            leastplayed = i + 1;
          }
        }
    
        beat(mostplayed);
      
        if (max > 5) {
          beat(leastplayed);
        }
      }
    }
    played = true;
  }
  
}

void mousePressed() {
  if (mouseX >= 80 && mouseX <= 180 && mouseY >= 450 && mouseY <= 550) user = 1;
  if (mouseX >= 300 && mouseX <= 400 && mouseY >= 450 && mouseY <= 550) user = 2;
  if (mouseX >= 520 && mouseX <= 620 && mouseY >= 450 && mouseY <= 550) user = 3;
  
  if (mouseX >= 700 && mouseX <= 780 && mouseY >= 100 && mouseY <= 150) ai = 1;
  if (mouseX >= 700 && mouseX <= 780 && mouseY >= 200 && mouseY <= 250) ai = 2;
  if (mouseX >= 700 && mouseX <= 780 && mouseY >= 300 && mouseY <= 350) ai = 3;
  
  played = false;
}

void beat(int n) {
  switch (n) {
      case 1: computer = 2; break;
      case 2: computer = 3; break;
      case 3: computer = 1; break;
    }
}
