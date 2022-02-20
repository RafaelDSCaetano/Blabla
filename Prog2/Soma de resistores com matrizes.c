#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
main()
{
	int L, C, i, j, i2, i3, res220plus=0, m[20][10], soma=0;
setlocale(LC_ALL, "Portuguese_Brazil");
printf("Digite a quantidade de linhas: ");
scanf("%d", &L);
	if (L>20 || L<0){
		printf("\nerror 400 bad request");
		return 0;
	}
	else{
	printf("Digite a quantidade de colunas: ");
	scanf("%d", &C);
		if (C>10 || L<0){
			printf("\nerror 400 bad request");
			return 0;
		}
		else{
		printf("Digite as resistencias\n");
		for(i=0; i<L; i++)
			for(j=0; j<C; j++)
				{
					scanf("%d", &m[i][j]);
					if(m[i][j]>220)
					{
					res220plus++;
					}
				}
		for(i2=0; i2<L; i2++)
			{
				soma=0;
			for(i3=0; i3<C; i3++)
				{
					soma=soma+m[i2][i3];
				}
			printf("\n%d", soma);
			}
	}
}
printf("\n%d resistores a cima de 220 ohms", res220plus);
}
