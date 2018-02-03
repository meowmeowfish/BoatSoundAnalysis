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

fid = fopen(filename, 'w'); % 以寫入模式開啟位於 d:\ 下 的 txt 檔案(若檔案已存在則覆蓋;反之,建立新檔) 
fprintf(fid, '%f\n', y ); % 以浮點數格式寫入 K 資料並換行
fclose(fid); % 關檔 
end
