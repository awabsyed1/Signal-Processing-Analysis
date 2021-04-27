% Author: Awabullah Syed 
% Date: 26 Jan 2021 
% Module: Signal Processing 
% NOTE: Please run the code section wise to ensure necessary variables
%       needed in second section are in the Workspace. 
% DESCRIPTION: This code is broken down into 4 sections/points: 
%             Point 1 - Performs the Time History and DFT analysis to the 
%                       'Simulated sensor signal' - u
%             Point 2 - Downsampling of the sensor signal under the rates
%                       of 25 Hz, 40 Hz and 50 Hz. 
%             Point 3 - Performs Time History and DFT anaylsis on y(t)
%                       signal
%             Point 4 - A low pass filter with the cut-off frequency of 10
%                       Hz 
%---------------------------------------------------------------%
%-------------------Section: Point 1------------------------------------%
load ('sensor_data_for_DSP_assignment.mat')  %Sensor signal 
Fs = 1000;
T = 1/Fs;
N = 20000;
t = (0:N-1)*T; %Time 
% DFT Analysis 
yF = fft(u);
w = (0:2*pi/N:(N-1)*2*pi/N);  %vector with frequencies (omega)
capital_omega = w*T;
%-----------------------Plot---------------------------------%
%-----------Time History of the signal---------%
figure(1)
plot(t,u)
grid on; 
title('Time history of the signal')
xlabel('Time')
ylabel('Data Collected by the sensor') 
%----------------------- DFT Plots ---------------%
figure(2)
subplot(2,1,1);
mag = abs(yF);
plot(w/(2*pi*T),mag);  %(2*pi*T) %capital omega
grid on
title ('DFT Analysis of the signal - discrete frequency');
xlabel ('Physical Frequency');
ylabel ('Amplitude') 
subplot(2,1,2)
plot(w/T,(T*mag))  %w/T
title ('DFT Analysis of the data collected from the physical signal');  
xlabel ('Angular Frequency') 
ylabel ('Amplitude')
grid on 
%%
%------------------Section: Point 2------------------------%
%----------------------Down Sampling----------------------------%
t20 = [0:0.001:20]; %Used to generate Time history of the signal
%------------------------Down Sample (25Hz)-----------------%
down_sample = 40; %1000/25 %1000/40 %1000/50
fs1 = 25; %25 Hz
T1 = 1/fs1;
N1 = length(u)/down_sample;
t1 = [0:(N1-1)*T1];
down_t = downsample(t1,down_sample);
y = downsample(u,down_sample); %downsampling the frequency
yF1 = fft(y);
w1 = (0:2*pi/N1:(N1-1)*2*pi/N1);  %vector with frequencies (omega)
t1_1 = downsample(t20,down_sample); %Downsampling Time (25 Hz)
%----------------------Down Sample (40Hz)-----------------------%
down_sample1 = 25; %1000/25 %1000/40 %1000/50
fs2 = 40; %25 Hz
T2 = 1/fs2;
N2 = length(u)/down_sample1;
t2 = [0:(N2-1)*T2];
y1 = downsample(u,down_sample1); %downsampling the frequency
yF2 = fft(y1);
w2 = (0:2*pi/N2:(N2-1)*2*pi/N2);  %vector with frequencies (omega)
t2_1 = downsample(t20,down_sample1); %Downsampling Time (40Hz)
%--------------------Down Sample (50Hz)-------------------------%
down_sample2 = 20; %1000/25 %1000/40 %1000/50
fs3 = 50; % Hz
T3 = 1/fs3;
N3 = length(u)/down_sample2;
t3 = [0:(N3-1)*T3];
y2 = downsample(u,down_sample2); %downsampling the frequency
yF3 = fft(y2);
w3 = (0:2*pi/N3:(N3-1)*2*pi/N3);  %vector with frequencies (omega)
t3_1 = downsample(t20,down_sample2); %Downsampling Time (50Hz)
%-----------------------DFT Down Sample Plots--------------------------%
figure (3)
subplot(3,1,1) %25 Hz
plot(w1/(2*pi*T1),(T1*abs(yF1))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 25Hz')
subplot(3,1,2) %40 Hz
plot(w2/(2*pi*T2),(T2*abs(yF2))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 40Hz')
subplot(3,1,3) %50 Hz 
plot(w3/(2*pi*T3),(T3*abs(yF3))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 50Hz')
%------------------Separate down sampling plots------------------%
figure (4)
plot(w1/(2*pi*T1),(T1*abs(yF1))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 25Hz')
figure (5) 
plot(w2/(2*pi*T2),(T2*abs(yF2))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 40Hz')
figure (6)
plot(w3/(2*pi*T3),(T3*abs(yF3))); grid on 
xlabel ('Frequency')
ylabel('Amplitude')
title('DFT of downsampled signal - 50Hz')
%--------------Time History of Each Down-Sampled Signal----------%
figure (7)  % Time History of downsampled Signal (25 Hz)
plot(t1_1(1:end-1),y)
title ('Time History of downsampled signal @25Hz')
xlabel('Time (Sec)')
ylabel('Data Collected by the Sensor'); grid on 
figure (8)   % Time History of downsampled Signal (40 Hz)
plot(t2_1(1:end-1),y1)
title ('Time History of downsampled signal @40Hz')
xlabel('Time (Sec)')
ylabel('Data Collected by the Sensor'); grid on 
figure (9) % Time History of downsampled Signal (40 Hz)
plot(t3_1(1:end-1),y2)
title ('Time History of downsampled signal @50Hz')
xlabel('Time (Sec)')
ylabel('Data Collected by the Sensor'); grid on 
%% -------------Point 3-----------------------%
%--------Relationship between the sensor signal & physical signal-----%
y = u.^2;
figure (10) %Time History of y(t)
plot(t,y)
title ('Time History of the Signal') 
xlabel('Time')
ylabel('Data Colleted by the Sensor') ; grid on 
yf33 = fft(y);
w = [0:2*pi/N:(N-1)*2*pi/N];
figure(11)   %DFT Analysis Plot
plot(w,abs(yf33))
title('DFT Analysis of y(t) signal')
xlabel('Discrete Frequency')
ylabel('Amplitude'); grid on 
figure (12)    %DFT Anaysis Plot after scaling 
plot(w/(2*pi*T),T*abs(yf33))
xlabel('Physical Frequency')
title ('DTF Analysis of y(t) after scaling') 
ylabel('Amplitude'); grid on
%plot (w/(2*pi*T),abs(yf))
%% 
%------------------Digital Filter---------------------%
s = tf ('s');
Fs = 1000;
T = 1/Fs;
N = 20000;
t = (0:N-1)*T; %Time 
num_sys = [0 0.01];
den_sys = [1 -0.99];
yfil = filter(num_sys,den_sys,y);
figure (13)
plot(t,yfil); grid on
xlabel('Time')
ylabel('Amplitude')
title('Time History - Digital Filter')
yf44 = fft(yfil); %DFT
w = [0:2*pi/N:(N-1)*2*pi/N];
figure(14)
plot(w/(2*pi*T),T*abs(yf44)); grid on 
xlabel ('Physical Frequency ')
ylabel('Amplitude')
title('DFT Analysis - Digital Filter')
figure (15)
plot(w,abs(yf44))
xlabel ('Frequency ')
ylabel('Amplitude')
title('DFT Analysis - Digital Filter'); grid on 

