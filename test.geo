// Gmsh project created on Sun Oct 20 16:33:40 2013
Point(1) = {0, 0, 0, 1.0};
Point(2) = {1, 0, 0, 1.0};
Line(1) = {1, 2};
Point(3) = {0, 1, 0, 1.0};
Point(4) = {0, 0, 1, 1.0};
Line(2) = {3, 1};
Line(3) = {3, 2};
Line(4) = {4, 3};
Line(5) = {4, 1};
Line(6) = {2, 4};
Line Loop(7) = {4, 2, -5};
Plane Surface(8) = {7};
Circle(9) = {1, 4, 2};
Delete {
  Line{9};
}
Line Loop(9) = {5, 1, 6};
Plane Surface(10) = {9};
Line Loop(11) = {6, 4, 3};
Plane Surface(12) = {11};
Line Loop(13) = {1, -3, 2};
Plane Surface(14) = {13};
Surface Loop(15) = {12, 10, 8, 14};
Volume(16) = {15};
