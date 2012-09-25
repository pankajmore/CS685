# This is the octave file used to check for relations between the 7 columns given below

A = [12.9;3.5;15.7;2.8;6.7;10.3;4.5]

B = [3.8;8.9;18.9;7.8;10.9;5.5;13.2]

C = [73.3;20.2;14.7;19.0;6.5;43.8;34.7]

D = [22.6;56.6;172.6;46.6;77.6;32.6;100.6]

E = [.32;-.35;0;.33;.40;-.76;-.97]

F = [-1.42;-.35;+1.02;1.06;-1.07;.01;1.38]

G = [110;10;1000;1;11;101;10]

H = [6;2;8;1;3;5;2]

# Following 3 relations were found after a careful analysis keeping the signal-to-noise ratio in mind.

# sin(A) = E

# 7 * B = D

# A/2 = Base10(G)
# where Base10(G) means each element of G transformed from binary to decimal

