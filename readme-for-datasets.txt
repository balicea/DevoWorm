Goal is to build extensible n-Quad data structures in RDF.

Data available from Github site (http://www.github.com/balicea/DevoWorm/)

several folders with Excel files (dataset repository).

To begin:

1) OpenWorm data -- lineage tree db.

2) positional information (EPIC/WormGuides) -- data is from EPIC/WormGuides and sorted by Sulston mother-daughter annotation.

3) want RDF data structures, XML graphical structures.

Example #1: x,y,z,sg

x = subject

y = predicate

z = object

spatial graph = context

Example #2: i,t,theta,tg

* i is cell size (volume or diameter), t is division event number, theta is spatial angle of differentiation.

i = subject

t = predicate

theta = object

trajectory graph = context

* cell size (i): how to approximate? Voronoi diagram? Infer from other properties?

* division event number -- have data (not perfect approximation, but useful) that we can utilize.

* spatial angle of differentiation can be inferred from position and timing.
