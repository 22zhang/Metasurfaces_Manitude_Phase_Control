%��������

% ��ȡԶ������ͼ����
data = importdata('���������Ĳ���.txt');

% ��ȡ��������
theta = data(:, 1);           % Theta �Ƕ�
phi = data(:, 2);             % Phi �Ƕ�
D = data(:, 3);       % ����

% ���ڴ�CST������������phiֻ�ܴ�0ȡ��358��
%%% ����3Dͼ���ֲ��պ���������Ϊ�����
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
% rotate(hsp, [1 0 0], 90);  % ��ת����ͼ
% ת��Ϊ������ʽ
theta_list = unique(theta);
M = length(theta_list);
phi_list = unique(phi);
N = length(phi_list);
D_mat = reshape(D, M, N);
% %��ͼ
% subplot(122);
% imagesc(phi_list, theta_list, D_mat);
% colormap('jet'); colorbar;
% xlabel('Phi'); ylabel('Theta')
% set(gca, 'fontsize', 15, 'fontname','Times');
