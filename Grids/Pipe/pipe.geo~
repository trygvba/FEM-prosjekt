// Gmsh project created on Tue Nov  5 12:32:02 2013
lc = 0.1;
h = 4;
r=0.5;
w = r/4;

//Outer Tube:
Point(1) = {0, 0, 0, lc};
Point(2) = {0, r, 0, lc};
Point(3) = {r, 0, 0, lc};
Point(4) = {0, -r, 0, lc};
Point(5) = {-r, 0, 0, lc};
Point(6) = {0, 0, h, lc};
Point(7) = {0, r, h, lc};
Point(8) = {r, 0, h, lc};
Point(9) = {0, -r, h, lc};
Point(10) = {-r, 0, h, lc};

Circle(1) = {7, 6, 8};

Circle(2) = {8, 6, 9};
Circle(3) = {9, 6, 10};
Circle(4) = {10, 6, 7};
Circle(5) = {5, 1, 2};
Circle(6) = {2, 1, 3};
Circle(7) = {3, 1, 4};
Circle(8) = {4, 1, 5};
Line(9) = {2, 7};
Line(10) = {5, 10};
Line(11) = {4, 9};
Line(12) = {3, 8};

//Inner Tube:
Point(11) = {0,r-w,0,lc};
Point(12) = {r-w,0,0,lc};
Point(13) = {0, -(r-w),0,lc};
Point(14) = {-(r-w),0,0,lc};
Point(15) = {0,r-w,h,lc};
Point(16) = {r-w,0,h,lc};
Point(17) = {0, -(r-w),h,lc};
Point(18) = {-(r-w),0,h,lc};
 
Circle(13) = {14, 1, 11};
Circle(14) = {11, 1, 12};
Circle(15) = {13, 1, 12};
Circle(16) = {13, 1, 14};
Circle(17) = {18, 6, 15};
Circle(18) = {16, 6, 15};
Circle(19) = {17, 6, 16};
Circle(20) = {17, 6, 18};
Line(21) = {15, 11};
Line(22) = {12, 16};
Line(23) = {17, 13};
Line(24) = {14, 18};

//surfaces:
Line Loop(25) = {19, -22, -15, -23};
Ruled Surface(26) = {25};
Line Loop(27) = {22, 18, 21, 14};
Ruled Surface(28) = {27};
Line Loop(29) = {21, -13, 24, 17};
Ruled Surface(30) = {29};
Line Loop(31) = {24, -20, 23, 16};
Ruled Surface(32) = {31};
Line Loop(33) = {1, -12, -6, 9};
Ruled Surface(34) = {33};
Line Loop(35) = {12, 2, -11, -7};
Ruled Surface(36) = {35};
Line Loop(37) = {11, 3, -10, -8};
Ruled Surface(38) = {37};
Line Loop(39) = {5, 9, -4, -10};
Ruled Surface(40) = {39};
Line Loop(41) = {1, 2, 3, 4};
Line Loop(42) = {17, -18, -19, 20};
Plane Surface(43) = {41, 42};
Line Loop(44) = {6, 7, 8, 5};
Line Loop(45) = {15, -14, -13, -16};
Plane Surface(46) = {44, 45};

//Volume:
Surface Loop(47) = {26, 43, 34, 36, 38, 40, 46, 32, 30, 28};
Volume(48) = {47};
