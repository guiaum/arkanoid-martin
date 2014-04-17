import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing monMonde2d;

Ballon myBallon;
Boundary myBoundary;

void setup() {
  size(150, 300);

  monMonde2d = new Box2DProcessing(this);
  monMonde2d.createWorld();
    myBallon = new Ballon();
    myBoundary = new Boundary(width/2,300,150,10);

}
void draw() {
  background(255);
  monMonde2d.step();
  myBallon.display();
  myBoundary.display();
}

