%abs(-1220_->wb
%7500>abs>2320   whale
%700~1300   dolphin
%8000>-->ship

clc;
clear;
close all;

cd 'D:\fishackthon\whitebackground\search5973478-20180203T110517Z-001\search5973478'
list=dir('*.mp3');

for k=1:length(list) 

[y, fs] = audioread(list(k).name); 
%[y, fs] = audioread('D:\fishackthon\search5973468\JASCOAMARHYDROPHONE2402_20161007T235505.528Z-audio.mp3');%MATLAB 來直接讀取音檔
y=y(:,1);
%sound(y, fs);	% 播放此音訊
time=(1:length(y))/fs;	% 時間軸的向量
plot(time, y);	% 畫出時間軸上的波形



X = fft(y);
magX=abs(X);
angX=angle(X);
K = fft(X);
L = fft(K);
%M = fft(L);
%N = fft(M);


%subplot(221); %subplot(nnk(圖形視窗n*n中的第k張圖));
%plot(y);title('原始波形');
%fprintf('原始波形值 = %s\n', y);

%subplot(222);
%plot(X); title('原始頻譜');
%fprintf('原始波形值 = %s\n', X);

%subplot(223);
%plot(K);title('FFT頻譜');
%fprintf('原始波形值 = %s\n', magX);

%subplot(224);
%plot(L);title('FFT2頻譜');
%fprintf('原始波形值 = %s\n', angX);

%subplot(335);
%plot(M);title('FFT3頻譜');
%subplot(336);
%plot(N);title('FFT4頻譜');
%subplot(337);
%plot(O);title('FFT5頻譜');
%subplot(338);
%plot(P);title('FFT6頻譜');
%subplot(339);
%plot(Q);title('FFT7頻譜');



%fprintf('取樣點解析度 = %g 位元/取樣點\n', info.BitsPerSample);

%%h=figure(1);
%gcf=get current figure;
%print -dpng 'FIG1.jpg';
%saveas(gcf,[plot_ouput.png'], 'png');

filename = sprintf('%s.txt', list(k).name);

fid = fopen(filename, 'w'); % 以寫入模式開啟位於 c:\ 下 的 txt 檔案(若檔案已存在則覆蓋;反之,建立新檔) 
fprintf(fid, '%f\n', K ); % 以浮點數格式寫入 K 資料並換行
fclose(fid); % 關檔 
end
