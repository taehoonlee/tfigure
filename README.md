# tfigure
MATLAB figures like ggplot in R<br />
Copyright (c) 2015 Taehoon Lee

# Functions
tbar: simple variant of the built-in bar function. <br />
tboxplot: simple variant of the built-in bar function. <br />
tplot: simple variant of the built-in plot function. <br />

# Examples
t = (0:0.1:3) * pi;<br />
X = [0.6 * sin(t); 0.8 * sin(t+5)+0.1; sin(t+10)+0.2];<br />
figure;<br />
subplot(1,3,1), tplot(t, X);<br />
subplot(1,3,2), tbar(sum(abs(X),2));<br />
subplot(1,3,3), tboxplot(X');<br />