function [p tri tetr] = loadGeo(filenm)
%loadGeo laster inn geometrien filenm produsert i gmsh som skal ligge i directory FEM-prosjekt/Grids

addpath(genpath('../Grids'))

p = load([filenm '_nodes.m' ]);
p = p[:,2:4];

tri = load([filnm '_tri.m']);
tri = tri[:,1:3];

tetr = load([filnm '_tetr.m']);

end
