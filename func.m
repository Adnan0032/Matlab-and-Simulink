f=imread('leadspace.jpeg');
size(f);
[M,N]=size(f);
whos f;
imshow(f);
imwrite(f, 'patient10_run1', 'jpg');
imwrite(f, 'leadspace.jpeg', 'quality', q);