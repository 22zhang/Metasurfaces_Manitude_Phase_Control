clc;
clear;
close all;

%参数设置，CST中Parameter list写过来
sub_w= 5;
sub_h = 1.52;



%路径设置
path=pwd;   %获取当前m文件的路径，这里注意将画好的CST模型放到和m文件一个文件夹中
filename='\multiple_bar.cst';
fullname=[path filename];
cst = actxserver('CSTStudio.application');
mws = invoke(cst,'OpenFile',fullname);
app = invoke(mws,'GetApplicationName');
ver = invoke(mws,'GetApplicationVersion');
invoke(mws, 'DeleteResults');



%   定义控件名称
brick = invoke(mws,'Brick');
transform = invoke(mws,'Transform');
plot = invoke(mws,'Plot');
solid = invoke(mws,'Solid');
component = invoke(mws,'Component');
lumpedelement  = invoke(mws,'LumpedElement');



% 矩阵大小
m=9;
n=9;
% 预先设置的棋盘阵列，当然也可以用matlab中的round（rand（m，n））生成一个随机的10*10的0,1矩阵
matrix=importdata("D:\CST_work\m_store\2-bit非均匀编码.xlsx");




% 循环代码，可以在CST中transform一下，然后将VBA代码对应ctrl+v过来，再转成Matlab代码
for i=1:m
    for j = 1:n
        if(matrix(i,j)==0)       
            invoke(transform,'Reset');
            invoke(transform,'Name','solid$component0:ground');
            invoke(transform,'AddName','solid$component0:patch');
            invoke(transform,'AddName','solid$component0:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   要修改的也就是name和vector，vector要算一下
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');   %    这里可能也不一样，反正对应VBA代码写过来就行
        elseif(matrix(i,j)==1) % 不是0就是1，所以else就行
            invoke(transform,'Name','solid$component1:ground');
            invoke(transform,'AddName','solid$component1:patch');
            invoke(transform,'AddName','solid$component1:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   要修改的也就是name和vector，vector要算一下
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');  
        elseif(matrix(i,j)==2) % 不是0就是1，所以else就行
            invoke(transform,'Name','solid$component2:ground');
            invoke(transform,'AddName','solid$component2:patch');
            invoke(transform,'AddName','solid$component2:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   要修改的也就是name和vector，vector要算一下
            invoke(transform,'UsePickedPoints','False');
            invoke(transform,'InvertPickedPoints','False');
            invoke(transform,'MultipleObjects','True');
            invoke(transform,'GroupObjects','False');
            invoke(transform,'Repetitions','1');
            invoke(transform, 'MultipleSelection','False'); 
            invoke(transform, 'Transform', 'Mixed','Translate');  
        else % 不是0就是1，所以else就行
            invoke(transform,'Name','solid$component3:ground');
            invoke(transform,'AddName','solid$component3:patch');
            invoke(transform,'AddName','solid$component3:sub');
            invoke(transform,'Vector',(i-1)*sub_w,-(j)*sub_w,0);  %   要修改的也就是name和vector，vector要算一下
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

%这个是删除原始的模型块，看你上面怎么移的，可能需要删除，也可能不删除
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



