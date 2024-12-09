clear all
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1)= Link([0 L_1 0 pi/2]);
L(2)= Link([0 0 L_2 0]);
L(3)= Link([0 0 L_3 0]);

Robot=SerialLink(L);

Tout=[pi/2 -pi/6 -pi/4];
q0=[0 0 0];
Jf=Robot.fkine(Tout);
Ji=Robot.ikine(Tout,'mask', [1 1 1 0 0 0]);


time= 0:0.15:3;
Q=jtraj(q0, Tout, time);
Tr=fkine(Robot,Q);

for i=1:1:length(time)
    T=Tr(i);
    trs=transl(T);
    xx(i)=trs(1);
    yy(i)=trs(2);
    zz(i)=trs(3);
end

plot(Robot,Q);
hold on 
plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)