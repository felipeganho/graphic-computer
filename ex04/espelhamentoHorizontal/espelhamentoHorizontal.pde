PImage img; //variavel do tipo PImage para carregar a imagem

void setup(){
  size(700, 437);  //tamanho do quadro
  img = loadImage("mustang.jpg"); //carrega a imagem na variavel img
}

void draw() {
  loadPixels();  //funcao para carregar e ter acesso aos pixels da imagem
  for (int y = 0; y < height; y++) {    //loops para percorrer o vetor de pixels
    for (int x = 0; x < width; x++) {
      
      pixels [y * width + x] = img.pixels[(width - x - 1) + y * width]; //pixel a esquerda recebe o da direita
               
    }
  }
  //atualiza os pixels
  updatePixels();
  save("mustangInvertidoHorizontal.png");
}
