int x = 0; //variavel para contagem dos frames

void setup(){
  size(800, 700, P3D);  //tamanho do quadro
}

void draw(){
  lights();
  
  line(0, 600, 800, 600);     //linha de sustentacao
  
  //luzes para efeitos de luz de acordo com a posicao do mouse
  ambientLight(mouseX/7, mouseX/7, mouseX/7, 0, mouseY, 0);
  directionalLight(100, 40, 0, 0, 200, 400-mouseY);
  spotLight(50, 240, 100, mouseX, mouseY, 400, 0, 0, -1, PI/8, 100);
  pointLight(200, 200, 0, mouseX, mouseY, 100);
  
  //predio e porta dupla principal
  fill(79, 79, 79);           //preenche o predio de cinza
  rect(350, 100, 400, 500);   //estrutura do predio
  fill(135,206,250);       //preenche a porta de preto
  rect(490, 540, 150, 60);   //porta do predio
  line(565, 540, 565, 600);  //linha divisoria da porta
  fill(0, 0, 0);             //preenhce a macaneta esquerda
  circle(560, 575, 5);       //macaneta esquerda
  fill(0, 0, 0);             //preenche a macaneta direita
  circle(570, 575, 5);       //macaneta direita 
  
  //janelas lado esquerdo
  //janela 1
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(400, 150, 55);      //janela esquerda
  fill(255, 255, 255);        //preenche macaneta
  circle(450, 180, 5);        //macaneta
  fill(169,169,169);          //preenche parte janela direita
  square(455, 150, 55);       //janela direita
  
  //janela 2
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(400, 220, 55);      //janela esquerda
  fill(255, 255, 255);        //preenche macaneta
  circle(450, 250, 5);        //macaneta
  fill(169,169,169);          //preenche parte janela direita
  square(455, 220, 55);       //janela direita
  
  //janela 3
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(400, 290, 55);      //janela esquerda
  fill(255, 255, 255);        //preenche macaneta
  circle(450, 320, 5);        //macaneta
  fill(169,169,169);          //preenche parte janela direita
  square(455, 290, 55);       //janela direita
  
  //janela 4
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(400, 360, 55);      //janela esquerda
  fill(0, 0, 0);          //preenche parte janela direita
  square(455, 360, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(500, 390, 5);        //macaneta
  
  //janela 5
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(400, 430, 55);      //janela esquerda
  fill(255, 255, 255);        //preenche macaneta
  circle(450, 460, 5);        //macaneta
  fill(169,169,169);          //preenche parte janela direita
  square(455, 430, 55);       //janela direita
  
  //janelas lado direito
  //janela 1
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(550, 150, 55);      //janela esquerda
  fill(0, 0, 0);          //preenche parte janela direita
  square(605, 150, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(650, 180, 5);        //macaneta
  
  //janela 2
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(550, 220, 55);      //janela esquerda
  fill(0, 0, 0);          //preenche parte janela direita
  square(605, 220, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(650, 250, 5);        //macaneta
  
  //janela 3
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(550, 290, 55);      //janela esquerda
  fill(169, 169, 169);          //preenche parte janela direita
  square(605, 290, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(600, 320, 5);        //macaneta
  
  //janela 4
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(550, 360, 55);      //janela esquerda
  fill(169, 169, 169);          //preenche parte janela direita
  square(605, 360, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(600, 390, 5);        //macaneta
  
  //janela 5
  fill(0, 0, 0);             //preenche parte esquerda da janela 
  square(550, 430, 55);      //janela esquerda
  fill(169, 169, 169);          //preenche parte janela direita
  square(605, 430, 55);       //janela direita
  fill(255, 255, 255);        //preenche macaneta
  circle(600, 460, 5);        //macaneta
    
  //arvore
  fill(139,69,19);          //preenche tronco arvore
  rect(120, 500, 50, 100);  //tronco arvore
  fill(50,205,50);          //preenche copa arvore
  triangle(150, 400, 200, 500, 80, 500);  //copa arvore
  
  //clique no mouse salva frame
  if(mousePressed == true){
    x += 1;
    saveFrame("predio-0000"+str(x)+".png");
  }
}
