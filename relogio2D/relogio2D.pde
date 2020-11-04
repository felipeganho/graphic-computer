final float comprimentoSegundos = 90.0;
final float comprimentoMinutos = 7.0 / 8.0 * comprimentoSegundos;
final float comprimentoHoras = 3.0 / 4.0 * comprimentoMinutos;
final int largura = int(2 * comprimentoSegundos + 2.0);
final float centro = largura + 30;
final float diametro = largura + 64;
PImage img;
PFont f; 

void setup() {
  size(800, 500);
  img = loadImage("relogio.jpg");
  f = createFont("Arial", 16, true);  //fonte e tamanho do texto
  textAlign(CENTER,CENTER);
  background(255);
  smooth(8);
  noFill();
}

//define o ponto maximo somado com centro
PVector converteTranslada(float theta, float r) {
   theta -= HALF_PI;   
   return new PVector(r * cos(theta) + centro, r * sin(theta) + centro);
}

void draw() {
  background(255);
  image(img, 38, 40,350,350);
  
  //menu de opcoes
  textFont(f, 15);
  fill(0, 0, 255);
  text("BOTÃO DIREITO DO MOUSE - MODELO VERMELHO", 570, 170);
  text("TECLADO F OU f DO TECLADO - MODELO COM DATA ATUAL", 570, 190);
  
  //transforma o relogio num modelo dourado e vermelho
  if (mouseButton == RIGHT) {
    for (int i = 1; i < diametro; i++) {
      stroke(i,i,i);
      ellipse(centro, centro, diametro-i, diametro-i);
    }
      
    noStroke();
    fill(250,0,0,100);
    ellipse(centro, centro, (diametro)*12/13, (diametro)*12/13);
    textSize(17);
    fill(255);
    text("SRN", 212,165);
  } 
  
  else {
    for (int i = 1; i < diametro; i++) {
      stroke(i,i,i);
      ellipse(centro, centro, diametro-i, diametro-i);
    }
      
    noStroke();
    fill(0, 0, 250, 100);
    ellipse(centro, centro, (diametro)*12/13, (diametro)*12/13);
    textSize(17);
    fill(255);
    text("SRN", 212, 165);
    
    //mostra a data atual
    if (keyPressed) {
      if (key == 'f' || key == 'F') {
        strokeWeight(4);
        stroke(200);
        fill(58, 95, 205, 100);
        ellipse(centro + 20, centro + 40, 40,40);
        fill(255);
        text(str(day()), centro + 20, centro + 38);
      }  
    }
  }
    
  //ponteiro dos segundos
  float theta = TWO_PI * second() / 60.0;
  PVector pontoFinal = converteTranslada(theta, comprimentoSegundos);
  strokeWeight(1);
  stroke(240, 0, 0);
  line(centro, centro, pontoFinal.x, pontoFinal.y);
  
  //ponteiro dos minutos
  strokeWeight(3);
  if (mouseButton == RIGHT) {
    stroke(255,215,0);
  } else {
    stroke(0);  
  }
  theta = TWO_PI * minute() / 60.0;
  pontoFinal = converteTranslada(theta, comprimentoMinutos);
  line(centro, centro, pontoFinal.x, pontoFinal.y);
  
  //ponteiro das horas
  strokeWeight(4);
  if (mouseButton == RIGHT) {
    stroke(255,215,0);
  } else {
    stroke(0);  
  }
  theta = TWO_PI * ((hour() % 12) + minute() / 60.0) / 12.0;
  pontoFinal = converteTranslada(theta, comprimentoHoras);
  line(centro, centro, pontoFinal.x, pontoFinal.y);
  
  //numeros de 1 a 12
  for (int i = 1; i <= 12; i++) {
      theta = TWO_PI * (i/12.0);
      pontoFinal = converteTranslada(theta, comprimentoSegundos + 8);
      textSize(17);
      if (mouseButton == RIGHT) {
        fill(255,215,0);
      } else {
        fill(255);  
      }
      text(Integer.toString(i), pontoFinal.x, pontoFinal.y);
   }
}
