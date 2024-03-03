function [p,pmax,pmin,pn]=improd(f,g)
%IMPROD Computes the product of two images.
% [P,PMAX,PMIN,PN]=IMPROD(F,G) outputs the
% element-by-element product of two images,
% F and G, the product maximum and minimum
% values, and a normalized product array with
% values in the range [0,1]. The input images
% must be of the same size. They can be of
% class uint8, uint 16, or double. The outputs
% are of class double.
fd=double(f);
gd=double(g);
p=fd.*gd;
pmax=max(p(:));
pmin=min(p(:));
pn=mat2gray(p);