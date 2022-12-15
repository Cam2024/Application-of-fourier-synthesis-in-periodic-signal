clear;
f0 = 1000; %fundamental frequency
T = 1/f0;
V0 = 1;
t = linspace(0,2*T,10000);%Define time domain range and step size
harmonics =10;%Number of harmonics
ft = 0; %Define initial waveform
An = zeros(1,harmonics); %Value range of frequency domain
f = zeros(1,harmonics); %Definition domain of frequency
for n = 1:harmonics
    if mod(n,2)
        fn = V0*sin(n*2*pi*f0*t)*(1/n); %Harmonic expression
        ft = ft+fn; %Add to get the total expression
        An(n) = V0/n; %Value in frequency domain
        f(n) = n; %Frequency domain 
    end
end

subplot(2,1,1);
plot(t,ft);%Draw time domain waveform
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title('Resulting waveform(time domain)');

subplot(2,1,2);
stem(f,An,"filled");%Draw frequency domain
grid on;
xlabel('Frequency(f)');
ylabel('Magnitude');
title('Spectrum(frequency domain)');
