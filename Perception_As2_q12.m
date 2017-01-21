clc
clear all
%% --------------------h(x)---------------------------- 
h = zeros(1,21);
z=1;
for x=-1:0.1:1
    if x>=-0.5&&x<=0.5
        h(z) = 1;
    else 
        h(z)=0;
    end
    z=z+1;
end
z=z-1;
stem(h);
pause;

%% --------------------f(x)----------------
f = zeros(1,121);
z=1;
for x=9:0.1:21
    if x>=10&&x<=20
        f(z) = 1;
    else 
        f(z)=0;
    end
    z=z+1;
end
z=z-1;
stem(f);
pause;
%% -----------Convolve f(x) and h(x)-------------------------
Res_f_conv_h = conv(f,h);
stem(Res_f_conv_h);
pause;
%% -----------Convolve h(x) and h(x)-----------------------
Res_h_conv_h = conv(h,h);
stem(Res_h_conv_h);
