clear all;
close all;
x = [0.1:1/22:1];
d = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;
figure(1);
plot (x,d,'r'); 
grid on;

c1 = 0.191;
c2 = 0.918;
r1 = 0.17;
r2 = 0.18;
w0 = rand(1);
w1 = rand(1);
w2 = rand(1);
n = 0.2;

for i = 1:10000
    for a = 1:length(x)
        F_1 = exp(-((x(a) - c1)^2)/(2*r1^2));
        F_2 = exp(-((x(a) - c2)^2)/(2*r2^2));

        v = F_1*w1 + F_2*w2 + w0;
        y = v;

        e = d(a) - y  ;

        w1 = w1 + n*e*F_1;
        w2 = w2 + n*e*F_2;
        w0 = w0 + n*e;
    end
end

hold on;
    for a = 1:length(x)
        F_1 = exp(-((x(a) - c1)^2)/(2*(r1)^2));
        F_2 = exp(-((x(a) - c2)^2)/(2*(r2)^2));
        
        v = F_1*w1 + F_2*w2 + w0;
        y = v;
        
        plot (x(a), y,'black^');
    end




