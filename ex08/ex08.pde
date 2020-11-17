float fov = PI/3.0;
float cameraZ = (height)/ tan(fov/2.0);

void setup(){
  size(800, 650, P3D);
}

void draw(){
  //valores padrao de luzes
  lights();
  //fundo
  background(80);
  
  //caixa vermelha com divisoes pretas
  camera(mouseX/3, mouseY, (height/2) / tan(PI/5.5), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2 + 100, height/2 + 10, -20);
  //caso precionado varia a perspectiva
  if(mousePressed){
    if(mouseButton == RIGHT){
      perspective(fov, float(mouseX)/float(mouseY), cameraZ/10.0, cameraZ*10.0);
    }
    
    if(mouseButton == LEFT){
      ortho(-mouseX/2, mouseY/2, -height/4, height/4);
    }
  }
  stroke(0);
  fill(255, 0, 0);
  box(60);
  
  //caixa azul com divisoes pretas
  camera(mouseX/3, mouseY, (height/2) / tan(PI/5.5), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2 + 200, height/2 + 50, -60);
  //caso precionado varia a perspectiva
  if(mousePressed){
    if(mouseButton == RIGHT){
      perspective(fov, float(mouseX)/float(mouseY), cameraZ/10.0, cameraZ*10.0);
    }
    
    if(mouseButton == LEFT){
      ortho(-mouseX/2, mouseY/2, -height/4, height/4);
    }
  }
  stroke(0);
  fill(0, 0, 255);
  box(60);
  
  //esfera de detalhes com cor variante
  camera(mouseX/3, mouseY, (height/2) / tan(PI/5.5), mouseX, height/2, 0, 0, 1, 0);
  //translate(width/2 + 200, height/2 + 200, -100);
  if(mousePressed){
    //caso pressionado varia a perspectiva
    if(mouseButton == RIGHT){
      perspective(fov, float(mouseX)/float(mouseY), cameraZ/10.0, cameraZ*10.0);
    }
    
    //caso pressionado varia a projecao
    if(mouseButton == LEFT){
      ortho(-mouseX/2, mouseY/2, -height/4, height/4);
    }
  }
  stroke(255, 50);
  translate(width/2, height/2, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 3, 0, 160);
  sphereDetail(mouseX/4);
  sphere(40);
  
  //esfera verde com divisoes pretas
  camera(mouseX/3, mouseY, (height/2) / tan(PI/5.5), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  if(mousePressed){
    //caso pressionado varia a perspectiva
    if(mouseButton == RIGHT){
      perspective(fov, float(mouseX)/float(mouseY), cameraZ/10.0, cameraZ*10.0);
    }
    
    //caso pressionado varia a projecao
    if(mouseButton == LEFT){
      ortho(-mouseX/2, mouseY/2, -height/4, height/4);
    }
  }
  fill(0, 255, 0);
  sphere(60); 
}
