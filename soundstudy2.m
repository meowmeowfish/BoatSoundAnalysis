clc;
clear;
close all;

[y, fs] = audioread('H-JASCOAMARHY.mp3'); %MATLAB 來直接讀取音檔
y=y(:,1);%只取??道作分析，如果你想分析另外一??道，?改成y=y(:,2)
%sound(y, fs);	% 播放此音訊
time=(1:length(y))/fs;	% 時間軸的向量
plot(time, y);	% 畫出時間軸上的波形



X = fft(y);
magX=abs(X);
angX=angle(X);
subplot(221);%顯示圖的位置->左上
plot(y);title('原始波形');
%fprintf('原始波形值 = %s\n', y);

subplot(222);%顯示圖的位置->右上
plot(X); title('原始頻譜');
%fprintf('原始波形值 = %s\n', X);

subplot(223);%顯示圖的位置->左下
plot(magX);title('原始振幅');
%fprintf('原始波形值 = %s\n', magX);

subplot(224);%顯示圖的位置->右下
plot(angX);title('原始相位');
%fprintf('原始波形值 = %s\n', angX);


fileName='H-JASCOAMARHY.mp3';
info=audioinfo(fileName);
fprintf('檔案名稱 = %s\n', info.Filename);
fprintf('壓縮方式 = %s\n', info.CompressionMethod);
fprintf('通道個數 = %g 個\n', info.NumChannels);
fprintf('取樣頻率 = %g Hz\n', info.SampleRate);
fprintf('取樣點總個數 = %g 個\n', info.TotalSamples);
fprintf('音訊長度 = %g 秒\n', info.Duration);
%fprintf('取樣點解析度 = %g 位元/取樣點\n', info.BitsPerSample);



