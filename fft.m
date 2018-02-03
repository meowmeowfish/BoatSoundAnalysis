clc;
clear;
close all;

F = ['D:\fishackthon\search5973468\*.mp3'];
list=dir('D:\fishackthon\search5973468\*.mp3');

for k=1:length(list) 

[y, fs] = audioread(list(k).name); 
%[y, fs] = audioread('D:\fishackthon\search5973468\JASCOAMARHYDROPHONE2402_20161007T235505.528Z-audio.mp3');%MATLAB 來直接讀取音檔
y=y(:,1);%只取??道作分析，如果你想分析另外一??道，?改成y=y(:,2)
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


subplot(221); %subplot(nnk(圖形視窗n*n中的第k張圖));
plot(y);title('原始波形');
%fprintf('原始波形值 = %s\n', y);

subplot(222);
plot(X); title('原始頻譜');
%fprintf('原始波形值 = %s\n', X);

subplot(223);
plot(K);title('FFT頻譜');
%fprintf('原始波形值 = %s\n', magX);

subplot(224);
plot(L);title('FFT2頻譜');
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


fileName='H-JASCOAMARHY.mp3';
info=audioinfo(fileName);
fprintf('檔案名稱 = %s\n', info.Filename);
fprintf('壓縮方式 = %s\n', info.CompressionMethod);
fprintf('通道個數 = %g 個\n', info.NumChannels);
fprintf('取樣頻率 = %g Hz\n', info.SampleRate);
fprintf('取樣點總個數 = %g 個\n', info.TotalSamples);
fprintf('音訊長度 = %g 秒\n', info.Duration);
%fprintf('取樣點解析度 = %g 位元/取樣點\n', info.BitsPerSample);

%%h=figure(1);
%gcf=get current figure;
%print -dpng 'FIG1.jpg';
%saveas(gcf,[plot_ouput.png'], 'png');

filename = sprintf('D:\\fishackthon\\search5973468\\%s.txt', list(k).name);

fid = fopen(filename, 'w'); % 以寫入模式開啟位於 c:\ 下 的 txt 檔案(若檔案已存在則覆蓋;反之,建立新檔) 
fprintf(fid, '%f\n', K ); % 以浮點數格式寫入 K 資料並換行
fclose(fid); % 關檔 
end
