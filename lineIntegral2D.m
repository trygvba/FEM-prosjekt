function I = lineIntegral2D(p1,p2,Nq,g)
    a = 0;
    b= 1;
	y = @(x) (b-a)/2*x+(b+a)/2;
    L=sqrt((p2-p1)'*(p2-p1));
	switch Nq
		case 1
			p = 2;
			ztemp = 0;
		case 2
			p = [1 1];
			ztemp = (1/sqrt(3))*[-1 1];
		case 3
			p = (1/9)*[5 8 5];
			ztemp = sqrt(3/5)*[-1 0 1];
		case 4
			temp1 = 0.5;
			temp2 = sqrt(30)/36;
			p = [temp1-temp2 temp1+temp2 temp1+temp2 temp1-temp2];
			temp3 =3/7;
			temp4 = 2*sqrt(6/5)/7;
			ztemp = [-sqrt(temp3+temp4) -sqrt(temp3-temp4) sqrt(temp3-temp4) sqrt(temp3+temp4)];
		otherwise
			disp("Her ble det noe feil, er Nq = 1,2,3,4?")
			break;
    end
    I=0;
    for i=1:Nq
        x = 0.5*(p2-p1)*ztemp(i)+0.5*(p2+p1);
        I = I+L/2*p(i)*feval(g,x);
    end
end


