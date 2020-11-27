void setup (){
  size(750, 600, P3D);
}

void draw(){
  lights();
  background(120, 120, 120);
  camera(mouseX - 400, mouseY, mouseX, 100, 60, 20, 0.0, -1.0, 0.0);
  
  //luzes para efeitos de luz de acordo com a posicao do mouse
  ambientLight(mouseX/7, mouseX/7, mouseX/7, 0, mouseY, 0);
  directionalLight(100, 40, 0, 0, 200, 400-mouseY);
  spotLight(50, 240, 100, mouseX, mouseY, 400, 0, 0, -1, PI/8, 100);
  pointLight(200, 200, 0, mouseX, mouseY, 100);
  
  //superficie
  noStroke();
  fill(92, 64, 51);
  translate(-10, -35, 30);
  box(500, 10, 350);
  stroke(1);

  //predio
  translate(0, 120, 0);
  fill(85, 140, 100);
  box(150, 250, 100);
  
  //janela 1
  fill(120, 120, 120);
  translate(-40, 90, 25);
  box(70, 40, 52);
  
  //janela 2
  fill(120, 120, 120);
  translate(80, 0);
  box(70, 40, 52);
  
  //janela 3
  fill(120, 120, 120);
  translate(0, -50);
  box(70, 40, 52);
  
  //janela 4
  fill(120, 120, 120);
  translate(-80, 0);
  box(70, 40, 52);

  translate(40, -130, 26);  
  //macaneta
  noStroke();
  fill(-100, 105, 175);
  translate(-20, 0, 0);
  sphere(2);
  
  //arvore 1
  //folhas
  fill(50, 205, 50);
  translate(140, 40, 20);
  sphere(15);
  translate(20, 0, 0);
  sphere(15);
  translate(-10, 20, 0);
  sphere(15);
  //tronco
  translate(0, -50, 0); 
  fill(139, 69, 19);
  box(10, 80, 5);
  
  //arvore 2
  //folhas
  fill(50, 205, 50);
  translate(-270, 30, 20);
  sphere(15);
  translate(20, 0, 0);
  sphere(15);
  translate(-10, 20, 0);
  sphere(15);
  //tronco
  translate(0, -50, 0); 
  fill(139, 69, 19);
  box(10, 80, 5);
  
  //porta do predio
  stroke(2);
  fill(120, 120, 120);
  translate(75, -55, -40);
  beginShape(QUAD_STRIP); 
  vertex(30, 20); 
  vertex(30, 75); 
  vertex(50, 20);
  vertex(50, 75);
  vertex(65, 20); 
  vertex(65, 75); 
  vertex(85, 20);
  vertex(85, 75); 
  endShape();
}
