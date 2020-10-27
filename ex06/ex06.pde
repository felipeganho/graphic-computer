PImage img, imagemRotacionada; //imagem original e rotacionada
float theta = radians(33); //definicao de um angulo qualquer

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
      
      //mapeamento reverso
      float x1 = (x0 * cos(theta) + y0 * sin(theta));
      float y1 = (x0 * -sin(theta) + y0 * cos(theta));
      
      x1 += img.width/2;
      y1 += img.height/2;
      
      float deltaColuna = x1 - int(x1);
      float deltaLinha = y1 - int(y1);
      
      //pixels vizinhos
      color pixel1 = img.get(int(x1), int(y1));
      color pixel2 = img.get(int(x1)+1, int(y1));
      color pixel3 = img.get(int(x1), int(y1)+1);
      color pixel4 = img.get(int(x1)+1, int(y1)+1);
       
      imagemRotacionada.set(x + 120, y + 150, novoPixel(pixel1, pixel2, pixel3, pixel4, deltaColuna, deltaLinha));
    } 
  }
  imagemRotacionada.updatePixels();
  image(imagemRotacionada, 0, 0, 850, 600);
  save("mustangRotacionado.png");
}

//funcao de controle para cada canal
color novoPixel(color A, color B, color C, color D, float deltaColuna, float deltaLinha){
  float controlAB, controlCD, r, g, b;
  
  controlAB = deltaColuna * (red(B) - red(A)) + red(A);
  controlCD = deltaColuna * (red(D) - red(C)) + red(C);
  r = deltaLinha * (controlCD - controlAB) + controlAB;
  
  controlAB = deltaColuna * (green(B) - green(A)) + green(A);
  controlCD = deltaColuna * (green(D) - green(C)) + green(C);
  g = deltaLinha * (controlCD - controlAB) + controlAB;
 
  controlAB = deltaColuna * (blue(B) - blue(A)) + blue(A);
  controlCD = deltaColuna * (blue(D) - blue(C)) + blue(C);
  b = deltaLinha * (controlCD - controlAB) + controlAB;
  
  return color(r, g, b);
}
