#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
main()
{
setlocale(LC_ALL, "Portuguese_Brazil");
int N, contador, A=0;
		printf("Digite a quantidade de resistores\n");
		scanf("%d", &N);
	if(N>2000)
	{
		printf("EPA PERA LÁ AMIGÃO, você esta pedindo de mais desse programa!!!\n");		
	}
	else{
int  resistores[N];

	printf("agora digite os resistores\n");
	
for(contador=0; contador<N; contador++){
	scanf("%d", &resistores[contador]);
}

for(contador=0; contador<N; contador++){
	if(resistores[contador] >= 950 && resistores[contador] <= 1050)
		{
			printf("\n%d dentro da faixa", resistores[contador]);
			A++;	
		}
	else
		{
			printf("\n%d fora da faixa", resistores[contador]);	
		}
}

	printf("\n%d", A);

}
}

