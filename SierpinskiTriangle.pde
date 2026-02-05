// Sierpinski Triangle in Processing
// Click mouse to decrease detail level
// Press any key to change colors
// Drag mouse for custom colors

int baseLimit = 20;  // Base case limit - controls detail level
int colorR = 100;
int colorG = 150;
int colorB = 255;

public void setup() {
  size(800, 800);
  background(0);
}

public void draw() {
  background(0);
  
  // Draw text instructions
  fill(255);
  textSize(14);
  text("Click to change detail level: " + baseLimit, 10, 20);
  text("Press any key to change colors", 10, 40);
  text("Drag mouse for custom colors", 10, 60);
  
  // Call sierpinski to start the recursion
  sierpinski(50, 750, 700);
}

public void mousePressed() {
  // Cycle through different detail levels
  baseLimit += 5;
  if (baseLimit > 100) {
    baseLimit = 5;
  }
}

public void keyPressed() {
  // Change colors randomly when any key is pressed
  colorR = (int)random(50, 255);
  colorG = (int)random(50, 255);
  colorB = (int)random(50, 255);
}

public void mouseDragged() {
  // Change colors based on mouse position
  colorR = mouseX % 256;
  colorG = mouseY % 256;
  colorB = 200;
}

public void sierpinski(int x, int y, int len) {
  // Base case: if length is small enough, draw a single triangle
  if (len <= baseLimit) {
    // Draw triangle with corners at:
    // (x, y) - bottom left
    // (x + len, y) - bottom right  
    // (x + len/2, y - len) - top
    fill(colorR, colorG, colorB, 200);
    stroke(colorR + 50, colorG + 50, colorB);
    strokeWeight(1);
    triangle(x, y, x + len, y, x + len/2, y - len);
  } 
  else {
    // Recursive case: draw three smaller triangles
    
    // Bottom left triangle
    sierpinski(x, y, len/2);
    
    // Bottom right triangle (len/2 to the right)
    sierpinski(x + len/2, y, len/2);
    
    // Top triangle (len/4 to the right, len/2 up)
    sierpinski(x + len/4, y - len/2, len/2);
  }
}