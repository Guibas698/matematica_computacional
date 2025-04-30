function res = jacob(A, b, x0)


  n = length(b);
  Ab = [A b];


  for k = 1:n-1

    [~, idx] = max(abs(Ab(k:n, k)));
    idx = idx + k - 1;
    if idx != k
      Ab([k, idx], :) = Ab([idx, k], :);
    endif

    for i = k+1:n
      fator = Ab(i,k) / Ab(k,k);
      Ab(i,:) = Ab(i,:) - fator * Ab(k,:);
    endfor
  endfor


  x = zeros(n, 1);
  for i = n:-1:1
    x(i) = (Ab(i,end) - Ab(i,1:n) * x) / Ab(i,i);
  endfor

  res = x;
endfunction

%para rodar
%result = nonlinear()


