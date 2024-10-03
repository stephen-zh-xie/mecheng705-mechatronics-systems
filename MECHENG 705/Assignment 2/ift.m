% This function serves as an interface to run your IFT optimization
% You should use MotorSlider.slx for IFT tuning!
% Inputs:
%   iters - A number specifying the number of ift iterations to run
%   Kp_initial - The initial Kp gain
%   Ki_initial - The initial Ki gain
%   Kd_initial - The initial Kd gain
% Outputs:
%   J - An iters by 1 vector containing the cost of each iteration
%   Kp - An iters by 1 vector containing the Kp gain of each iteration
%   Ki - An iters by 1 vector containing the Ki gain of each iteration
%   Kd - An iters by 1 vector containing the Kd gain of each iteration

function [J, Kp, Ki, Kd] = ift(iters, Kp_initial, Ki_initial, Kd_initial)
    J = zeros(1, iters);
    Kp = zeros(1, iters);
    Ki = zeros(1, iters);
    Kd = zeros(1, iters);
    
    % Add your IFT code here!
    % You may find the "sim" function useful for calling Simulink models.
end