function res = escalonar(A)
  [n, m] = size(A);

  if n != m
    error("A matriz deve ser quadrada.");
  endif


  for k = 1:n
    for i = k+1:n
      if A(k,k) == 0
        error("Pivô zero encontrado. Reordenação necessária.");
      endif
      fator = A(i,k) / A(k,k);
      A(i,:) = A(i,:) - fator * A(k,:);
    endfor
  endfor


  for k = n:-1:1
    for i = k-1:-1:1
      if A(k,k) == 0
        error("Pivô zero encontrado. Reordenação necessária.");
      endif
      fator = A(i,k) / A(k,k);
      A(i,:) = A(i,:) - fator * A(k,:);
    endfor
  endfor


  for i = 1:n
    A(i,:) = A(i,:) / A(i,i);
  endfor

  res = A;
endfunction

%exemplo de uso
%A = [2 1 1; 4 -6 0; -2 7 2];
%diagonalizada = escalonar(A)
