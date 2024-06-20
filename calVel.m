function vel = calVel(x1,x2,y1,y2,t1,t2)
dx = x1 -x2;
dy = y1 -y2;
length = sqrt(dx*dx + dy*dy);
length = length /1000;
dt = (t2 - t1) *24;
vel = length /dt;
end