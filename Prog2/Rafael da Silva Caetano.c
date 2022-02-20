#include <stdio.h>
#include <stdlib.h>
float periodo(float ra, float rb, float c);
main()
{
float frequencia, ra, rb, c, p, c2;
printf("\nDigite ra em ohms: ");
scanf("%f", &ra);
printf("\nDigite rb em ohms: ");
scanf("%f", &rb);
printf("\nDigite C em micro: ");
scanf("%f", &c2);
c=c2/1000000;
p = periodo(ra, rb, c);
frequencia = 1.0 / p;
printf("\n%f", frequencia);
}
float periodo(float ra, float rb, float c)
{
	float T;
	T = 0.693 * ( ra + (rb + rb )) * c;
	return T;
}
