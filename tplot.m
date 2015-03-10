function tplot(x, y)
%TPLOT Simple variant of the built-in plot function.
%   TPLOT(X,Y) plots vector Y versus vector X. If Y is a matrix,
%   then the rows or columns of the matrix are plotted versus the vector X,
%   If both X and Y are a matrix, all pairs of individual rows in X and Y
%   are plotted.
%
%   TPLOT uses the default colormap of the ggplot in R, and other parameters
%   such as a canvas margin are also setted to emulate the ggplot.
%
%   Example:
%
%       x = 1:10;
%       tplot(x, [x.*log(x); x; log(x); sin(x); cos(x)]);
%
%   See also TBAR, TBOXPLOT.

%   Copyright (c) 2015 Taehoon Lee

if any(size(x)==1) % x: one vector
    if size(x, 1) > 1
        x = x';
    end
    if numel(x) ~= size(y, 2)
        y = y';
    end
else
    if any(size(y)==1) % x: vectors, y: one vector
        error('Data must be a single matrix Y or a list of pairs X and Y.');
    else % x: vectors, y: vectors
        if size(x, 1) ~= size(y, 1)
            error('The number of vectors must be the same.');
        end
    end
end

if size(x, 2) ~= size(y, 2)
    error('Vectors must be the same lengths.');
end

N = size(y, 1);
C = ggPalette(N);

hold on;
for i = 1:N
    if size(x, 1) > 1
        plot(x(i,:), y(i,:), 'Marker', 'o', 'LineWidth', 2, 'Color', C(i,:), 'MarkerFaceColor', C(i,:), 'MarkerSize', 5);
    else
        plot(x, y(i,:), 'Marker', 'o', 'LineWidth', 2, 'Color', C(i,:), 'MarkerFaceColor', C(i,:), 'MarkerSize', 5);
    end
end
hold off;
box on;
set(gca, 'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'YGrid', 'on', ...
    'FontName', 'Calibri', 'FontSize', 11);

axis tight;
canvas_wmargin = 0;
canvas_hmargin = 0.03;
canvas_axis = axis;
canvas_newsize = [canvas_axis(1) - (canvas_axis(2) - canvas_axis(1)) * canvas_wmargin, ...
canvas_axis(2) + (canvas_axis(2) - canvas_axis(1)) * canvas_wmargin, ...
canvas_axis(3) - (canvas_axis(4) - canvas_axis(3)) * canvas_hmargin, ...
canvas_axis(4) + (canvas_axis(4) - canvas_axis(3)) * canvas_hmargin];
axis(canvas_newsize);