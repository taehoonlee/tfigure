# tfigure
MATLAB figures like ggplot in R

# Functions
tbar: simple variant of the built-in bar function.
tboxplot: simple variant of the built-in bar function
tplot: simple variant of the built-in plot function

# Examples
t = (0:0.1:3)*pi;
X = [0.6*sin(t); 0.8*sin(t+5)+0.1; sin(t+10)+0.2];
figure;
subplot(1,3,1), tplot(t, X);
subplot(1,3,2), tbar(sum(abs(X),2));
subplot(1,3,3), tboxplot(X');

Copyright (c) 2015 Taehoon Lee