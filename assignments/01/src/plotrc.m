function [rc, colors] = plotrc
    % Rosepine
    colors = dictionary( "Font", "#000000", ...
        "Background", "#ffffff", ...
        "Accent", "#286983", ...
        "Gray1", "#cecacd", ...
        "Gray2", "#9893a5", ...
        "Red1", "#b4637a", ...
        "Red2", "#d7827e", ...
        "Blue1", "#286983", ...
        "Blue2", "#56949f", ...
        "Magenta1", "#575279", ...
        "Magenta2", "#907aa9" ...
    );
    
    k = ["width", "height", "lineWidth", "fontName", "fontSize"];
    rc = dictionary(k, {.5, 3.0, 2, "Times New Roman", 12});
    
    hexColors = [colors("Blue1"); colors("Red1"); colors("Magenta1")];
    rgbMatrix = cell2mat(arrayfun(@(x) sscanf(x, '#%2x%2x%2x').'/255, hexColors, 'UniformOutput', false));
    
    % Apply it globally
    set(groot, 'defaultAxesColorOrder', rgbMatrix)

    % Override Default Axes Settings
    set(groot, 'defaultAxesBox', 'on');
    set(groot, 'defaultAxesColor', 'w');
    set(groot, 'defaultAxesXColor', colors("Font"));
    set(groot, 'defaultAxesYColor', colors("Font"));
    set(groot, 'defaultAxesTickDir', 'in');
    set(groot, 'defaultAxesTickLength', [0.01, 0.01]);
    set(groot, 'defaultAxesXMinorTick', 'on');
    set(groot, 'defaultAxesYMinorTick', 'on');
    set(groot, 'defaultAxesXGrid', 'on');
    set(groot, 'defaultAxesYGrid', 'on');
    set(groot, 'defaultAxesGridLineStyle', ':');
    set(groot, 'defaultAxesGridAlpha', 0.3);
    set(groot, 'defaultAxesFontName', rc{"fontName"});
    set(groot, 'defaultAxesFontSize', rc{"fontSize"});
    set(groot, 'defaultAxesLineWidth', 1);
    set(groot, 'defaultLineLineWidth', rc{"lineWidth"});
    set(groot, 'defaultAxesColorOrder', rgbMatrix);
end

function example
    [rc, colors] = plotrc();

    fig = figure('Units', 'inches', 'Position', [2, 2, rc("width"), rc("height")]);
    
    x = linspace(0, 10, 100);
    y1 = sin(x);
    y2 = cos(x);
    
    hold on;
    p1 = plot(x, y1, 'Color', colors("Blue1"), 'LineWidth', rc("lineWidth"), 'LineStyle', '-');
    p2 = plot(x, y2, 'Color', colors("Red1"), 'LineWidth', rc("lineWidth"), 'LineStyle', '--');
    hold off;
    
    ax = gca;
    set(ax, 'XLabel', text('String', 'Time (s)', 'FontName', rc("fontName"), 'FontSize', fontSize));
    set(ax, 'YLabel', text('String', 'Amplitude (V)', 'FontName', rc("fontName"), 'FontSize', fontSize));
    title('System Response', 'FontName', rc("fontName"), 'FontSize', rc("fontSize"), 'FontWeight', 'bold');
    
    lgd = legend([p1, p2], {'Channel A', 'Channel B'}, ...
        'Location', 'best', ...
        'FontName', rc("fontName"), ...
        'FontSize', rc("fontSize")-1 ...
    );
    set(lgd, 'EdgeColor', colors("Gray2"), 'Color', colors("Background"));
    
    exportgraphics(fig, 'publication_figure.pdf', 'ContentType', 'vector');
end