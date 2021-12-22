%%
n = 0;
while true

%rectangle
x = [0,0,7,7,0];
y = [0,18,18,0,0];
title('Fady Mohamed');
plot(x,y,'k');
fill(x,y,[0,0,0]);
xlim([-10 20]);
ylim([-10 20]);

hold on;
x = [2.5,4.5,4.5, 2.5,2.5];
y = [0  ,0 ,-3.5, -3.5,0];
plot(x,y,'k');
fill(x,y,[0.4660 0.6740 0.1880]);
hold on;


%Circle
for z = 1:3 
r = 2;
a = 0:0.1:2*pi;
x = r*sin(a)+3.5;
y = r*cos(a)+(z*5);
plot(x,y,'k');
hold on;
end

fill(r*sin(a)+3.5,r*cos(a)+(3*5),[0.2,0,0]);
fill(r*sin(a)+3.5,r*cos(a)+(2*5),[0.2,0.2,0]);
fill(r*sin(a)+3.5,r*cos(a)+(1*5),[0,0.2,0]);


switch n
    case 0
        fill(r*sin(a)+3.5,r*cos(a)+(3*5),[1,0,0]);
        pause(3);
        fill(r*sin(a)+3.5,r*cos(a)+(3*5),[1,1,1]);
        n = 1;
    case 1
        fill(r*sin(a)+3.5,r*cos(a)+(2*5),[1,1,0]);
        pause(3);
        fill(r*sin(a)+3.5,r*cos(a)+(2*5),[1,1,1]);
        n = 2;
    case 2
        fill(r*sin(a)+3.5,r*cos(a)+(1*5),[0,1,0]);
        pause(3);
        fill(r*sin(a)+3.5,r*cos(a)+(1*5),[1,1,1]);
        n = 3;
    otherwise
        n = 0;
end

end
        
