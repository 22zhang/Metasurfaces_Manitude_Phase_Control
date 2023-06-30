clc;
clear;
close all;

% %参数设置，CST中Parameter list写过来
% sub_l = 2.8;
% sub_w = 1.4;
% sub_h = 1.52;
% p1_w = 2.8;
% p1_l = 0.3;
% p1_h = 0.018;
% p2_w = 0.5;
% p2_l = 0.2;
% R = 4.8;
% L = 30*10^-12;
% C = 0;
% R1 = 0;
% L1 = 30*10^-12;
% C1 = 28*10^-15;
% Frq=[22,33];
% 
% 
% %路径设置
% path=pwd;   %获取当前m文件的路径，这里注意将画好的CST模型放到和m文件一个文件夹中
% filename='\array1_2bit.cst';
% fullname=[path filename];
% cst = actxserver('CSTStudio.application');
% mws = invoke(cst,'OpenFile',fullname);
% app = invoke(mws,'GetApplicationName');
% ver = invoke(mws,'GetApplicationVersion');
% invoke(mws, 'DeleteResults');
% 
% 
% 
% %   定义控件名称
% brick = invoke(mws,'Brick');
% transform = invoke(mws,'Transform');
% plot = invoke(mws,'Plot');
% solid = invoke(mws,'Solid');
% component = invoke(mws,'Component');
% lumpedelement  = invoke(mws,'LumpedElement');
% 
% 
% 
% % 矩阵大小
% m=12;
% n=12;
% 预先设置的棋盘阵列，当然也可以用matlab中的round（rand（m，n））生成一个随机的10*10的0,1矩阵
matrix=importdata("D:\CST_work\m_store\2-bit非均匀编码.xlsx");



% 循环代码，可以在CST中transform一下，然后将VBA代码对应ctrl+v过来，再转成Matlab代码
% for i=1:m
%     for j = 1:n
%         if(matrix(i,j)==0)       
%             invoke(transform,'Reset');
%             invoke(transform,'Name','lumpeditem$Folder1:0_0');
%             invoke(transform,'AddName','lumpeditem$Folder1:0_1');
%             invoke(transform,'AddName','solid$component0:ground');
%             invoke(transform,'AddName','solid$component0:patch');
%             invoke(transform,'AddName','solid$component0:patch_1');
%             invoke(transform,'AddName','solid$component0:sub');
%             invoke(transform,'Vector',(i-1)*sub_l,-j*sub_w,0);  %   要修改的也就是name和vector，vector要算一下
%             invoke(transform,'UsePickedPoints','False');
%             invoke(transform,'InvertPickedPoints','False');
%             invoke(transform,'MultipleObjects','True');
%             invoke(transform,'GroupObjects','False');
%             invoke(transform,'Repetitions','1');
%             invoke(transform, 'MultipleSelection','False'); 
%             invoke(transform, 'Transform', 'Mixed','Translate');   %    这里可能也不一样，反正对应VBA代码写过来就行
%         else  % 不是0就是1，所以else就行
%             invoke(transform,'Reset');
%             invoke(transform,'Name','lumpeditem$Folder1:1_0');
%             invoke(transform,'AddName','lumpeditem$Folder1:1_1');
%             invoke(transform,'AddName','solid$component0:ground');
%             invoke(transform,'AddName','solid$component0:patch');
%             invoke(transform,'AddName','solid$component0:patch_1');
%             invoke(transform,'AddName','solid$component0:sub');
%             invoke(transform,'Vector',(i-1)*sub_l,-j*sub_w,0);
%             invoke(transform,'UsePickedPoints','False');
%             invoke(transform,'InvertPickedPoints','False');
%             invoke(transform,'MultipleObjects','True');
%             invoke(transform,'GroupObjects','False');
%             invoke(transform,'Repetitions','1');
%             invoke(transform, 'MultipleSelection','False');
%             invoke(transform, 'Transform', 'Mixed','Translate');
%         end
%     end
% end
% 
% %这个是删除原始的模型块，看你上面怎么移的，可能需要删除，也可能不删除
% %invoke(component, 'Delete','component0');
% %invoke(component, 'Delete', 'component1');
% 
% 
% invoke(solid, 'Delete', 'component0:ground');
% invoke(solid, 'Delete', 'component0:patch');
% invoke(solid, 'Delete', 'component0:patch_1');
% invoke(solid, 'Delete', 'component0:sub');
% invoke(lumpedelement, 'Delete', 'Folder1:0_0');
% invoke(lumpedelement, 'Delete', 'Folder1:0_1');
% 
% 
% invoke(solid, 'Delete', 'component1:ground');
% invoke(solid, 'Delete', 'component1:patch');
% invoke(solid, 'Delete', 'component1:patch_1');
% invoke(solid, 'Delete', 'component1:sub');
% invoke(lumpedelement, 'Delete', 'Folder1:1_0');
% invoke(lumpedelement, 'Delete', 'Folder1:1_1');
% 
% 
% % Solid.Delete "component0:ground" 
% % Solid.Delete "component0:patch1" 
% % Solid.Delete "component0:patch1_1" 
% % Solid.Delete "component0:sub" 
% % LumpedElement.Delete "Folder1:0" 
% 
% % Solid.Delete "component1:ground" 
% % Solid.Delete "component1:patch" 
% % Solid.Delete "component1:patch2_1" 
% % Solid.Delete "component1:sub" 
% % LumpedElement.Delete "Folder1:1" 



figure
imagesc(matrix)



