// Gmsh project created on Tue Nov  5 12:32:02 2013
lc = 0.2;
h = 4;
Point(1) = {0, 0, 0, lc};
Point(2) = {0, 0.5, 0, lc};
Point(3) = {0.5, 0, 0, lc};
Point(4) = {0, -0.5, 0, lc};
Point(5) = {-0.5, 0, 0, lc};
Point(6) = {0, 0, h, lc};
Point(7) = {0, 0.5, h, lc};
Point(8) = {0.5, 0, h, lc};
Point(9) = {0, -0.5, h, lc};
Point(10) = {-0.5, 0, h, lc};



Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Circle(5) = {7, 6, 8};
Circle(6) = {8, 6, 9};
Circle(7) = {9, 6, 10};
Circle(8) = {10, 6, 7};

Line(9) = {2,7};
Line(10) = {4,9};
Line(11) = {3,8};
Line(12) = {5,10};

//Line Loop(13) = {5, -11, -1, 9};
//Ruled Surface(14) = {13};
//Line Loop(15) = {11, 6, -10, -2};
//Ruled Surface(16) = {15};
//Line Loop(17) = {10, 7, -12, -3};
//Ruled Surface(18) = {17};
//Line Loop(19) = {12, 8, -9, -4};
//Ruled Surface(20) = {19};
//Line Loop(21) = {5, 6, 7, 8};
//Ruled Surface(22) = {21};
//Line Loop(23) = {2, 3, 4, 1};
//Ruled Surface(24) = {23};
//Surface Loop(25) = {20, 18, 16, 14, 22, 24};
//Volume(26) = {25};



Line Loop(13) = {6, -10, -2, 11};
Ruled Surface(14) = {13};
Line Loop(15) = {12, -7, -10, 3};
Ruled Surface(16) = {15};
Line Loop(17) = {12, 8, -9, -4};
Ruled Surface(18) = {17};
Line Loop(19) = {5, -11, -1, 9};
Ruled Surface(20) = {19};
Line Loop(21) = {5, 6, 7, 8};
Plane Surface(22) = {21};
Line Loop(23) = {4, 1, 2, 3};
Plane Surface(24) = {23};
Surface Loop(25) = {24, 18, 16, 22, 20, 14};
Volume(26) = {25};
