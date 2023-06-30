% 导入数据
%导入数据

% 读取远场方向图数据
data = importdata('分均匀分布.txt');
% 提取所需数据
theta = data(:, 1);           % Theta 角度
phi = data(:, 2);             % Phi 角度
D = data(:, 3);       % 幅度
%由于从CST导出的数据中phi只能从0取到358，
%%% 导致3D图出现不闭合现象，需人为填补数据
theta = [theta; theta(phi==0)];
phi = [phi; phi(phi==0)+360];
D = [D; D(phi==0)];
figure;

% small_value1 = -50;
% theta_range1 = theta >= 40& theta <= 60;
% theta_range2 = theta >= 0& theta <= 10;
% D(theta_range1|theta_range2 ) = small_value1;

% big_value1 = -1;
% theta_range1 = theta >= 0& theta <= 2;
% big_value2 = -5;
% theta_range2 = theta >= 2& theta <= 7;
% D(theta_range1) = big_value1;
% D(theta_range2) = big_value2;


hsp = patternCustom(D, theta, phi);
set(gca, 'fontsize', 15, 'fontname','Times');
% rotate(hsp, [1 0 0], 90);  % 旋转方向图
% 转换为矩阵形式
theta_list = unique(theta);
M = length(theta_list);
phi_list = unique(phi);
N = length(phi_list);
D_mat = reshape(D, M, N);
