[~, colors] = plotrc();

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

function relocateBars(b, x1_vals, x2_vals)
    for col = 1:length(b)
        b(col).XData = b(col).XData - col + x2_vals(col);
        for row = 1:length(x1_vals)
            idx = (row - 1)*6 + (1:6);
            b(col).YData(idx, :) = b(col).YData(idx, :) - row + x1_vals(row);
        end
    end
end

function plotPMF(pmf, x1_vals, x2_vals)
    figure;
    [~, colors] = plotrc();
    b = bar3(pmf);
    set(b, 'FaceColor', hex2rgb(colors("Red1")));
    set(gca,'XLim',[x2_vals(1)-0.5 x2_vals(end)+0.5],'XTick',x2_vals)
    set(gca,'YLim',[x1_vals(1)-0.5 x1_vals(end)+0.5],'YTick',x1_vals)
    xticklabels(x2_vals);
    yticklabels(x1_vals);
    relocateBars(b, x1_vals, x2_vals);
end

%% Calculations

joint_pmf = [1/8, 0, 1/4; 0, 1/8, 1/4; 1/8, 0, 1/8];
x1_vals =[0,1,2];
x2_vals =[0,1,2];
[X1, X2] = ndgrid(x1_vals, x2_vals);

% (a) Marginal PMFs
px1 = sum(joint_pmf, 2); % Sum over axis 2 (rows)
px2 = sum(joint_pmf, 1); % Sum over axis 1 (cols)

% (b) conditional 
px2_given_any_x1 = joint_pmf ./ px1;
% given x1 = 1
px2_given_particular_x1 = px2_given_any_x1(x1_vals == 1,:);

% (c) mean 
mean_x1 = x1_vals * px1;
mean_x2 = x2_vals * px2';
meanVector = [mean_x1, mean_x2];

% (c) auto-covariance matrix
y1_vals = x1_vals - mean_x1;
y2_vals = x2_vals - mean_x2;

Cxx = zeros(2,2);
for i = 1:numel(y1_vals)
    for j = 1:numel(y2_vals)
        Cxx = Cxx + [y1_vals(i); y2_vals(j)] * ...
            [y1_vals(i), y2_vals(j)] * joint_pmf(i,j);
    end
end

%% Joint PMF
plotPMF(joint_pmf, x1_vals, x2_vals);
xlabel('$X_2$','Interpreter','latex');
ylabel('$X_1$','Interpreter','latex');
zlabel('$p_{\mathbf{X}}[x_1, x_2]$','Interpreter','latex');
export(gcf, "JointPMF.pdf");
export(gcf, "JointPMF_L.pdf", [7.2 7.2]);

%% Marginal PMF of X2

figure;
b = bar3(joint_pmf', "stacked");
yticklabels(x2_vals);
set(b, 'FaceColor', hex2rgb(colors("Red1")));
ylabel('$X_2$','Interpreter','latex');
zlabel('$p_{X_2}[x_2]$','Interpreter','latex');
view(-135,30)
export(gcf, "MarginalPMF-X2.pdf");

%% Marginal PMF of X1

figure;
b = bar3(joint_pmf, "stacked");
yticklabels({'0','1','2'});
ylabel('$X_1$','Interpreter','latex');
zlabel('$p_{X_1}[x_1]$','Interpreter','latex');
set(b, 'FaceColor', hex2rgb(colors("Red1")));
view(-45,30)
export(gcf, "MarginalPMF-X1.pdf");

%% Conditional PMF X2|X1 where X1 = 1

plotPMF(px2_given_particular_x1, x2_vals, 1)
zlabel('$p_{X_2|X_1}[x_2|x_1=1]$','Interpreter','latex');
xlabel('$X_1$','Interpreter','latex');
ylabel('$X_2$','Interpreter','latex');
view(-135,30)
export(gcf, "ConditionalPMF-X2X1.pdf", [7.2 7.2]);

%% Mean Vector

plotPMF(joint_pmf, x1_vals, x2_vals)
xlabel('$X_2$','Interpreter','latex');
ylabel('$X_1$','Interpreter','latex');
zlabel('$p_{\mathbf{X}}[x_1, x_2]$','Interpreter','latex');
hold on;
m_height = 0.2; % Doesnt matter
stem3(meanVector(2), meanVector(1), m_height, 'filled', Marker="none", Color=colors("Blue1"), LineWidth=3)

xl = xlim;
yl = ylim;
% Line from stem base to the Y-axis edge
plot3([meanVector(1), xl(1)], [meanVector(2), meanVector(2)], [0, 0], Color=colors("Blue1"));
% Line from stem base to the X-axis edge
plot3([meanVector(1), meanVector(1)], [meanVector(2), yl(2)], [0, 0], Color=colors("Blue1"));
export(gcf, "PMFWithMeanStem.pdf", [7.2 7.2]);
