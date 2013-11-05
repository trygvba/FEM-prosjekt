// Gmsh project created on Sun Nov  3 16:32:37 2013
lc = 0.001;	//Characteristic length
h = 0.02;	//Height of plate.
Point(1) = {0, 0, 0, lc};
Point(2) = {1, 0, 0, lc};
Point(3) = {1, 1, 0, lc};
Point(4) = {0, 1, 0, lc};
Point(5) = {0, 0, h, lc};
Point(6) = {1, 0, h, lc};
Point(7) = {1, 1, h, lc};
Point(8) = {0, 1, h, lc};


Line(1) = {5, 8};
Line(2) = {1, 4};
Line(3) = {1, 5};
Line(4) = {4, 8};

Line(5) = {5, 6};
Line(6) = {1, 2};
Line(7) = {2, 6};
Line(8) = {6, 7};
Line(9) = {2, 3};
Line(10) = {3, 7};
Line(11) = {7, 8};
Line(12) = {3, 4};
Line Loop(13) = {10, 11, -4, -12};
Plane Surface(14) = {13};
Line Loop(15) = {8, 11, -1, 5};
Plane Surface(16) = {15};
Line Loop(17) = {8, -10, -9, 7};
Plane Surface(18) = {17};
Line Loop(19) = {7, -5, -3, 6};
Plane Surface(20) = {19};
Line Loop(21) = {6, 9, 12, -2};
Plane Surface(22) = {21};
Line Loop(23) = {2, 4, -1, -3};
Plane Surface(24) = {23};
Surface Loop(25) = {14, 18, 16, 24, 22, 20};
Volume(26) = {25};

//Physical Surface(27) = {20, 24, 22, 18, 14, 16}; //Boundary har ID 27!!
