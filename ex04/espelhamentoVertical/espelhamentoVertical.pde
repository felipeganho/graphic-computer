PImage img; //variavel do tipo PImage para carregar a imagem

void setup(){
  size(700, 437);  //tamanho do quadro
  img = loadImage("mustang.jpg"); //carrega a imagem na variavel img
}

void draw() {
  loadPixels();  //funcao para carregar e ter acesso aos pixels da imagem
  for (int y = 0; y < height; y++) {    //loops para percorrer o vetor de pixels
    for (int x = 0; x < width; x++) {
     
      pixels [(height - y - 1) * width + x] = img.pixels [y * width + x]; //pixel mais acima recebe os do fim
               
    }
  }
  //atualiza os pixels
  updatePixels();
  save("mustangInvertidoVertical.png");
}
