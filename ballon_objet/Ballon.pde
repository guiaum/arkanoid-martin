class Ballon {

  Body body;
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int r = 10;

  Ballon() {
    c=color(255);
    xpos=width/2;
    ypos=height/4;
    xspeed=1;
    makeBody(r, xpos, ypos);
  }

 void display() {
    // We look at each body and get its screen position
    Vec2 pos = monMonde2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(c);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    // Let's add a line so we can see the rotation
    line(0,0,r,0);
    popMatrix();
  }

  void makeBody(float r, float x, float y ) {

    // Define a body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    // Set its position
    bd.position = monMonde2d.coordPixelsToWorld(x, y);
    body = monMonde2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = monMonde2d.scalarPixelsToWorld(r);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 2;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(-5, 5), random(-5, -5)));
    body.setAngularVelocity(random(-1, 1));
  }
}

