function res = nonlinear()

  x = [1; 1];
  tol = 1e-6;
  max_iter = 100;
  iter = 0;

  while iter < max_iter
    iter += 1;


    f = [5*x(1)^2 - x(2) - 46;
         2*x(1) + 11*x(2)^2 - 17];


    J = [10*x(1), -1;
         2, 22*x(2)];


    dx = jacob(J, -f, x);

    x_new = x + dx;

    if norm(dx) < tol
      printf("Convergiu em %d iterações.\n", iter);
      res = x_new;
      return;
    endif

    x = x_new;
  endwhile

  disp("Nao convergiu");
  res = x;
endfunction

