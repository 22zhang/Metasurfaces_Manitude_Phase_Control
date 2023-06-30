clc;
clear;
close all;

%�������ã�CST��Parameter listд����
sub_w= 5;
sub_h = 1.52;



%·������
path=pwd;   %��ȡ��ǰm�ļ���·��������ע�⽫���õ�CSTģ�ͷŵ���m�ļ�һ���ļ�����
filename='\multiple_bar.cst';
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
m=9;
n=9;
% Ԥ�����õ��������У���ȻҲ������matlab�е�round��rand��m��n��������һ�������10*10��0,1����
matrix=importdata("D:\CST_work\m_store\2-bit�Ǿ��ȱ���.xlsx");




% ѭ�����룬������CST��transformһ�£�Ȼ��VBA�����Ӧctrl+v��������ת��Matlab����
for i=1:m
    for j = 1:n
        if(matrix(i,j)==0)       
            invoke(transform,'Reset');
            invoke(transform,'Name','solid$component0:ground');
            invoke(transform,'AddName','solid$component0:patch');
            invoke(transform,'AddName','solid$component0:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   Ҫ�޸ĵ�Ҳ����name��vector��vectorҪ��һ��
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');   %    �������Ҳ��һ����������ӦVBA����д��������
        elseif(matrix(i,j)==1) % ����0����1������else����
            invoke(transform,'Name','solid$component1:ground');
            invoke(transform,'AddName','solid$component1:patch');
            invoke(transform,'AddName','solid$component1:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   Ҫ�޸ĵ�Ҳ����name��vector��vectorҪ��һ��
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');  
        elseif(matrix(i,j)==2) % ����0����1������else����
            invoke(transform,'Name','solid$component2:ground');
            invoke(transform,'AddName','solid$component2:patch');
            invoke(transform,'AddName','solid$component2:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   Ҫ�޸ĵ�Ҳ����name��vector��vectorҪ��һ��
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');  
        else % ����0����1������else����
            invoke(transform,'Name','solid$component3:ground');
            invoke(transform,'AddName','solid$component3:patch');
            invoke(transform,'AddName','solid$component3:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   Ҫ�޸ĵ�Ҳ����name��vector��vectorҪ��һ��
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
invoke(solid, 'Delete', 'component0:patch');
invoke(solid, 'Delete', 'component0:sub');


invoke(solid, 'Delete', 'component1:ground');
invoke(solid, 'Delete', 'component1:patch');
invoke(solid, 'Delete', 'component1:sub');

invoke(solid, 'Delete', 'component2:ground');
invoke(solid, 'Delete', 'component2:patch');
invoke(solid, 'Delete', 'component2:sub');

invoke(solid, 'Delete', 'component3:ground');
invoke(solid, 'Delete', 'component3:patch');
invoke(solid, 'Delete', 'component3:sub');

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



