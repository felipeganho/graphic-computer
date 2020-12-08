import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage img;
PShape cilindro;
PShape botao;
float angle;
float start = 0;
float cont = 350;

final float comprimentoSegundos = 90.0;
final float comprimentoMinutos = 7.0 / 8.0 * comprimentoSegundos;
final float comprimentoHoras = 3.0 / 4.0 * comprimentoMinutos;
final int largura = int(2 * comprimentoSegundos + 2.0);
final float centro = largura-180;
final float diametro = largura + 64;
 
//define o ponto maximo somado com centro
PVector converteTranslada(float theta, float r) {
   theta -= HALF_PI;   
   return new PVector(r * cos(theta) + centro, r * sin(theta) + centro);
}
 
void setup() {
  size(750, 600, P3D);
  minim = new Minim(this);
  player = minim.loadFile("song.mp3", 2048);
  player.play();
  img = loadImage("image.jpg");
  cilindro = criaCilindro(110, 50, 32);
  botao = criaBotao(15, 15, 32);

  //menu de opcoes no terminal
  println("BOTÃO DIREITO DO MOUSE - ADICIONA AMBIENT LIGHT DE ACORDO COM A POSIÇÃO DO MOUSE");
  println("BOTÃO ESQUERDO DO MOUSE - PRESSIONA O BOTÃO LATERAL E AJUSTA PARA O HORÁRIO DE VERÃO");
  println("TECLA F OU f DO TECLADO - AUMENTA A PROJEÇÃO DO RELÓGIO DE ACORDO COM A POSIÇÃO DO MOUSE");
  println("TECLA D OU d DO TECLADO - ADICIONA UMA BORDA NA PARTE FRONTAL DO RELÓGIO");
  println("AO PRESSIONAR QUALQUER TECLA QUE NÃO SEJA AS CITADAS ANTERIORES MUDA A COR DO RELOGIO");
}
 
void draw() {
  background(img);
  lights();

  if (start <= height/2){
    translate(width/2,start);
    start += 1;
  }
  else {
    if (cont < 200) {
      translate(-50,-50,-50);
      camera(mouseX, mouseY, mouseX+100, -mouseX, -mouseY, -100, 0.0, 1.0, 0.0);
    }
    else {
      translate(width/2,height/2);
      angle += 0.01;
      rotateY(angle);
      cont -= 0.2;
    }
  }

  pointLight(10, 10, 250, mouseX, mouseY, mouseX);
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      ambientLight(mouseX,mouseY,mouseX-mouseY, mouseX,mouseY,mouseX-mouseY);
    }
  }
  if (keyPressed) {
    if (key == 'f' || key == 'F') {
      ortho(-mouseX/2, mouseY/2, -mouseX/2, mouseY/2);
    }
  }
  noStroke();
  shape(cilindro);
  
  translate(0,0,24);
    
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      for (int i = 0; i < 218; i++) {
        
        stroke(i-5);
        ellipse(0, 0, 218-i, 218-i);
      }
    }
  }
  else {
    for (int i = 0; i < 218; i++) {
      stroke(i);
      ellipse(0, 0, 218-i, 218-i);
    }
  }
  
  fill(150);
  translate(0,0,-48);
  ellipse(0,0,218,218);
  
  //ponteiro dos segundos
  float theta = TWO_PI * second() / 60.0;
  PVector pontoFinal = converteTranslada(theta, comprimentoSegundos);
  strokeWeight(1);
  stroke(240, 0, 0);
  translate(0,0,50);
  line(centro, centro, pontoFinal.x, pontoFinal.y);

  //ponteiro dos minutos
  strokeWeight(3);
  stroke(0);  
  theta = TWO_PI * minute() / 60.0;
  pontoFinal = converteTranslada(theta, comprimentoMinutos);
  line(centro, centro, pontoFinal.x, pontoFinal.y);
  
  //ponteiro das horas
    
  strokeWeight(4);
  stroke(0);  
  theta = TWO_PI * ((hour()-1 % 12) + minute() / 60.0) / 12.0;
  if (mousePressed) {
     if (mouseButton == LEFT) {
         theta = TWO_PI * ((hour() % 12) + minute() / 60.0) / 12.0;
     }  
   }
  pontoFinal = converteTranslada(theta, comprimentoHoras);
  line(centro, centro, pontoFinal.x, pontoFinal.y);
  
  //numeros de 1 a 12
  translate(-10,5,0);
  for (int i = 1; i <= 12; i++) {
      theta = TWO_PI * (i/12.0);
      pontoFinal = converteTranslada(theta, comprimentoSegundos + 3);
      textSize(17);
      fill(255);
      text(Integer.toString(i), pontoFinal.x, pontoFinal.y);
   }
   
   translate(128,0,-28);
   if (mousePressed) {
     if (mouseButton == LEFT) {
         translate(-10,0,0);
     }  
   }
   shape(botao);
   rotateY(PI/2);
   translate(0,0,9);
   ellipse(0,0,28,28); 
}
 
//-------------------------------------------------------------------------
 
PShape criaCilindro(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape forma = createShape();
  forma.beginShape(QUAD_STRIP);
  forma.noStroke();
  forma.fill(200, 200, 200); 
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float y = cos(i * angle);
    float u = float(i) / detail;
    forma.normal(x, y, 0);
    forma.vertex(x * r, y * r,-h/2, u, 0);
    forma.vertex(x * r, y * r,+h/2, u, 1);
  }
  forma.endShape();
  return forma;
}

PShape criaBotao(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape forma = createShape();
  forma.beginShape(QUAD_STRIP);
  forma.noStroke();
  forma.fill(200, 200, 200); 
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float y = cos(i * angle);
    float u = float(i) / detail;
    forma.normal(x, y, 0);
    forma.vertex(-h/2,y * r,x * r, u, 0);
    forma.vertex(+h/2,y * r,x * r, u, 1);
  }
  forma.endShape();
  return forma;
}
