tic                 % start timer to calculate CPU time

desired = 1;    % desired output, lambda

Kp = -0.5;              % proportional term Kp
Ki = -0.1;           % Integral term Ki
Kd = -0.01;           % derivative term Kd

dt = 0.01;           % sampling time
Time = 20;          % total simulation time in seconds
n = round(Time/dt); % number of samples n=1000

% pre-assign all the arrays to optimize simulation time
Prop(1:n+1) = 0; Der(1:n+1) = 0; Int(1:n+1) = 0; I(1:n+1) = 0;
PID(1:n+1) = 0;
FeedBack(1)= 0.8; % i arxiki timi tou feedback einai i arxiki sunthiki tou lambda
FeedBack(2:n+1) = 0;
Error(1:n+1) = 0;
STATE1(1:n+1) = 0;
lambda(1:n+1) = 0;

for i = 1:n
    %% PID Controller
    Error(i+1) = desired - FeedBack(i); % error entering the PID controller
    
    Prop(i+1) = Error(i+1);% error of proportional term
    Der(i+1)  = (Error(i+1) - Error(i))/dt; % derivative of the error
    Int(i+1)  = (Error(i+1) + Error(i))*dt/2; % integration of the error
    I(i+1)    = sum(Int); % the sum of the integration of the error
    
    PID(i+1)  = Kp*Prop(i) + Ki*I(i+1)+ Kd*Der(i); % the three PID terms
    %pid saturation
    if PID(i+1) > 0.01
        PID(i+1) = 0.01;
    elseif PID(i+1) < 0.001
        PID(i+1) = 0.001;
    end
    %% Mean Value Engine Model
    STATE1(i+1) = PID(i+1); %output of PID
    mfidot=STATE1(i+1); %output of PID = input to the MVEM 
    %mfi2dot=d/dt(mfidot)
    
    %a=25;
        
    if i == 1
        a=25;
        sol=ddesd(@(t,y,Z)dydt(t,y,Z,mfidot,a),@delay,@ddehist,[0,0.01]);     
    else
        sol=ddesd(@(t,y,Z)dydt(t,y,Z,mfidot,a),@delay,[deval(sol,0.01)],[0,0.01]);           
    end 
    
    yint = deval(sol,0.01); 
    lambda(i+1)=yint(4); % last iteration of solver 
    FeedBack(i+1) = lambda(i+1); %output of MVEM
    %if i>500
        a=(90-10)*rand+10;
    %else
    %    a=25;
    %end
    
end


tsim = toc % simulation time

% plot results
T = 0:dt:Time;
Reference = desired*ones(1,i+1);
plot(T,Reference,'r',T,FeedBack,'b')
xlabel('Time (sec)')
legend('Desired','Simulated','Open loop')
