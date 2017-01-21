x = 0:1:628;
l = cos(x/100);
plot(x,l)
pause;

% Construct blurring window.
windowWidth = int16(5);
halfWidth = windowWidth / 2;
Sigma = 3.5;
gaussFilter = gausswin(5,Sigma);
gaussFilter = gaussFilter / sum(gaussFilter); % Normalize.

% Smoothen
smoothedVector = conv(l,gaussFilter);

% Plot the smoothened vector
hold on;
plot(smoothedVector(halfWidth:end-halfWidth), 'b-', 'linewidth', 3);
pause;

% Derivative
Y = diff(smoothedVector);
% hold on;
figure;
z=5:620;
plot(z,Y(z),'g-', 'linewidth', 4);

% Solution:
%  The derivative of cosine function is the sine function and hence,
%  rate of change is maximum at odd multiples of pi/2. 
%  The edge will be found periodically at every odd multiples of pi/2
