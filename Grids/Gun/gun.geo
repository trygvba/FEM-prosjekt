lc = 0.1;
h = 0.18;
Point(1) = {0, 0, 0, lc};
Point(2) = {0, 0, 0, lc};
Point(3) = {0.5, -0, 0, lc};
Point(4) = {0.2, 0.7, 0, lc};
Point(5) = {0.7, 0.7, 0, lc};
Point(6) = {0.1, 0.7, 0, lc};
Point(7) = {0.1, 1.0, 0, lc};
Point(8) = {1.6, 1.0, -0, lc};
Point(9) = {1.6, 0.7, -0, lc};
Point(10) = {0.915, 0.5, -0, lc};
Point(11) = {1, 0.7, -0, lc};
Point(12) = {0.642857143, 0.5, -0, lc};
Point(13) = {0.657142857, 0.55, -0, lc};
Point(14) = {0.9, 0.55, -0, lc};
Point(15) = {1.05, 0.7, -0, lc};


Line(1) = {1, 3};
Line(2) = {1, 4};
Line(3) = {4, 6};
Line(4) = {6, 7};
Line(5) = {7, 8};
Line(6) = {8, 9};
Line(7) = {11, 5};
Line(8) = {12, 3};
Line(9) = {12,10};
Line(10) = {15,10};
Line(11) = {12,10};
Line(12) = {11,14};
Line(13) = {13,14};
Line(14) = {13,5};
Line(15) = {15,9};

//Surface 2

Point(16) = {0, 0, h, lc};
Point(17) = {0, 0, h, lc};
Point(18) = {0.5, -0, h, lc};
Point(19) = {0.2, 0.7, h, lc};
Point(20) = {0.7, 0.7, h, lc};
Point(21) = {0.1, 0.7, h, lc};
Point(22) = {0.1, 1.0, h, lc};
Point(23) = {1.6, 1.0, h, lc};
Point(24) = {1.6, 0.7, h, lc};
Point(25) = {0.915, 0.5, h, lc};
Point(26) = {1, 0.7, h, lc};
Point(27) = {0.642857143, 0.5, h, lc};
Point(28) = {0.657142857, 0.55, h, lc};
Point(29) = {0.9, 0.55, h, lc};
Point(30) = {1.05, 0.7, h, lc};


Line(16) = {1+15, 3+15};
Line(17) = {1+15, 4+15};
Line(18) = {4+15, 6+15};
Line(19) = {6+15, 7+15};
Line(20) = {7+15, 8+15};
Line(21) = {8+15, 9+15};
Line(22) = {11+15, 5+15};
Line(23) = {12+15, 3+15};
Line(24) = {12+15,10+15};
Line(25) = {15+15,10+15};
Line(26) = {12+15,10+15};
Line(27) = {11+15,14+15};
Line(28) = {13+15,14+15};
Line(29) = {13+15,5+15};
Line(30) = {15+15,9+15};

//connect surfaces

Line(31) = {1,16};
Line(32) = {2,17};
Line(33) = {3,18};
Line(34) = {4,19};
Line(35) = {5,20};
Line(36) = {6,21};
Line(37) = {7,22};
Line(38) = {8,23};
Line(39) = {9,24};
Line(40) = {10,25};
Line(41) = {11,26};
Line(42) = {12,27};
Line(43) = {13,28};
Line(44) = {14,29};
Line(45) = {15,30};

//barrel
rbarrel = h/4;
//front end
Point(31) = {1.6,0.85,h/2,lc}; //barrel axis
Point(32) = {1.6,0.85,h/2+rbarrel,lc};
Point(33) = {1.6,0.85,h/2-rbarrel,lc};
Point(34) = {1.6,0.85+rbarrel,h/2,lc};
Point(35) = {1.6,0.85-rbarrel,h/2,lc};
//backend
Point(36) = {0.3,0.85,h/2,lc}; //barrel axis
Point(37) = {0.3,0.85,h/2+rbarrel,lc};
Point(38) = {0.3,0.85,h/2-rbarrel,lc};
Point(39) = {0.3,0.85+rbarrel,h/2,lc};
Point(40) = {0.3,0.85-rbarrel,h/2,lc};
//connect
Circle(46) = {32, 31, 35};
Circle(47) = {35, 31, 33};
Circle(48) = {33, 31, 34};
Circle(49) = {34, 31, 32};
Circle(50) = {39, 36, 38};
Circle(51) = {38, 36, 40};
Circle(52) = {40, 36, 37};
Circle(53) = {37, 36, 39};
Line(54) = {32, 37};
Line(55) = {34, 39};
Line(56) = {33, 38};
Line(57) = {35, 40};



Line Loop(58) = {39, -21, -38, 6};
Line Loop(59) = {46, 47, 48, 49};
Plane Surface(60) = {58, 59};
Line Loop(61) = {54, -52, -57, -46};
Plane Surface(62) = {61};
Line Loop(63) = {54, 53, -55, 49};
Plane Surface(64) = {63};
Line Loop(65) = {52, 53, 50, 51};
Plane Surface(66) = {65};
Line Loop(67) = {57, -51, -56, -47};
Plane Surface(68) = {67};
Line Loop(69) = {56, -50, -55, -48};
Plane Surface(70) = {69};
Line Loop(71) = {15, -6, -5, -4, -3, -2, 1, -8, 9, -10};
Line Loop(72) = {12, -13, 14, -7};
Plane Surface(73) = {71, 72};
Line Loop(74) = {23, -16, 17, 18, 19, 20, 21, -30, 25, -24};
Line Loop(75) = {28, -27, 22, -29};
Plane Surface(76) = {74, 75};
Line Loop(77) = {8, 33, -23, -42};
Plane Surface(78) = {77};
Line Loop(79) = {24, -40, -9, 42};
Plane Surface(80) = {79};
Line Loop(81) = {10, 40, -25, -45};
Plane Surface(82) = {81};
Line Loop(83) = {27, -44, -12, 41};
Plane Surface(84) = {83};
Line Loop(85) = {22, -35, -7, 41};
Plane Surface(86) = {85};
Line Loop(87) = {35, -29, -43, 14};
Plane Surface(88) = {87};
Line Loop(89) = {13, 44, -28, -43};
Plane Surface(90) = {89};
Line Loop(91) = {15, 39, -30, -45};
Plane Surface(92) = {91};
Line Loop(93) = {20, -38, -5, 37};
Plane Surface(94) = {93};
Line Loop(95) = {1, 33, -16, -31};
Plane Surface(96) = {95};
Line Loop(97) = {17, -34, -2, 31};
Plane Surface(98) = {97};
Line Loop(99) = {18, -36, -3, 34};
Plane Surface(100) = {99};
Line Loop(101) = {19, -37, -4, 36};
Plane Surface(102) = {101};
Volume(105) = {103};
Surface Loop(106) = {76, 78, 73, 92, 60, 94, 102, 100, 98, 96, 64, 62, 66, 70, 68, 82, 80, 86, 88, 90, 84};
Volume(107) = {106};
