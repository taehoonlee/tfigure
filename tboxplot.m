function tboxplot(X)
%TBOXPLOT Simple variant of the built-in boxplot function.
%   TBOXPLOT(X) produces a box plot of the data in X.
%
%   TBOXPLOT uses the default colormap of the ggplot in R.
%
%   Example:
%
%       X = chi2rnd(1,100,10);
%       tboxplot(X);
%
%   See also TBAR, TPLOT.

%   Copyright (c) 2015 Taehoon Lee

N = size(X, 2);
C = ggPalette(N);

boxplot(X, 'colors', zeros(N,3), 'labels', [], 'symbol', 'ko', 'outliersize', 2);

h = findobj(gca, 'tag', 'Outliers');
set(h, 'MarkerEdgeColor', [.2 .2 .2]);
set(h, 'MarkerFaceColor', [.2 .2 .2]);
h = findobj(gca, 'tag', 'Box');
xdata_box = get(h, 'XData');
ydata_box = get(h, 'YData');
h = findobj(gca, 'tag', 'Median');
xdata_med = get(h, 'XData');
ydata_med = get(h, 'YData');
for i = 1:N
    rectangle('Position', [xdata_box{N+1-i}(1), ydata_box{N+1-i}(1), xdata_box{N+1-i}(3)-xdata_box{N+1-i}(2), ydata_box{N+1-i}(2)-ydata_box{N+1-i}(1)], 'FaceColor', C(i,:), 'EdgeColor', [0 0 0]);
    line(xdata_med{N+1-i}, ydata_med{N+1-i}, 'LineWidth', 2, 'Color', [0 0 0]);
end

set(gca, 'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'YGrid', 'on', ...
    'FontName', 'Calibri', 'FontSize', 11);