function Sp = parte1_p4()
  tpArray =zeros(nproc,1);
  spArray = zeros(nproc, 1);
  
  tic();
  parte1_p2();
  Ts = toc()
  
  for i = 1:nproc
    tic();
    parte1_p3(i);
    tmpTp = toc();
    tpArray(i) = tmpTp;
  endfor
  
  textResult = "";
  for i = 1:nproc
    spArray(i) = Ts/tpArray(i);
    textResult = strcat(textResult,"Aceleración con ", num2str(i), " procesadores:", num2str(spArray(i)), "\n" );
  endfor
  disp(textResult);
endfunction