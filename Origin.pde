ArrayList<Line> flake = new ArrayList<Line>();
ArrayList<Line> antiFlake = new ArrayList<Line>();
int step = 3;

void setup(){
    size(1200, 600);
    stroke(255);
    noLoop();

    final int len = width/2-100;
    createBaseFlake(flake, 50, 155, len, 1);
    createBaseFlake(antiFlake, width/2+50, 85, len, -1);    

    for(int a = 0; a < step; a++){
        goForward(flake);
        goForward(antiFlake);
    }
}

void createBaseFlake(ArrayList<Line> _flake, int startX, int startY, int _len, int dir){
    _flake.add(new Line(startX, startY, _len, 0, dir));
    _flake.add(new Line(startX, startY, _len, 60, -dir));
    _flake.add(new Line(startX+_len, startY, _len, 120, dir));
}

void draw(){
    background(50);

    for(int b = 0; b < flake.size(); b++){
        flake.get(b).display();
        antiFlake.get(b).display();
    }
}

void goForward(ArrayList<Line> _flake){
    Line tLine, oLine;

    for(int a = 0; a < _flake.size(); a += 4){
        oLine = _flake.get(a);
        _flake.remove(a);
        _flake.add(a, new Line(oLine.x1, oLine.y1, oLine.len/3, oLine.angle, oLine.dir));

        tLine = _flake.get(a);
        _flake.add(a+1, new Line(tLine.x2, tLine.y2, oLine.len/3, oLine.angle-60*oLine.dir, oLine.dir));

        tLine = _flake.get(a+1);
        _flake.add(a+2, new Line(tLine.x2, tLine.y2, oLine.len/3, oLine.angle+60*oLine.dir, oLine.dir));

        tLine = _flake.get(a+2);
        _flake.add(a+3, new Line(tLine.x2, tLine.y2, oLine.len/3, oLine.angle, oLine.dir));   
    }
}

void goBack(ArrayList<Line> _flake){
    Line oLine;

    for(int a = 0; a < _flake.size(); a++){
        oLine = _flake.get(a);
        _flake.subList(a, a+4).clear();
        _flake.add(a, new Line(oLine.x1, oLine.y1, oLine.len*3, oLine.angle, oLine.dir));  
    }
}

void keyPressed(){
    switch(key){
        case '+':
            if(step < 4){                
                goForward(flake);
                goForward(antiFlake);
                redraw();
                step++;
            }
            break;

        case '-':
            if(step > 0){
                goBack(flake);
                goBack(antiFlake);
                redraw();
                step--;
            }
            break;
    }
}