%%Jacobian matrix
clear all
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);

q=[0 pi pi/2];

J=jacob0(Robot,q)