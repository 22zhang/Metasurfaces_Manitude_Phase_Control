% ��������
%��������

% ��ȡԶ������ͼ����
data = importdata('��׼Զ��ͼ1.txt');
% ��ȡ��������
theta = data(:, 1);           % Theta �Ƕ�
phi = data(:, 2);             % Phi �Ƕ�
D = data(:, 3);       % ����
%���ڴ�CST������������phiֻ�ܴ�0ȡ��358��
%%% ����3Dͼ���ֲ��պ���������Ϊ�����
theta = [theta; theta(phi==0)];
phi = [phi; phi(phi==0)+360];
D = [D; D(phi==0)];
figure;

% small_value1 = -50;
% phi_range1 = theta >= 30& theta <= 150;
% 
% D(phi_range1|phi_range2 ) = small_value1;


hsp = patternCustom(D, theta, phi);
set(gca, 'fontsize', 15, 'fontname','Times');
% rotate(hsp, [1 0 0], 90);  % ��ת����ͼ
% ת��Ϊ������ʽ
theta_list = unique(theta);
M = length(theta_list);
phi_list = unique(phi);
N = length(phi_list);
D_mat = reshape(D, M, N);
