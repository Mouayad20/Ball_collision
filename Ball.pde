public class Ball{
    
    float x , y , z  , size ,mass,velocity,initVelocity,avgVelocity;
    
    PImage img;
    PShape spher;
    
    public Ball() {}
    public Ball(float x , float y ,float z, float size , String image,float mass) {
        this.img = loadImage(image);
        this.spher =  createShape(SPHERE, size ); 
        this.spher.setTexture(this.img);
        this.x = x;
        this.y = y;
        this.z = z;
        this.size = size ;
        this.mass = mass;
    }

    public void show() {
        
        pushMatrix();   
        translate(this.x,this.y,this.z);
        stroke(255);
        shape(this.spher);
        popMatrix();
        
    }
    
    public void show(float teta) {
        
        pushMatrix();   
                translate(this.x,this.y,this.z);
                rotateZ(teta);
                shape(this.spher);
        popMatrix();
        
    }

    public void stop() {
        
        pushMatrix();   
            translate(this.x,this.y,this.z);
        popMatrix();
        
    }
    
    public void trans() {
       
    }
    
    public void rot(float r) {
        pushMatrix();
        translate(this.x,this.y,this.z);
        stroke(255);

            rotateZ(r);
        popMatrix();
    }
    

    public float getVelocity() {
        return this.velocity;
    }

    public void setVelocity(float velocity) {
        this.velocity = velocity;
    }

    public float getInitVelocity() {
        return this.initVelocity;
    }

    public void setInitVelocity(float initVelocity) {
        this.initVelocity = initVelocity;
    }

    public float getAvgVelocity() {
        return this.avgVelocity;
    }

    public void setAvgVelocity(float avgVelocity) {
        this.avgVelocity = avgVelocity;
    }


    public float getMass() {
        return this.mass;
    }

    public void setMass(float mass) {
        this.mass = mass;
    }

    public float getX() {
        return this.x;
    }

    public void setX(float x) {
        this.x = x;
    }
    public float getZ() {
        return this.z;
    }

    public void setZ(float z) {
        this.z = z;
    }


    public float getY() {
        return this.y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getSize() {
        return this.size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public PImage getImg() {
        return this.img;
    }

    public void setImg(PImage img) {
        this.img = img;
    }

    public PShape getSpher() {
        return this.spher;
    }

    public void setSpher(PShape spher) {
        this.spher = spher;
    }
    
    
}
