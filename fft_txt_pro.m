clc;
clear;
close all;

cd 'D:\fishackthon\whitebackground\search5973478-20180203T110517Z-001\search5973478'
list=dir('*.txt');

for k=1:length(list) 

[y] = importdata(list(k).name, '%d'); 

y = sum(y(:))/1000000;
%z = num2str(y);



filename = sprintf('2%s.txt', list(k).name);

fid = fopen(filename, 'w'); % �H�g�J�Ҧ��}�Ҧ�� d:\ �U �� txt �ɮ�(�Y�ɮפw�s�b�h�л\;�Ϥ�,�إ߷s��) 
fprintf(fid, '%f\n', y ); % �H�B�I�Ʈ榡�g�J K ��ƨô���
fclose(fid); % ���� 
end
