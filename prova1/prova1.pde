int espessuraBorda = 4; //tamanho da borda
PFont f;  
PImage img;

void setup() {
  background(255); 
  size(700, 500);
  f = createFont("Arial", 16, true);  //fonte e tamanho do texto
}

void draw() {
  desenhaFundo(width, height);
  desenhaLosango(width, height);
  desenhaCirculo(width, height);
  save("BandeiraOriginal.png"); 
  img = loadImage("BandeiraOriginal.png"); //carrega a imagem na variavel img
  
  //menu de opcoes
  textFont(f, 15);
  fill(255, 255, 0);
  text("BOTÃO ESQUERDO DO MOUSE - CORES INVERTIDAS", 20, 20);
  text("BOTÃO DIREITO DO MOUSE - DESLOCAMENTO HORIZONTAL", 20, 40);
  text("TECLA T OU t DO TECLADO - DEGRADÊ CÍRCULO", 20, 60);
  
  //verifica se houve click do mouse
  if(mousePressed){
    //verifica se houve click esquerdo do mouse
    if(mouseButton == LEFT){
      inverterCores(img);
      save("BandeiraInvertida.png");
    }
    //verifica se houve click direito do mouse
    else if(mouseButton == RIGHT){
      deslocaHorizontal(width, height);
      save("BandeiraDeslocada.png");
    }
  }
  
  //verifica se houve digitacao
  if(keyPressed){
    //verifica se foi a tecla t ou T
    if(key == 't' || key == 'T'){      
      circuloDegrade(width, height);
      save("BandeiraTransparencia.png");
    } 
  }
}

//desenha o fundo verde da bandeira
void desenhaFundo(int x, int y){
  background(255);
  stroke(255);
  fill(0, 150, 0);
  rect(espessuraBorda, espessuraBorda, x - (espessuraBorda * 2), y - (espessuraBorda * 2));
}

//desenha o circulo da bandeira
void desenhaCirculo(int x, int y){
  fill(0, 0, 100);
  stroke(0, 0, 100); 
  ellipse(x * 0.5, y * 0.5, x * 1/3, x * 1/3);
  textFont(f, 20);
  fill(255, 255, 0);
  text("ORDEM e PROGRESSO", 238, 260);
}

//desenha o losango da bandeira
void desenhaLosango(int  x, int y){
  fill(255, 255, 0);
  stroke(255, 255, 0);
  quad((x * 0.125), (y * 0.5), (x * 0.5), (y * 0.125), x * (0.875), y * 0.5, x * 0.5, (y) * 0.875);
}

//inverte as cores da bandeira
void inverterCores(PImage img){
  loadPixels();  //funcao para carregar e ter acesso aos pixels da imagem
  for (int y = 0; y < height; y++) {    //loops para percorrer o vetor de pixels
    for (int x = 0; x < width; x++) {
      
      int loc = x + y * width;  //localizacao na matriz de pixels unidimensional
      
      float r = red(img.pixels[loc]); //pega a componente vermelha do pixel
      float g = green(img.pixels[loc]); //pega a componente verde do pixel
      float b = blue(img.pixels[loc]); //pega a componente azul do pixel
      
      //operacoes para inverter as cores da imagem 
      r = 255 - r;
      g = 255 - g;
      b = 255 - b;
      
      //define as novas cores
      pixels[loc] =  color(r,g,b);          
    }
  }
  //atualiza os pixels
  updatePixels();
}

//desloca losango e circulo em 1/8 da largura
void deslocaHorizontal(int x, int y){
  desenhaFundo(width, height);
  fill(255, 255, 0);
  stroke(255, 255, 0);
  quad((x * 0.125) + (width * 0.125), (y * 0.5), (x * 0.5) + (width * 0.125), (y * 0.125), x * (0.875) + (width * 0.125), y * 0.5, x * 0.5 + (width * 0.125), (y) * 0.875);
  fill(0, 0, 100);
  stroke(0, 0, 100); 
  ellipse(x * 0.5 + (width * 0.125), y * 0.5, x * 1/3, x * 1/3);
  textFont(f, 20);
  fill(255, 255, 0);
  text("ORDEM e PROGRESSO", 238 + (width * 0.125), 260);
}

//degrade no circulo da bandeira
void circuloDegrade(int x, int y){
  desenhaFundo(x, y);
  desenhaLosango(x,y);
  
  stroke(#000070, 64);
  fill(#000070, 64);
  ellipse(x * 0.5, y * 0.5, x * 1/3, x * 1/3);
  
  stroke(#000070, 127);
  fill(#000070, 127);
  ellipse((x * 0.5), (y * 0.5), (x * 1/3) * 0.7, (x * 1/3) * 0.7);
  
  stroke(#000070, 255);
  fill(#000070, 255);
  ellipse((x * 0.5), (y * 0.5), (x * 1/3) * 0.5, (x * 1/3) * 0.5);
  
  textFont(f, 20);
  fill(255, 255, 0);
  text("ORDEM", 310, 165); 
  text("E", 343, 260); 
  text("PROGRESSO", 285, 340); 
}
