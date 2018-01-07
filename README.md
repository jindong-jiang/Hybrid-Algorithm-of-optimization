# Hybrid-Algorithm-of-optimization
For the algorithm of optimization where there is the random method, it can be strong at finding the global optimization rather than being 
trapped in the local optimisation, howerver, the acuracy is not really satisfying. And  for the algorithm classic, like the gradient method,it can get the optimization acurately, but it is really easy to get trapped in the local optimisation. So here, these two kinds of algorithms are hybride. For the first step,  algorithm of optimization with random element is used to get the minimum area, and then based on its result, the algorithm of grandient is used to get the result more accurate.

In the program, the optimization.m is the main function,thers is a GUI to guide the users. The users can choose the optimisation methods to hybrid, for the first kind method, uses can choose the GA(Genetic Algorithm),PSO(Particle Swarm Optimization) or SA(simulated Annealing ), for the second type, users can choose the Newton Method, Gradient Descent and  CG(Conjugate Gradient Method). The function defaut here is test function,aka,rosenbrock, f=(1-x(1))^2+100*(x(2)-x(1)^2)^2, which is really easy to get trapped in the local optimisation. Users can program their own function. 

With this algorithm, a problem of design of TMD(Tuned Mass Damper) is solved,the mathematic model of the TMD is built with Matlab, the function is tmd.m. 

Here is the interface and test result of the algorithm.

**Interface**  
![Interface](https://github.com/kyle662606957/Hybrid-Algorithm-of-optimization/blob/master/Img/Interface.PNG)  
**Result of genetic algorithm**  
![Result of genetic algorithm](https://github.com/kyle662606957/Hybrid-Algorithm-of-optimization/blob/master/Img/Result%20of%20Genetic%20Algorithm.PNG)  
**Result of the newton methode**  
![Result of the newton methode](https://github.com/kyle662606957/Hybrid-Algorithm-of-optimization/blob/master/Img/result%20of%20the%20Newton%20Method.PNG) 
