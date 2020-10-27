PImage img, imagemRotacionada; //imagem original e rotacinada
float theta = radians(30); //definicao de um angulo qualquer

void setup(){
  size(850, 600);
  img = loadImage("mustang.jpg");
  imagemRotacionada = createImage(img.width + 300, img.height + 300, RGB); //criacao da imagem rotacionada 
}

void draw(){
  img.loadPixels();
  //percorrendo os pixels
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      
      int x0 = x - img.width/2;
      int y0 = y - img.height/2;
      
      //rotacao dos pixels x e y
      int x1 = int((x0 * cos(theta) - y0 * sin(theta)));
      int y1 = int((x0 * sin(theta) + y0 * cos(theta)));
      
      x1 += img.width/2;
      y1 += img.height/2;
      
      //definindo a imagem rotacioanda
      imagemRotacionada.set(x1 + 120, y1 + 150, img.get(x, y)); 
    } 
  }
  imagemRotacionada.updatePixels();
  image(imagemRotacionada, 0, 0, 850, 600);
  save("mustangRotacionado.png");
}
