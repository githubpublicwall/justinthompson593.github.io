clear all;close all;clc

%{

Visualizing eigenvectors in the plane

%}
%{

We're going to see how multiplying a vector by 
a matrix is the same thing as moving a point 

For instance, 
%}

%This matrix
M = [1 -1;1 3/2];

%tells this point
startPoint = [1; 0];

%to go here
endPoint = M*startPoint; %via multiplication by M.

% Let's look.
scatter(startPoint(1),startPoint(2),100,'b','filled')
hold on
scatter(endPoint(1),endPoint(2),100,'r','filled')
axis equal
axis([-2 2 -2 2])


%%
% Whereas this matrix
difrntMtx = rand(2,2);

% tells the same point to go somewhere else...with a VERY 
% high probability. It might be that [0 -1;1 0] = rand(2,2)
% here. Anyway...

newPoint = difrntMtx*startPoint;


% Take a look

hold on
scatter(newPoint(1),newPoint(2),100,'c','filled')


%%

%{
Let's make the unit cricle, S_2 (or "the unit sphere in R^2" 
if you're mathy, hence the name S_2). We can do this by 
taking the real and imaginary values of the complex exponential. 
Below, we write "i" as the the imaginary unit, sqrt(-1). 
We can do that easily by using 
Euler's formula:

        e^(i*t) = cos(t) + i*sin(t)         ...if this isn't familiar:
                                            http://en.wikipedia.org/wiki/Euler's_formula
                                    

Think about what's gonna happen when we take t from 0 to 2*pi.
When t = 0, we have

        e^(0) = cos(0) + i*sin(0)
              =   1    + i*0

So taking the real and imaginary parts of e^(i*t) as our
x and y axes, we get

                x=Real    y=Imag

        e^(0) = cos(0) + i*sin(0)
              =   1    + i*0

                x = 1    y = 0


Then as t gets bigger, we trace around the unit circle 
counterclockwise until t = 2*pi and we've traced out one
full circle. Doing this gives us something called a 
"parametrized curve." Feel free to google that. 

How do we know that it traces the unit circle? Well,
what's the length of a vector in the plane that has 
coordinates x = cos(t) and y = sin(t)?

Let v = [cos(t) ; sin(t)]. Since the length of v is 
given by

        |v| = cos(t)^2 + sin(t)^2
            = 1

for every t, we can see that taking the real and 
imaginary parts of e^(i*t) as our x and y coordinates
will always have length 1. Therefore, v = [cos(t);sin(t)]
is on the unit circle. 

Check it out:
%}
%%
t = 0:0.01:2*pi;    %The interval [0, 2*pi] chopped into 
                    %1/100ths

% Throw [0, 2*pi] into the complex exponential e^(i*pi)
theSquareRootOfNegativeOne = complex(0,1);
e_super_it = exp(theSquareRootOfNegativeOne*t);

% Get your x's
xCoords = real(e_super_it);

% Get your y's
yCoords = imag(e_super_it);


%{
In order to simplify calculations, we'll throw
all of the points of the unit sphere into our matrix,
appropriately named
%}

S2 = [xCoords;yCoords];


% Plot 'em
plot(S2(1,:),S2(2,:),'-b','LineWidth',2)
axis equal


%% 

% Let's see what our original matrix M does to the
% unit circle

imageOfS2underM = M*S2;
plot(imageOfS2underM(1,:),imageOfS2underM(2,:),'-r','LineWidth',2);


%%

% how about the random matrix?
imageOfS2underRnd = difrntMtx*S2;
plot(imageOfS2underRnd(1,:),imageOfS2underRnd(2,:),'-c','LineWidth',2);


%% 
% You can run this block to get more
difrntMtx = rand(2,2);
imageOfS2underRnd = difrntMtx*S2;
plot(imageOfS2underRnd(1,:),imageOfS2underRnd(2,:),'-c','LineWidth',2);

%%

close all
plot(S2(1,:),S2(2,:),'-b','LineWidth',2);
axis([-1.2 1.2 -1.2 1.2])
axis equal
hold on
%%
singularMatrix = [.473 .172; .946 .344];

checkIt = det(singularMatrix);

display(['the determinant of our singular matrix is: ' num2str(checkIt)])
display(['and this machine can only calculate to   :  ' num2str(eps)])


% So what does a singular matrix do to S2?

imOfS2Sing = singularMatrix*S2;
plot(imOfS2Sing(1,:),imOfS2Sing(2,:),'-m','LineWidth',2);


%%

k = 3:0.1:1;

for i = 1:length(k)

sing2 = [k(i) 2;2 4];
sing2S = sing2*S2;
plot(sing2S(1,:),sing2S(2,:),'-m','LineWidth',2);

end










































