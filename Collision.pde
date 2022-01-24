public class Collision  {

    public Collision () {
        
    }

    public boolean check(Ball ball1, Ball ball2){
        if ((dist(ball1.getX(),ball1.getY(), ball1.getZ(), ball2.getX(), ball2.getY(), ball2.getZ()) <= (ball1.getSize() + ball2.getSize()))){
            return true ;
        }else{
            return false;
        }
    }

    public Model collisn(Ball ball1, Ball ball2){

        float v1 = ((ball1.getMass() - ball2.getMass()) * ball1.getVelocity() + (2 * ball2.getMass() * ball2.getVelocity()))    / (ball1.getMass() + ball2.getMass());
        float v2 = ((ball2.getMass() - ball1.getMass()) * ball2.getVelocity() + (2 * ball1.getMass() * ball1.getAvgVelocity())) / (ball1.getMass() + ball2.getMass());

        return new Model(v1,v2);       

    }

}
