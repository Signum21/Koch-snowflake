class Line{
    final float x1, y1, x2, y2, len;
    final int angle, dir;

    Line(float _x1, float _y1, float _len, int _angle, int _dir){
        x1 = _x1;
        y1 = _y1;
        len = _len;
        angle = _angle; 
        dir = _dir;
        x2 = x1 + cos(radians(angle)) * len;
        y2 = y1 + sin(radians(angle)) * len;
    }

    void display(){
        line(x1, y1, x2, y2);
    }
}