PImage img; //variavel do tipo PImage para carregar a imagem

void setup() {
  size(650, 650); //tamanho do quadro
  img = loadImage("circulo-cromatico.jpg"); //carrega a imagem na variavel img
}

void draw() {
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
  save("circuloCromaticoInvertido.png");
}
