FEM-prosjekt
============

Kode og annet til prosjektet i endelig elementmetoder

quadrature1D.m: Funksjon som numerisk approksimerer et endimensjonalt integral over intervalet (a,b) med integrand 'g'. N er antall kvadraturpunkter og input skal per nå være 1,2,3 eller 4.
	Eksempel: quadrature1D(0,pi,1,'sin')=3.14
		quadrature1D(0,pi,4,'sin')=2.00

Helmholtz.m: Bruker endelig elementmetode til å approksimere løsningen på helmholtzproblemet. Ekvidistante noder. Problemer med loadingvektoren, will be fixed.
