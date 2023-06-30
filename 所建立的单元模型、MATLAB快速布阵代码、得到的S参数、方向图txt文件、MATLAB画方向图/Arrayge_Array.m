clc;
clear;
close all;

%�������ã�CST��Parameter listд����
sub_l = 2.8;
sub_w = 1.4;
sub_h = 1.52;
p1_w = 2.8;
p1_l = 0.3;
p1_h = 0.018;
p2_w = 0.5;
p2_l = 0.2;
R = 4.8;
L = 30*10^-12;
C = 0;
R1 = 0;
L1 = 30*10^-12;
C1 = 28*10^-15;
Frq=[22,33];


%·������
path=pwd;   %��ȡ��ǰm�ļ���·��������ע�⽫���õ�CSTģ�ͷŵ���m�ļ�һ���ļ�����
filename='\actual1_diode_1.cst';
fullname=[path filename];
cst = actxserver('CSTStudio.application');
mws = invoke(cst,'OpenFile',fullname);
app = invoke(mws,'GetApplicationName');
ver = invoke(mws,'GetApplicationVersion');
invoke(mws, 'DeleteResults');



%   ����ؼ�����
brick = invoke(mws,'Brick');
transform = invoke(mws,'Transform');
plot = invoke(mws,'Plot');
solid = invoke(mws,'Solid');
component = invoke(mws,'Component');
lumpedelement  = invoke(mws,'LumpedElement');



% �����С
m=16;
n=16;
% Ԥ�����õ��������У���ȻҲ������matlab�е�round��rand��m��n��������һ�������10*10��0,1����
matrix=importdata("D:\CST_work\m_store\������16_unit4.xlsx");

% 
% 
% ѭ�����룬������CST��transformһ�£�Ȼ��VBA�����Ӧctrl+v��������ת��Matlab����
for i=1:m
    for j = 1:n
        if(matrix(i,j)==0)       
            invoke(transform,'Reset');
            invoke(transform,'Name','lumpeditem$Folder1:0');
            invoke(transform,'AddName','solid$component0:ground');
            invoke(transform,'AddName','solid$component0:patch1');
            invoke(transform,'AddName','solid$component0:patch1_1');
            invoke(transform,'AddName','solid$component0:sub');
            invoke(transform,'Vector',(i-1)*sub_l,-j*sub_w,0);  %   Ҫ�޸ĵ�Ҳ����name��vector��vectorҪ��һ��
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');   %    �������Ҳ��һ����������ӦVBA����д��������
        else  % ����0����1������else����
            invoke(transform,'Reset');
            invoke(transform,'Name','lumpeditem$Folder1:1');
            invoke(transform,'AddName','solid$component1:ground');
            invoke(transform,'AddName','solid$component1:patch');
            invoke(transform,'AddName','solid$component1:patch2_1');
            invoke(transform,'AddName','solid$component1:sub');
            invoke(transform,'Vector',(i-1)*sub_l,-j*sub_w,0);
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False');
            invoke(transform, 'Transform', 'Mixed','Translate');
        end
    end
end

%�����ɾ��ԭʼ��ģ�Ϳ飬����������ô�Ƶģ�������Ҫɾ����Ҳ���ܲ�ɾ��
%invoke(component, 'Delete','component0');
%invoke(component, 'Delete', 'component1');


invoke(solid, 'Delete', 'component0:ground');
invoke(solid, 'Delete', 'component0:patch1');
invoke(solid, 'Delete', 'component0:patch1_1');
invoke(solid, 'Delete', 'component0:sub');
invoke(lumpedelement, 'Delete', 'Folder1:0');

invoke(solid, 'Delete', 'component1:ground');
invoke(solid, 'Delete', 'component1:patch');
invoke(solid, 'Delete', 'component1:patch2_1');
invoke(solid, 'Delete', 'component1:sub');
invoke(lumpedelement, 'Delete', 'Folder1:1');



% Solid.Delete "component0:ground" 
% Solid.Delete "component0:patch1" 
% Solid.Delete "component0:patch1_1" 
% Solid.Delete "component0:sub" 
% LumpedElement.Delete "Folder1:0" 

% Solid.Delete "component1:ground" 
% Solid.Delete "component1:patch" 
% Solid.Delete "component1:patch2_1" 
% Solid.Delete "component1:sub" 
% LumpedElement.Delete "Folder1:1" 



figure
imagesc(matrix)



