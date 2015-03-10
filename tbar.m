function tbar(y)
%TBAR Simple variant of the built-in bar function.
%   TBAR(Y) draws the elements of Y as N vertical bars.
%
%   TBAR uses the default colormap of the ggplot in R, and other parameters
%   such as a canvas margin are also setted to emulate the ggplot.
%
%   Example:
%
%       tbar([1 3 7 5 3]);
%
%   See also TBOXPLOT, TPLOT.

%   Copyright (c) 2015 Taehoon Lee

N = numel(y);
C = ggPalette(N);

hold on;
for i = 1:N
    bar(i, y(i), 'FaceColor', C(i,:), 'EdgeColor', C(i,:));
end
hold off;
box on;
set(gca, 'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'XTick', 1:N, 'YGrid', 'on', ...
    'FontName', 'Calibri', 'FontSize', 11);

axis tight;
canvas_wmargin = 0.05;
canvas_hmargin = 0.05;
canvas_axis = axis;
canvas_newsize = [canvas_axis(1) - (canvas_axis(2) - canvas_axis(1)) * canvas_wmargin, ...
canvas_axis(2) + (canvas_axis(2) - canvas_axis(1)) * canvas_wmargin, ...
canvas_axis(3) - (canvas_axis(4) - canvas_axis(3)) * canvas_hmargin, ...
canvas_axis(4) + (canvas_axis(4) - canvas_axis(3)) * canvas_hmargin];
if canvas_axis(3) >= 0
    canvas_newsize(3) = canvas_axis(3);
end

axis(canvas_newsize);