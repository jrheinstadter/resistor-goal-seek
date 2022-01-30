%{
    GOAL SEEKING FOR EQUIVALENT RESISTANCE CONFIGURATIONS:
    Enter the desired equivalent resistance.
    Enter the resistances of five resistors you will use.
    The program will output the closest possible equivalent resistance
    as well as the configuration required.
    
    NOTE: s represents the resistors within the parenthesis should be
    put in series. p represents the resistors within the parenthesis
    should be put in parallel. Follow order of operations.

    FUTURE MODS: ability for the code to recognize when <5 resistors
    should be used. It may be more accurate--closer to desired
    equivalent resistance--to use less resistors than be forced to use
    all 5.

%}

%%SETUP

n = 152;            %number of combinations
eps = 0.001;        %machine epsilon

%take inputs for resistor values and goal seek from user
Req = input('Equivalent resistance = ');
R1 = input('R1 = ');
R2 = input('R2 = ');
R3 = input('R3 = ');
R4 = input('R4 = ');
R5 = input('R5 = ');

%fill array with every potential Req value
R_pot(1)   = s(R1,R2,R3,R4,R5);

R_pot(2)   = s(p(R1,R2,R3,R4),R5);
R_pot(3)   = s(p(R1,R2,R3,R5),R4);
R_pot(4)   = s(p(R1,R2,R4,R5),R3);
R_pot(5)   = s(p(R1,R3,R4,R5),R2);
R_pot(6)   = s(p(R2,R3,R4,R5),R1);

R_pot(7)   = s(p(R1,R2,R3),R4,R5);
R_pot(8)   = s(p(R1,R2,R4),R3,R5);
R_pot(9)   = s(p(R1,R2,R5),R3,R4);
R_pot(10)  = s(p(R1,R3,R4),R2,R5);
R_pot(11)  = s(p(R1,R3,R5),R2,R4);
R_pot(12)  = s(p(R1,R4,R5),R2,R3);
R_pot(13)  = s(p(R2,R3,R4),R1,R5);
R_pot(14)  = s(p(R2,R3,R5),R1,R4);
R_pot(15)  = s(p(R2,R4,R5),R1,R3);
R_pot(16)  = s(p(R3,R4,R5),R1,R2);

R_pot(17)  = s(p(R1,R2),R3,R4,R5);
R_pot(18)  = s(p(R1,R3),R2,R4,R5);
R_pot(19)  = s(p(R1,R4),R2,R3,R5);
R_pot(20)  = s(p(R1,R5),R2,R3,R4);
R_pot(21)  = s(p(R2,R3),R1,R4,R5);
R_pot(22)  = s(p(R2,R4),R1,R3,R5);
R_pot(23)  = s(p(R2,R5),R1,R3,R4);
R_pot(24)  = s(p(R3,R4),R1,R2,R5);
R_pot(25)  = s(p(R3,R5),R1,R2,R4);
R_pot(26)  = s(p(R4,R5),R1,R2,R3);

R_pot(27)  = s(p(R5,R3),p(R2,R4),R1);
R_pot(28)  = s(p(R2,R3),p(R5,R4),R1);
R_pot(29)  = s(p(R5,R2),p(R3,R4),R1);
R_pot(30)  = s(p(R1,R3),p(R5,R4),R2);
R_pot(31)  = s(p(R5,R3),p(R1,R4),R2);
R_pot(32)  = s(p(R1,R5),p(R3,R4),R2);
R_pot(33)  = s(p(R1,R5),p(R2,R4),R3);
R_pot(34)  = s(p(R2,R5),p(R1,R4),R3);
R_pot(35)  = s(p(R1,R2),p(R5,R4),R3);
R_pot(36)  = s(p(R1,R3),p(R2,R5),R4);
R_pot(37)  = s(p(R2,R3),p(R1,R5),R4);
R_pot(38)  = s(p(R1,R2),p(R3,R5),R4);
R_pot(39)  = s(p(R1,R3),p(R2,R4),R5);
R_pot(40)  = s(p(R2,R3),p(R1,R4),R5);
R_pot(41)  = s(p(R1,R2),p(R3,R4),R5);

R_pot(42)  = s(p(R4,R5),p(R1,R2,R3));
R_pot(43)  = s(p(R3,R5),p(R1,R2,R4));
R_pot(44)  = s(p(R3,R4),p(R1,R2,R5));
R_pot(45)  = s(p(R2,R5),p(R1,R3,R4));
R_pot(46)  = s(p(R2,R4),p(R1,R3,R5));
R_pot(47)  = s(p(R2,R3),p(R1,R4,R5));
R_pot(48)  = s(p(R1,R5),p(R2,R3,R4));
R_pot(49)  = s(p(R1,R4),p(R2,R3,R5));
R_pot(50)  = s(p(R1,R3),p(R2,R4,R5));
R_pot(51)  = s(p(R1,R2),p(R3,R4,R5));

R_pot(52)  = p(s(R1,R2,R3,R4),R5);
R_pot(53)  = p(s(R1,R2,R3,R5),R4);
R_pot(54)  = p(s(R1,R2,R4,R5),R3);
R_pot(55)  = p(s(R1,R3,R4,R5),R2);
R_pot(56)  = p(s(R2,R3,R4,R5),R1);

R_pot(57)  = p(s(R1,R2,R3),R4,R5);
R_pot(58)  = p(s(R1,R2,R4),R3,R5);
R_pot(59)  = p(s(R1,R2,R5),R3,R4);
R_pot(60)  = p(s(R1,R3,R4),R2,R5);
R_pot(61)  = p(s(R1,R3,R5),R2,R4);
R_pot(62)  = p(s(R1,R4,R5),R2,R3);
R_pot(63)  = p(s(R2,R3,R4),R1,R5);
R_pot(64)  = p(s(R2,R3,R5),R1,R4);
R_pot(65)  = p(s(R2,R4,R5),R1,R3);
R_pot(66)  = p(s(R3,R4,R5),R1,R2);

R_pot(67)  = p(s(R1,R2),R3,R4,R5);
R_pot(68)  = p(s(R1,R3),R2,R4,R5);
R_pot(69)  = p(s(R1,R4),R2,R3,R5);
R_pot(70)  = p(s(R1,R5),R2,R3,R4);
R_pot(71)  = p(s(R2,R3),R1,R4,R5);
R_pot(72)  = p(s(R2,R4),R1,R3,R5);
R_pot(73)  = p(s(R2,R5),R1,R3,R4);
R_pot(74)  = p(s(R3,R4),R1,R2,R5);
R_pot(75)  = p(s(R3,R5),R1,R2,R4);
R_pot(76)  = p(s(R4,R5),R1,R2,R3);

R_pot(77)  = p(s(R5,R3),s(R2,R4),R1);
R_pot(78)  = p(s(R2,R3),s(R5,R4),R1);
R_pot(79)  = p(s(R5,R2),s(R3,R4),R1);
R_pot(80)  = p(s(R1,R3),s(R5,R4),R2);
R_pot(81)  = p(s(R5,R3),s(R1,R4),R2);
R_pot(82)  = p(s(R1,R5),s(R3,R4),R2);
R_pot(83)  = p(s(R1,R5),s(R2,R4),R3);
R_pot(84)  = p(s(R2,R5),s(R1,R4),R3);
R_pot(85)  = p(s(R1,R2),s(R5,R4),R3);
R_pot(86)  = p(s(R1,R3),s(R2,R5),R4);
R_pot(87)  = p(s(R2,R3),s(R1,R5),R4);
R_pot(88)  = p(s(R1,R2),s(R3,R5),R4);
R_pot(89)  = p(s(R1,R3),s(R2,R4),R5);
R_pot(90)  = p(s(R2,R3),s(R1,R4),R5);
R_pot(91)  = p(s(R1,R2),s(R3,R4),R5);

R_pot(92)  = p(s(R5,R3),p(R2,R4),R1);
R_pot(93)  = p(s(R2,R3),p(R5,R4),R1);
R_pot(94)  = p(s(R5,R2),p(R3,R4),R1);
R_pot(95)  = p(s(R1,R3),p(R5,R4),R2);
R_pot(96)  = p(s(R5,R3),p(R1,R4),R2);
R_pot(97)  = p(s(R1,R5),p(R3,R4),R2);
R_pot(98)  = p(s(R1,R5),p(R2,R4),R3);
R_pot(99)  = p(s(R2,R5),p(R1,R4),R3);
R_pot(100) = p(s(R1,R2),p(R5,R4),R3);
R_pot(101) = p(s(R1,R3),p(R2,R5),R4);
R_pot(102) = p(s(R2,R3),p(R1,R5),R4);
R_pot(103) = p(s(R1,R2),p(R3,R5),R4);
R_pot(104) = p(s(R1,R3),p(R2,R4),R5);
R_pot(105) = p(s(R2,R3),p(R1,R4),R5);
R_pot(106) = p(s(R1,R2),p(R3,R4),R5);

R_pot(107) = p(p(R5,R3),s(R2,R4),R1);
R_pot(108) = p(p(R2,R3),s(R5,R4),R1);
R_pot(109) = p(p(R5,R2),s(R3,R4),R1);
R_pot(110) = p(p(R1,R3),s(R5,R4),R2);
R_pot(111) = p(p(R5,R3),s(R1,R4),R2);
R_pot(112) = p(p(R1,R5),s(R3,R4),R2);
R_pot(113) = p(p(R1,R5),s(R2,R4),R3);
R_pot(114) = p(p(R2,R5),s(R1,R4),R3);
R_pot(115) = p(p(R1,R2),s(R5,R4),R3);
R_pot(116) = p(p(R1,R3),s(R2,R5),R4);
R_pot(117) = p(p(R2,R3),s(R1,R5),R4);
R_pot(118) = p(p(R1,R2),s(R3,R5),R4);
R_pot(119) = p(p(R1,R3),s(R2,R4),R5);
R_pot(120) = p(p(R2,R3),s(R1,R4),R5);
R_pot(121) = p(p(R1,R2),s(R3,R4),R5);

R_pot(122) = p(s(R4,R5),p(R1,R2,R3));
R_pot(123) = p(s(R3,R5),p(R1,R2,R4));
R_pot(124) = p(s(R3,R4),p(R1,R2,R5));
R_pot(125) = p(s(R2,R5),p(R1,R3,R4));
R_pot(126) = p(s(R2,R4),p(R1,R3,R5));
R_pot(127) = p(s(R2,R3),p(R1,R4,R5));
R_pot(128) = p(s(R1,R5),p(R2,R3,R4));
R_pot(129) = p(s(R1,R4),p(R2,R3,R5));
R_pot(130) = p(s(R1,R3),p(R2,R4,R5));
R_pot(131) = p(s(R1,R2),p(R3,R4,R5));

R_pot(132) = p(p(R4,R5),s(R1,R2,R3));
R_pot(133) = p(p(R3,R5),s(R1,R2,R4));
R_pot(134) = p(p(R3,R4),s(R1,R2,R5));
R_pot(135) = p(p(R2,R5),s(R1,R3,R4));
R_pot(136) = p(p(R2,R4),s(R1,R3,R5));
R_pot(137) = p(p(R2,R3),s(R1,R4,R5));
R_pot(138) = p(p(R1,R5),s(R2,R3,R4));
R_pot(139) = p(p(R1,R4),s(R2,R3,R5));
R_pot(140) = p(p(R1,R3),s(R2,R4,R5));
R_pot(141) = p(p(R1,R2),s(R3,R4,R5));

R_pot(142) = p(p(R4,R5),p(R1,R2,R3));
R_pot(143) = p(p(R3,R5),p(R1,R2,R4));
R_pot(144) = p(p(R3,R4),p(R1,R2,R5));
R_pot(145) = p(p(R2,R5),p(R1,R3,R4));
R_pot(146) = p(p(R2,R4),p(R1,R3,R5));
R_pot(147) = p(p(R2,R3),p(R1,R4,R5));
R_pot(148) = p(p(R1,R5),p(R2,R3,R4));
R_pot(149) = p(p(R1,R4),p(R2,R3,R5));
R_pot(150) = p(p(R1,R3),p(R2,R4,R5));
R_pot(151) = p(p(R1,R2),p(R3,R4,R5));

R_pot(152) = p(R1,R2,R3,R4,R5);


%%GOAL SEEK
%compare potential Req values with goal
R_comp = zeros(1,n);    %preallocate
for i=1:n
    R_comp(i) = abs(Req-R_pot(i));
end

%output closest R_pot to user
dev_min = min(R_comp);
for i=1:n
    if (abs(Req-R_pot(i))-dev_min) <= eps
        R_final = R_pot(i);
    end
end

%find i number of R_pot
for i=1:n
    if (abs(R_pot(i)-R_final) <= eps)
        c = i;
    end
end

%%OUTPUT TO USER
%define string outputs for configurations
R_str(1)   = "s(R1,R2,R3,R4,R5)";

R_str(2)   = "s(p(R1,R2,R3,R4),R5)";
R_str(3)   = "s(p(R1,R2,R3,R5),R4)";
R_str(4)   = "s(p(R1,R2,R4,R5),R3)";
R_str(5)   = "s(p(R1,R3,R4,R5),R2)";
R_str(6)   = "s(p(R2,R3,R4,R5),R1)";

R_str(7)   = "s(p(R1,R2,R3),R4,R5)";
R_str(8)   = "s(p(R1,R2,R4),R3,R5)";
R_str(9)   = "s(p(R1,R2,R5),R3,R4)";
R_str(10)  = "s(p(R1,R3,R4),R2,R5)";
R_str(11)  = "s(p(R1,R3,R5),R2,R4)";
R_str(12)  = "s(p(R1,R4,R5),R2,R3)";
R_str(13)  = "s(p(R2,R3,R4),R1,R5)";
R_str(14)  = "s(p(R2,R3,R5),R1,R4)";
R_str(15)  = "s(p(R2,R4,R5),R1,R3)";
R_str(16)  = "s(p(R3,R4,R5),R1,R2)";

R_str(17)  = "s(p(R1,R2),R3,R4,R5)";
R_str(18)  = "s(p(R1,R3),R2,R4,R5)";
R_str(19)  = "s(p(R1,R4),R2,R3,R5)";
R_str(20)  = "s(p(R1,R5),R2,R3,R4)";
R_str(21)  = "s(p(R2,R3),R1,R4,R5)";
R_str(22)  = "s(p(R2,R4),R1,R3,R5)";
R_str(23)  = "s(p(R2,R5),R1,R3,R4)";
R_str(24)  = "s(p(R3,R4),R1,R2,R5)";
R_str(25)  = "s(p(R3,R5),R1,R2,R4)";
R_str(26)  = "s(p(R4,R5),R1,R2,R3)";

R_str(27)  = "s(p(R5,R3),p(R2,R4),R1)";
R_str(28)  = "s(p(R2,R3),p(R5,R4),R1)";
R_str(29)  = "s(p(R5,R2),p(R3,R4),R1)";
R_str(30)  = "s(p(R1,R3),p(R5,R4),R2)";
R_str(31)  = "s(p(R5,R3),p(R1,R4),R2)";
R_str(32)  = "s(p(R1,R5),p(R3,R4),R2)";
R_str(33)  = "s(p(R1,R5),p(R2,R4),R3)";
R_str(34)  = "s(p(R2,R5),p(R1,R4),R3)";
R_str(35)  = "s(p(R1,R2),p(R5,R4),R3)";
R_str(36)  = "s(p(R1,R3),p(R2,R5),R4)";
R_str(37)  = "s(p(R2,R3),p(R1,R5),R4)";
R_str(38)  = "s(p(R1,R2),p(R3,R5),R4)";
R_str(39)  = "s(p(R1,R3),p(R2,R4),R5)";
R_str(40)  = "s(p(R2,R3),p(R1,R4),R5)";
R_str(41)  = "s(p(R1,R2),p(R3,R4),R5)";

R_str(42)  = "s(p(R4,R5),p(R1,R2,R3))";
R_str(43)  = "s(p(R3,R5),p(R1,R2,R4))";
R_str(44)  = "s(p(R3,R4),p(R1,R2,R5))";
R_str(45)  = "s(p(R2,R5),p(R1,R3,R4))";
R_str(46)  = "s(p(R2,R4),p(R1,R3,R5))";
R_str(47)  = "s(p(R2,R3),p(R1,R4,R5))";
R_str(48)  = "s(p(R1,R5),p(R2,R3,R4))";
R_str(49)  = "s(p(R1,R4),p(R2,R3,R5))";
R_str(50)  = "s(p(R1,R3),p(R2,R4,R5))";
R_str(51)  = "s(p(R1,R2),p(R3,R4,R5))";

R_str(52)  = "p(s(R1,R2,R3,R4),R5)";
R_str(53)  = "p(s(R1,R2,R3,R5),R4)";
R_str(54)  = "p(s(R1,R2,R4,R5),R3)";
R_str(55)  = "p(s(R1,R3,R4,R5),R2)";
R_str(56)  = "p(s(R2,R3,R4,R5),R1)";

R_str(57)  = "p(s(R1,R2,R3),R4,R5)";
R_str(58)  = "p(s(R1,R2,R4),R3,R5)";
R_str(59)  = "p(s(R1,R2,R5),R3,R4)";
R_str(60)  = "p(s(R1,R3,R4),R2,R5)";
R_str(61)  = "p(s(R1,R3,R5),R2,R4)";
R_str(62)  = "p(s(R1,R4,R5),R2,R3)";
R_str(63)  = "p(s(R2,R3,R4),R1,R5)";
R_str(64)  = "p(s(R2,R3,R5),R1,R4)";
R_str(65)  = "p(s(R2,R4,R5),R1,R3)";
R_str(66)  = "p(s(R3,R4,R5),R1,R2)";

R_str(67)  = "p(s(R1,R2),R3,R4,R5)";
R_str(68)  = "p(s(R1,R3),R2,R4,R5)";
R_str(69)  = "p(s(R1,R4),R2,R3,R5)";
R_str(70)  = "p(s(R1,R5),R2,R3,R4)";
R_str(71)  = "p(s(R2,R3),R1,R4,R5)";
R_str(72)  = "p(s(R2,R4),R1,R3,R5)";
R_str(73)  = "p(s(R2,R5),R1,R3,R4)";
R_str(74)  = "p(s(R3,R4),R1,R2,R5)";
R_str(75)  = "p(s(R3,R5),R1,R2,R4)";
R_str(76)  = "p(s(R4,R5),R1,R2,R3)";

R_str(77)  = "p(s(R5,R3),s(R2,R4),R1)";
R_str(78)  = "p(s(R2,R3),s(R5,R4),R1)";
R_str(79)  = "p(s(R5,R2),s(R3,R4),R1)";
R_str(80)  = "p(s(R1,R3),s(R5,R4),R2)";
R_str(81)  = "p(s(R5,R3),s(R1,R4),R2)";
R_str(82)  = "p(s(R1,R5),s(R3,R4),R2)";
R_str(83)  = "p(s(R1,R5),s(R2,R4),R3)";
R_str(84)  = "p(s(R2,R5),s(R1,R4),R3)";
R_str(85)  = "p(s(R1,R2),s(R5,R4),R3)";
R_str(86)  = "p(s(R1,R3),s(R2,R5),R4)";
R_str(87)  = "p(s(R2,R3),s(R1,R5),R4)";
R_str(88)  = "p(s(R1,R2),s(R3,R5),R4)";
R_str(89)  = "p(s(R1,R3),s(R2,R4),R5)";
R_str(90)  = "p(s(R2,R3),s(R1,R4),R5)";
R_str(91)  = "p(s(R1,R2),s(R3,R4),R5)";

R_str(92)  = "p(s(R5,R3),p(R2,R4),R1)";
R_str(93)  = "p(s(R2,R3),p(R5,R4),R1)";
R_str(94)  = "p(s(R5,R2),p(R3,R4),R1)";
R_str(95)  = "p(s(R1,R3),p(R5,R4),R2)";
R_str(96)  = "p(s(R5,R3),p(R1,R4),R2)";
R_str(97)  = "p(s(R1,R5),p(R3,R4),R2)";
R_str(98)  = "p(s(R1,R5),p(R2,R4),R3)";
R_str(99)  = "p(s(R2,R5),p(R1,R4),R3)";
R_str(100) = "p(s(R1,R2),p(R5,R4),R3)";
R_str(101) = "p(s(R1,R3),p(R2,R5),R4)";
R_str(102) = "p(s(R2,R3),p(R1,R5),R4)";
R_str(103) = "p(s(R1,R2),p(R3,R5),R4)";
R_str(104) = "p(s(R1,R3),p(R2,R4),R5)";
R_str(105) = "p(s(R2,R3),p(R1,R4),R5)";
R_str(106) = "p(s(R1,R2),p(R3,R4),R5)";

R_str(107) = "p(p(R5,R3),s(R2,R4),R1)";
R_str(108) = "p(p(R2,R3),s(R5,R4),R1)";
R_str(109) = "p(p(R5,R2),s(R3,R4),R1)";
R_str(110) = "p(p(R1,R3),s(R5,R4),R2)";
R_str(111) = "p(p(R5,R3),s(R1,R4),R2)";
R_str(112) = "p(p(R1,R5),s(R3,R4),R2)";
R_str(113) = "p(p(R1,R5),s(R2,R4),R3)";
R_str(114) = "p(p(R2,R5),s(R1,R4),R3)";
R_str(115) = "p(p(R1,R2),s(R5,R4),R3)";
R_str(116) = "p(p(R1,R3),s(R2,R5),R4)";
R_str(117) = "p(p(R2,R3),s(R1,R5),R4)";
R_str(118) = "p(p(R1,R2),s(R3,R5),R4)";
R_str(119) = "p(p(R1,R3),s(R2,R4),R5)";
R_str(120) = "p(p(R2,R3),s(R1,R4),R5)";
R_str(121) = "p(p(R1,R2),s(R3,R4),R5)";

R_str(122) = "p(s(R4,R5),p(R1,R2,R3))";
R_str(123) = "p(s(R3,R5),p(R1,R2,R4))";
R_str(124) = "p(s(R3,R4),p(R1,R2,R5))";
R_str(125) = "p(s(R2,R5),p(R1,R3,R4))";
R_str(126) = "p(s(R2,R4),p(R1,R3,R5))";
R_str(127) = "p(s(R2,R3),p(R1,R4,R5))";
R_str(128) = "p(s(R1,R5),p(R2,R3,R4))";
R_str(129) = "p(s(R1,R4),p(R2,R3,R5))";
R_str(130) = "p(s(R1,R3),p(R2,R4,R5))";
R_str(131) = "p(s(R1,R2),p(R3,R4,R5))";

R_str(132) = "p(p(R4,R5),s(R1,R2,R3))";
R_str(133) = "p(p(R3,R5),s(R1,R2,R4))";
R_str(134) = "p(p(R3,R4),s(R1,R2,R5))";
R_str(135) = "p(p(R2,R5),s(R1,R3,R4))";
R_str(136) = "p(p(R2,R4),s(R1,R3,R5))";
R_str(137) = "p(p(R2,R3),s(R1,R4,R5))";
R_str(139) = "p(p(R1,R4),s(R2,R3,R5))";
R_str(140) = "p(p(R1,R3),s(R2,R4,R5))";
R_str(141) = "p(p(R1,R2),s(R3,R4,R5))";

R_str(142) = "p(p(R4,R5),p(R1,R2,R3))";
R_str(143) = "p(p(R3,R5),p(R1,R2,R4))";
R_str(144) = "p(p(R3,R4),p(R1,R2,R5))";
R_str(145) = "p(p(R2,R5),p(R1,R3,R4))";
R_str(146) = "p(p(R2,R4),p(R1,R3,R5))";
R_str(147) = "p(p(R2,R3),p(R1,R4,R5))";
R_str(148) = "p(p(R1,R5),p(R2,R3,R4))";
R_str(149) = "p(p(R1,R4),p(R2,R3,R5))";
R_str(150) = "p(p(R1,R3),p(R2,R4,R5))";
R_str(151) = "p(p(R1,R2),p(R3,R4,R5))";

R_str(152) = "p(R1,R2,R3,R4,R5)";


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
    case 4
        p = (1/varargin{1} + 1/varargin{2} + 1/varargin{3} + 1/varargin{4})^(-1);
    case 5
        p = (1/varargin{1} + 1/varargin{2} + 1/varargin{3} + 1/varargin{4} + 1/varargin{5})^(-1);
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
    case 4
        s = varargin{1} + varargin{2} + varargin{3} + varargin{4};
    case 5
        s = varargin{1} + varargin{2} + varargin{3} + varargin{4} + varargin{5};
    otherwise
        error('Unexpected inputs')
end
end