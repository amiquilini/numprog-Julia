## Programação numérica em Julia
Alguns problemas abordados na disciplina "Fundamentos Computacionais de Simulações em Química", utilizando conceitos de programação numérica em Julia.

### Cinética Química:

**26.** O mecanismo-modelo mais conhecido de catálise enzimática é o mecanismo de Michaellis-Menten: 

![image](https://user-images.githubusercontent.com/60985740/113944911-b083ed00-97db-11eb-89bd-9cd7975cabdd.png)

onde E e S são a enzima e o substrato, ES é o complexo enzima-substrato, e P é o produto da reação. Faça um programa que simule esta cinética enzimática. Varie as concentrações dos reagentes para encontrar as condições nas quais a aproximação do estado estacionário é razoável (isto é, que a concentração do complexo é aproximadamente constante ao longo da
reação).


**27.** A decomposição da camada de ozônio pelos clorofluorcarbonos acontece através de uma reação em cadeia. A reação se inicia pela decomposição do clorofluorcarbono formando cloro radicalar, o que acontece sob radiação ultravioleta,

![image](https://user-images.githubusercontent.com/60985740/113944929-bda0dc00-97db-11eb-9770-e9c242c075b1.png)

O cloro radicalar decompõe o ozônio de forma catalítica, pelas reações:

![image](https://user-images.githubusercontent.com/60985740/113944969-d0b3ac00-97db-11eb-8544-27f66cdec8e7.png)

Faça um programa que simule este mecanismo reacional.


### Otimização com derivadas:

**31.** Faça um programa que minimize a função x2 + sen (10x). A sintaxe para o seno em dupla precisão é dsin(x). Faça testes variando o tamanho de passo e os pontos iniciais, no intervalo [−2, 2].


### Funções multivariadas:

**36.** Minimizar a função x2 + y2 utilizando método do gradiente.
