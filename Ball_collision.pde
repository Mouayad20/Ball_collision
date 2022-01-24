boolean  collision1 = false ,  isVel1NegAfterColsi = true,noCollision = true;
float  k = 0.299719 , t = 0.025,tta = -1.5, mio = 0.4 , g = 9.8,v1PosAfterColl,tetaOld1 = 0 ,tetaOld2 = 0, tetaNew1 = 0 ,tetaNew2 = 0  ;
float eyeX = 100 , eyeY = -10 , eyeZ = 150;  
float eyeX1 , eyeY1 , eyeZ1;  
Ball  ball1;
Ball  ball2;
Model model;
String ground = "steel";
Collision collision;

void setup() { 
    frameRate(40);
    size(1800,750,P3D);
    
    model = new Model();
    collision = new Collision();
    
    float r1 = 0.11 * 100  ;
    float r2 = 0.11 * 100  ;
    ball1 = new Ball(0     , -r1 , 0 , r1 , "images\\wood.jpg"    , 0.450  );
    ball2 = new Ball(50    , -r2 , 0 , r2 , "images\\steel.jpg"   , 0.450  );
     
    ball1.setInitVelocity(500); 
    ball2.setInitVelocity(0);
    
    ball1.setVelocity(ball1.getInitVelocity());
    ball2.setVelocity(ball2.getInitVelocity());
}


void draw() { 
    camera(eyeX,eyeY,eyeZ,eyeX + cos(tta),eyeY,eyeZ + sin(tta),0f,1f,0f);
    background(125);
    println("\n______________________\n");
    println("ball 1 velocity :: " + ball1.getVelocity() + "\t  x position  : " + ball1.getX());
    println("ball 2 velocity :: " + ball2.getVelocity() + "\t  x position  : " + ball2.getX());
    
    
    ball1.show(tetaNew1);
    ball2.show(tetaNew2);

    
    
        
    if (collision.check(ball1,ball2) ) {
        
        println("\nColision");
        model = collision.collisn(ball1,ball2);

        collision1  = true;
        noCollision = false;
        
    } if (noCollision) {
        
        println("\nNotColision");
        
        if (ball1.getVelocity() <= 0) {
            ball1.stop();
        } else{
            ball1.setAvgVelocity(ball1.getVelocity());
            ball1.setVelocity((((((( -k) * 3.14 * pow(ball1.getSize()/100,2) * pow(ball1.getAvgVelocity(),2) - (mio * ball1.getMass() * g)))  / ball1.getMass()) * t)   + ball1.getAvgVelocity()));
            ball1.setX((ball1.getVelocity() * t) + ball1.getX() );
            tetaNew1 = (-1)*(((ball1.getVelocity()* t )/(ball1.getSize()/100))+tetaOld1);
        }
        
        if (ball2.getVelocity() <= 0) {
            ball2.stop();
        } else{
            ball2.setAvgVelocity(ball2.getVelocity());
            ball2.setVelocity((((((( -k) * 3.14 * pow(ball2.getSize()/100,2)  * pow(ball2.getAvgVelocity(),2) - (mio * ball2.getMass() * g))) / ball2.getMass()) * t)   + ball2.getAvgVelocity()));
            ball2.setX((ball2.getVelocity() * t) + ball2.getX());
            tetaNew2 = (-1)*(((ball2.getVelocity()* t )/(ball2.getSize()/100))+tetaOld2);
        }
    }
    
    if (collision1) {
        if (model.getV1() <= 0) {
            if (isVel1NegAfterColsi) {
                v1PosAfterColl = abs(model.getV1());
                isVel1NegAfterColsi = false;
            }
            ball1.setAvgVelocity(model.getV1());
            ball1.setVelocity((((((( -k) * 3.14 * pow(ball1.getSize()/100,2)  *pow(ball1.getAvgVelocity(),2) - (mio * ball1.getMass() * g)))  / ball1.getMass()) * t)   + ball1.getAvgVelocity()));
            float vi = (((((( -k) * 3.14 * pow(ball1.getSize()/100,2)  * v1PosAfterColl * v1PosAfterColl - (mio * ball1.getMass() * g)))  / ball1.getMass()) * t)   + v1PosAfterColl);
            v1PosAfterColl = vi;
            if (v1PosAfterColl <= 0) {
                ball1.setX(ball1.getX());
            }
            else{
                ball1.setX((ball1.getVelocity() * t) + ball1.getX());
                tetaNew1 = (((v1PosAfterColl* t )/(ball1.getSize()/100))+tetaOld1);
            }
        } else{
            ball1.setAvgVelocity(model.getV1());
            ball1.setVelocity((((((( -k) * 3.14 * pow(ball1.getSize()/100,2)  * pow(ball1.getAvgVelocity(),2) - (mio * ball1.getMass() * g)))  / ball1.getMass()) * t)   + ball1.getAvgVelocity()));
            model.setV1(ball1.getVelocity());
            ball1.setX((ball1.getVelocity() * t) + ball1.getX());
            tetaNew1 = (-1)*(((ball1.getVelocity()* t )/(ball1.getSize()/100))+tetaOld1);
        }
        if (model.getV2()<= 0) {
            ball2.setAvgVelocity(model.getV2());
            ball2.setVelocity((((((( -k) * 3.14 * pow(ball2.getSize()/100,2)  * pow(ball2.getAvgVelocity(),2) - (mio * ball2.getMass() * g))) / ball2.getMass()) * t)   + ball2.getAvgVelocity()));
            ball2.setX(( -1) * (ball2.getVelocity() * t) + ball2.getX());
            tetaNew2 = (-1)*(((ball2.getVelocity()* t )/(ball2.getSize()/100))+tetaOld2);
        } else{
            ball2.setAvgVelocity(model.getV2());
            float vvv = (((((( -k) * 3.14 * pow(ball2.getSize()/100,2)  * pow(ball2.getAvgVelocity(),2) - (mio * ball2.getMass() * g))) / ball2.getMass()) * t)   + ball2.getAvgVelocity());
            ball2.setVelocity(vvv);
            model.setV2(vvv);
            ball2.setX((ball2.getVelocity() * t) + ball2.getX());
            tetaNew2 = (-1)*(((ball2.getVelocity()* t )/(ball2.getSize()/100))+tetaOld2);
        }
    }
    
    if (key == 'w' && keyPressed) {
        beginCamera();
        eyeX1 += cos(tta) * 10;
        eyeZ1 += sin(tta) * 10;
        eyeX = eyeX1;
        eyeZ = eyeZ1;
        endCamera();
    }
    if (key == 'a' && keyPressed) {
        beginCamera();
        tta  -=  0.05;
        endCamera();
    }
    if (key == 'd' && keyPressed) {
        beginCamera();
        tta += 0.05;
        endCamera();
    }
    if (key == 's' && keyPressed) {
        beginCamera();
        eyeX1 -= cos(tta) * 10;
        eyeZ1 -= sin(tta) * 10;
        eyeX = eyeX1;
        eyeZ = eyeZ1;
        endCamera();
    }
    if (key == 'q' && keyPressed) {
        beginCamera();
        eyeY -= 10;
        endCamera();
    }
    if (key == 'e' && keyPressed) {
        beginCamera();
        eyeY += 10;
        endCamera();
    }
    // if (key == 'z' && keyPressed) {
    //     beginCamera();
    //         rotateX( 20);
    //     endCamera();
// }
    if (key == 'z' && keyPressed) {
        beginCamera();
        rotateX(20);
        endCamera();
    }
    
    
    
    
    
    pushMatrix();
    if(ground == "wood"){

        fill(133,94,66);
    }if(ground == "steel"){
        fill(224,200,219);
    }
    beginShape(); 
    vertex( -3500  ,   ball1.getSize()  , -3500);
    vertex(3500    ,   ball1.getSize()  , -3500);
    vertex(3500    ,   ball1.getSize()  ,  3500);
    vertex( -3500  ,   ball1.getSize()  ,  3500);
    endShape();
    popMatrix();
    
    // pushMatrix(); 
    // fill(125,45,0);  
    // box(7000);
    // popMatrix();
}