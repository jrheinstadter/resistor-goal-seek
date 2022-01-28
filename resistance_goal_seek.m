%{
    Goal Seeking for Equivalent Resistance Configurations:
    Give the desired equivalent resistance.
    Give the resistances of resistors you have.
    The program will output the closest possible equivalent resistance
    as well as the configuration required.
    
    NOTE: s represents the resistors within the parenthesis should be
    put in series. p represents the resistors within the parenthesis
    should be put in parallel. Follow order of operations.

%}

%%SETUP

n = 3;              %number of resistors
eps = 0.001;        %machine epsilon

%take inputs for resistor values and goal seek from user
Req = input('Equivalent resistance = ');
R1 = input('R1 = ');
R2 = input('R2 = ');
R3 = input('R3 = ');

%fill array with every potential Req value
R_pot(1) = s(R1,R2,R3);
R_pot(2) = s(p(R1,R2),R3);
R_pot(3) = s(p(R1,R3),R2);
R_pot(4) = s(p(R2,R3),R1);
R_pot(5) = p(R1,R2,R3);
R_pot(6) = p(s(R1,R2),R3);
R_pot(7) = p(s(R2,R3),R1);
R_pot(8) = p(s(R1,R3),R2);


%%GOAL SEEK
%compare potential Req values with goal
for i=1:n
    R_comp(i) = abs(Req-R_pot(i));
end

%output closest R_pot to user
dev_min = min(R_comp);
for i=1:n
    if abs((abs(Req-R_pot(i))-dev_min) <= 0.001)
        R_final = R_pot(i);
    end
end

%find i number of R_pot
for i=1:n
    if (abs(R_pot(i)-R_final) <= 0.001)
        c = i;
    end
end

%%OUTPUT TO USER
%define string outputs for configurations
R_str(1) = "s(R1,R2,R3)";
R_str(2) = "s(p(R1,R2),R3)";
R_str(3) = "s(p(R1,R3),R2)";
R_str(4) = "s(p(R2,R3),R1)";
R_str(5) = "p(R1,R2,R3)";
R_str(6) = "p(s(R1,R2),R3)";
R_str(7) = "p(s(R2,R3),R1)";
R_str(8) = "p(s(R1,R3),R2)";

%output configuration and equivalent resistance to user
fprintf('Equivalent Resistance = %f\n', R_final)
fprintf('Configuration: %s\n', R_str(c))






%%FUNCTIONS
%parallel function
function p = p(varargin)
switch nargin
    case 0
        p = 0;
    case 1
        p = varargin{1};
    case 2
        p = (1/varargin{1} + 1/varargin{2})^(-1);
    case 3
        p = (1/varargin{1} + 1/varargin{2} + 1/varargin{3})^(-1);
    otherwise
        error('Unexpected inputs')
end
end

%series function
function s = s(varargin)
switch nargin
    case 0
        s = 0;
    case 1
        s = varargin{1};
    case 2
        s = varargin{1} + varargin{2};
    case 3
        s = varargin{1} + varargin{2} + varargin{3};
    otherwise
        error('Unexpected inputs')
end
end