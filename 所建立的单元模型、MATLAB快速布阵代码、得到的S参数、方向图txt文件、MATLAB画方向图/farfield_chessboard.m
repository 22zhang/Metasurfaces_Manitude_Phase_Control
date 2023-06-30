%导入数据

% 读取远场方向图数据
data = importdata('棋盘阵列四波束.txt');

% 提取所需数据
theta = data(:, 1);           % Theta 角度
phi = data(:, 2);             % Phi 角度
D = data(:, 3);       % 幅度

% 由于从CST导出的数据中phi只能从0取到358，
%%% 导致3D图出现不闭合现象，需人为填补数据
theta = [theta; theta(phi==0)];
phi = [phi; phi(phi==0)+360];
D = [D; D(phi==0)];
D(theta >= 0 & theta <= 15) = -50;

% small_value = -50;
% phi_range1 = phi >= 0 & phi <= 30;
% phi_range2 = phi >= 60 & phi <= 120;
% phi_range3 = phi >= 155 & phi <= 210;
% phi_range4 = phi >= 240 & phi <= 300;
% phi_range5 = phi >= 330 & phi <= 360;
% 
% D(phi_range1 | phi_range2 | phi_range3 | phi_range4 | phi_range5) = small_value;


figure;
% subplot(121);
hsp = patternCustom(D, theta, phi);
set(gca, 'fontsize', 15, 'fontname','Times');
% rotate(hsp, [1 0 0], 90);  % 旋转方向图
% 转换为矩阵形式
theta_list = unique(theta);
M = length(theta_list);
phi_list = unique(phi);
N = length(phi_list);
D_mat = reshape(D, M, N);
% %绘图
% subplot(122);
% imagesc(phi_list, theta_list, D_mat);
% colormap('jet'); colorbar;
% xlabel('Phi'); ylabel('Theta')
% set(gca, 'fontsize', 15, 'fontname','Times');
