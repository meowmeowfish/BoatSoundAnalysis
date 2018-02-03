clc;
clear;
close all;

F = ['D:\fishackthon\search5973468\*.mp3'];
list=dir('D:\fishackthon\search5973468\*.mp3');

for k=1:length(list) 

[y, fs] = audioread(list(k).name); 
%[y, fs] = audioread('D:\fishackthon\search5973468\JASCOAMARHYDROPHONE2402_20161007T235505.528Z-audio.mp3');%MATLAB �Ӫ���Ū������
y=y(:,1);%�u��??�D�@���R�A�p�G�A�Q���R�t�~�@??�D�A?�令y=y(:,2)
%sound(y, fs);	% ���񦹭��T
time=(1:length(y))/fs;	% �ɶ��b���V�q
plot(time, y);	% �e�X�ɶ��b�W���i��



X = fft(y);
magX=abs(X);
angX=angle(X);
K = fft(X);
L = fft(K);
%M = fft(L);
%N = fft(M);


subplot(221); %subplot(nnk(�ϧε���n*n������k�i��));
plot(y);title('��l�i��');
%fprintf('��l�i�έ� = %s\n', y);

subplot(222);
plot(X); title('��l�W��');
%fprintf('��l�i�έ� = %s\n', X);

subplot(223);
plot(K);title('FFT�W��');
%fprintf('��l�i�έ� = %s\n', magX);

subplot(224);
plot(L);title('FFT2�W��');
%fprintf('��l�i�έ� = %s\n', angX);

%subplot(335);
%plot(M);title('FFT3�W��');
%subplot(336);
%plot(N);title('FFT4�W��');
%subplot(337);
%plot(O);title('FFT5�W��');
%subplot(338);
%plot(P);title('FFT6�W��');
%subplot(339);
%plot(Q);title('FFT7�W��');


fileName='H-JASCOAMARHY.mp3';
info=audioinfo(fileName);
fprintf('�ɮצW�� = %s\n', info.Filename);
fprintf('���Y�覡 = %s\n', info.CompressionMethod);
fprintf('�q�D�Ӽ� = %g ��\n', info.NumChannels);
fprintf('�����W�v = %g Hz\n', info.SampleRate);
fprintf('�����I�`�Ӽ� = %g ��\n', info.TotalSamples);
fprintf('���T���� = %g ��\n', info.Duration);
%fprintf('�����I�ѪR�� = %g �줸/�����I\n', info.BitsPerSample);

%%h=figure(1);
%gcf=get current figure;
%print -dpng 'FIG1.jpg';
%saveas(gcf,[plot_ouput.png'], 'png');

filename = sprintf('D:\\fishackthon\\search5973468\\%s.txt', list(k).name);

fid = fopen(filename, 'w'); % �H�g�J�Ҧ��}�Ҧ�� c:\ �U �� txt �ɮ�(�Y�ɮפw�s�b�h�л\;�Ϥ�,�إ߷s��) 
fprintf(fid, '%f\n', K ); % �H�B�I�Ʈ榡�g�J K ��ƨô���
fclose(fid); % ���� 
end
