[rc, colors] = plotrc();

function export(gcf, filename, size_cm)
    arguments
        gcf
        filename (1,1) string
        size_cm (1,2) double = [6 6]
    end
    fig = gcf;
    fig.Units = 'centimeters';
    fig.Position(3:4) = size_cm; % 6x6 cm
    
    exportgraphics(fig, ...
        sprintf('../images/%s', filename),...
        Resolution=400, ...
        Padding=0 ...
    );
end

Country = ["Austria", "Poland", "Switzerland", "Hungary", "Spain", "Greece", "Portugal", "Denmark"];
Area = [83860, 312680, 41290, 93000, 504750, 132000, 92390, 43100];
Storks = [300, 30000, 150, 5000, 8000, 2500, 1500, 9];
Inhabitants = [7.6, 38, 6.7, 11, 39, 10, 10, 5.1];
ChildBirthRate = [87, 610, 82, 124, 439, 106, 120, 59];

figure;
scatter(ChildBirthRate, Storks, 'filled');
ylabel('Child Birth Rate (B)','Interpreter','latex');
xlabel('Storks (S)','Interpreter','latex');
export(gcf, "StorksOverBirth.pdf", [7.2,  7.2]);

corrcoef(ChildBirthRate, Storks)
corrcoef(Area, Storks)
