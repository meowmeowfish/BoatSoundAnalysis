clc;
clear;
close all;

[y, fs] = audioread('H-JASCOAMARHY.mp3'); %MATLAB �Ӫ���Ū������
y=y(:,1);%�u��??�D�@���R�A�p�G�A�Q���R�t�~�@??�D�A?�令y=y(:,2)
%sound(y, fs);	% ���񦹭��T
time=(1:length(y))/fs;	% �ɶ��b���V�q
plot(time, y);	% �e�X�ɶ��b�W���i��



X = fft(y);
magX=abs(X);
angX=angle(X);
subplot(221);%��ܹϪ���m->���W
plot(y);title('��l�i��');
%fprintf('��l�i�έ� = %s\n', y);

subplot(222);%��ܹϪ���m->�k�W
plot(X); title('��l�W��');
%fprintf('��l�i�έ� = %s\n', X);

subplot(223);%��ܹϪ���m->���U
plot(magX);title('��l���T');
%fprintf('��l�i�έ� = %s\n', magX);

subplot(224);%��ܹϪ���m->�k�U
plot(angX);title('��l�ۦ�');
%fprintf('��l�i�έ� = %s\n', angX);


fileName='H-JASCOAMARHY.mp3';
info=audioinfo(fileName);
fprintf('�ɮצW�� = %s\n', info.Filename);
fprintf('���Y�覡 = %s\n', info.CompressionMethod);
fprintf('�q�D�Ӽ� = %g ��\n', info.NumChannels);
fprintf('�����W�v = %g Hz\n', info.SampleRate);
fprintf('�����I�`�Ӽ� = %g ��\n', info.TotalSamples);
fprintf('���T���� = %g ��\n', info.Duration);
%fprintf('�����I�ѪR�� = %g �줸/�����I\n', info.BitsPerSample);



