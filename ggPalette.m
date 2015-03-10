function rgb = ggPalette(N)
%GGPALETTE Colormap of the ggplot in R.
%   GGPALETTE(N) generates the default colormap of the ggplot in R.
%
%   GGPALETTE adjusts the hcl2rgb function to emulate the ggplot in R.
%   (https://github.com/nickjhughes/hclmat/blob/master/hcl2rgb.m)
%
%   Example:
%
%       N = 5;
%       image(1:N);
%       colormap(ggPalette(N));
%
%   See also TBAR, TBOXPLOT, TPLOT.

%   References: http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/

%   Copyright (c) 2015 Taehoon Lee

h = (15:360/N:360)';

WHITE_Y = 100.000;
WHITE_u = 0.1978398;
WHITE_v = 0.4683363;

L = 65;
U = 100 * cosd(h);
V = 100 * sind(h);

Y = WHITE_Y * ((L + 16)/116)^3;
u = U/(13*L) + WHITE_u;
v = V/(13*L) + WHITE_v;
X = (9.*Y.*u) ./ (4.*v);
Z = -X/3 - 5*Y + 3*Y./v;

% Now convert to sRGB
r = gamma_correct((3.240479*X - 1.537150*Y - 0.498535*Z)./WHITE_Y);
g = gamma_correct((-0.969256*X + 1.875992*Y + 0.041556*Z)./WHITE_Y);
b = gamma_correct((0.055648*X - 0.204043*Y + 1.057311*Z)./WHITE_Y);

% Round to integers and correct
rgb = round(255 * [r, g, b]);
rgb(rgb > 255) = 255;
rgb(rgb < 0) = 0;
rgb = rgb / 255;

function u = gamma_correct(u)
idx = u > 0.00304;
u(idx) = 1.055*u(idx).^(1/2.4) - 0.055;
u(~idx) = 12.92*u(~idx);