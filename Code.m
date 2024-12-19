% Mechanics of Solids II Programming Project
% Simply supported beam with uniformly distributed load, rectangular section

% Input parameters
printf("Simply Supported Beam with Rectangular Cross Section Calculator \n\n");
printf("Description:\nThis is a program that will calculate the required parameters for the design of \nsimply supported beams subjected to uniformly distributed load with a rectangular cross section.\n\n");
printf("Instructions: \n1. Enter the value for the parameter stated.\n2. Press enter.\n3. Repeat step 1 and 2 until all parameters required are entered.\n\n");
printf("Note:\nFor exponential notations, please add the term 'e+number' or 'e-number' after each value.\n\n");
printf("Example:\nFor 200 GPa, please type 200e+9.\nFor 100 mPa, please type 100e-3.\n\n");
printf("Common prefixes used:\nPrefix         Factor\nTera  (T)      10^12\nGiga  (G)      10^9\nMega  (M)      10^6\nKilo  (k)      10^3\nDeci  (d)      10^-1\nCenti (c)      10^-2\nMilli (m)      10^-3\n\n");
printf("Please enter the value for the following parameters:\n\n");

E = input("Modulus of elasticity, E (Pa): ");
Sy = input("Yield strength, Sy (Pa): ");
b = input("Width of the cross section, b (m): ");
a = input("Height of the cross section, a (Pa): ");
x = input("Length of the beam, x (m): ");

% i) The location of the critical section
% ii) The maximum moment at the critical section in terms of w
RA = (x*(x/2))/x;                       % Reaction due to bearing A in terms of w (N)
RB = RA;                                % Reaction due to bearing B in terms of w (N)

L = [0.1:0.1:x];
M = RA.*L - L.*(L/2);
[Mc,Mc_index] = max(M,[],2);            % Maximum moment acting on the beam in terms of w (Nm)
Lmax = L(Mc_index);                     % Location of critical section measured from the left side of the beam (m)


% iii) The moment when yielding first occurs in the beam
I = (b*a^3)/12;                         % Second moment of inertia (m^4)
c = a/2;                                % Perpendicular distance from the neutral axis to the point farthest away from the neutral axis (m)
My = Sy*I/c;                            % The yield moment (Nm)


% iv) The moment when full plastic occurs in the beam
yp = a/2;                               % Neutral axis of the beam (m)
Mp = 2*Sy*((a - yp)*b)*((a - yp)/2);    % The plastic moment (Nm)


% v) The shape factor of the beam
k = Mp/My;                              % Shape factor of the beam


% vi) The maximum uniform distributed load that causes initial yield
Wy = My/Mc;                             % Uniformly distributed load that causes initial yield


% vi) The maximum uniform distributed load that causes plastic collapse
Wp = Mp/Mc;                             % Uniformly distributed load that causes plastic collapse


% Output parameters
format short e
printf("\n\nResults:\nParameters                                Value   \n");
printf("1. The location of the critical\n   section measured from the left\n   side of the beam, Lmax                 %d m\n\n", Lmax);
printf("2. The maximum moment of the\n   critical section in terms of w,\n   Mc                                     %d w Nm\n\n", Mc);
printf("3. The yield moment, My                   %.*e Nm\n\n", 3, My);
printf("4. The plastic moment, Mp                 %.*e Nm\n\n", 3, Mp);
printf("\n5. The shape factor of the\n   beam, k                                %.*d\n\n", 4, k);
printf("6. The maximum uniform distributed\n   load that causes initial\n   yield, Wy                              %.*e N/m\n\n", 3, Wy);
printf("7. The maximum uniform distributed\n   load that causes plastic\n   collapse, Wp                           %.*e N/m\n\n", 3, Wp);
printf("\nEnd of program. To repeat the program, press the up arrow key on the keyboard and press enter.\n\n");


