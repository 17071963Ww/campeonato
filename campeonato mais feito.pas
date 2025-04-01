program Campeonato;    // willian pinotti - gabriel dolzan
uses CRT;

Const
  MaxArquibancada = 1300;
  MaxSocio = 200;
  MaxGeral = 850;
  MaxVisita = 350;

  ValorArquibancada = 150;
  ValorSocio = 70;
  ValorGeral = 50;
  ValorVisitante = 100;

var
  op: byte;
  filaSocio: array[1..MaxSocio] of string;
  countSocio: integer = 0;
  filaTorcedor: array[1..(MaxArquibancada + MaxGeral)] of string;  
  countTorcedor: integer = 0;
  filaVisitante: array[1..MaxVisita] of string;
  countVisitante: integer = 0;

  ingressosSocio: array[1..MaxSocio] of integer;
  topoSocio: integer;
  
  ingressosTorcedor: array[1..(MaxArquibancada + MaxGeral)] of integer;   
  topoTorcedor: integer;

  ingressosVisitante: array[1..MaxVisita] of integer;
  topoVisitante: integer;

  // Localização dos assentos
  assentosArquibancada: array[1..MaxArquibancada] of boolean; 
  assentosGeral: array[1..MaxGeral] of boolean; 

  valorIngresso: integer;
  
  valorAcumuladoSocio: integer = 0;  
  valorAcumuladoTorcedor: integer = 0;  
  valorAcumuladoVisitante: integer = 0;  

//================ PROCEDURES =================//

procedure InicializaPilhas();
var
  i: integer;
begin
  topoSocio := MaxSocio;
  for i := 1 to MaxSocio do
    ingressosSocio[i] := i;

  topoTorcedor := MaxArquibancada + MaxGeral;   
  for i := 1 to (MaxArquibancada + MaxGeral) do
    ingressosTorcedor[i] := i;

  topoVisitante := MaxVisita;
  for i := 1 to MaxVisita do
    ingressosVisitante[i] := i;
  
  // Inicializa os assentos como disponíveis
  for i := 1 to MaxArquibancada do
    assentosArquibancada[i] := true;
  for i := 1 to MaxGeral do
    assentosGeral[i] := true;
end;

procedure Monta_Tela();
var 
	i : integer;
begin
  textcolor(white);
  clrscr;
  gotoxy(23,1);
  writeln(' _____________________________');
  gotoxy(23,2);
  writeln('|        Arquibancada         |');
  gotoxy(23,3);
  writeln('|    MAX ',MaxArquibancada,' | Sócio: ',MaxSocio,'    |');
  gotoxy(23,4);
  writeln('|        Vagas: ', MaxSocio + MaxGeral + MaxVisita,'          |');

  gotoxy(56,1);
  writeln(' ___________________________________________ '); 
  gotoxy(56,2);
  writeln('|                   Geral                   |');
  gotoxy(56,3);
  writeln('|       MAX Torcedor ',MaxGeral,' / visita ',MaxVisita,'       |');
  gotoxy(56,4);
  writeln('|  Vagas Torcedor: ', MaxGeral,' | Vagas Visita: ', MaxVisita,'  |');

  writeln('========================================================================================================================');

  gotoxy(1,8); 
  writeln('=Cabine Visitante=');

  gotoxy(31,8); 
  writeln('=Cabine Torcedor= ');

  gotoxy(61,8); 
  writeln('=  Cabine Sócio  =');

  textcolor(lightgreen);
  for i := 1 to countSocio do
  begin
    gotoxy(61, 9 + i);
    writeln(filaSocio[i]);
  end;

  textcolor(lightblue);
  for i := 1 to countTorcedor do
  begin
    gotoxy(31, 9 + i);
    writeln(filaTorcedor[i]);
  end;

  textcolor(lightred);
  for i := 1 to countVisitante do
  begin
    gotoxy(1, 9 + i);
    writeln(filaVisitante[i]);
  end;

  textcolor(yellow);
  gotoxy(75, 27);
  writeln('Ingressos Restantes:');
  
  gotoxy(78, 28);
  textcolor(lightred);
  writeln('Visitante: ', topoVisitante);
  
  gotoxy(78, 29);
  textcolor(lightblue);
  writeln('Torcedor: ', topoTorcedor);
  
  gotoxy(80, 30);
  textcolor(lightgreen);
  writeln('Sócio: ', topoSocio);

  gotoxy(96,8);  
  textcolor(white);
  writeln('======ESTATISTICAS======');  
  gotoxy(96,10);
  textcolor(lightgreen);
  writeln('Total Sócios: R$', valorAcumuladoSocio);
  gotoxy(96,11);
  textcolor(lightblue);
  writeln('Total Torcedores: R$', valorAcumuladoTorcedor);
  gotoxy(96,12);
  textcolor(lightred);
  writeln('Total Visitantes: R$', valorAcumuladoVisitante);

  gotoxy(96,23);  
  writeln('=========OPÇÕES=========');  
  gotoxy(97,25);  
  writeln(' 1 - Adicionar cliente');
  gotoxy(97,26);  
  writeln(' 2 - Processar fila');
  gotoxy(97,27);  
  writeln(' 0 - Sair ');

  gotoxy(48,27); 
end;


procedure EscolheAssento(tipo: integer);
var
  assentoEscolhido: integer;
  assentoSelecionado: boolean;
begin
  assentoSelecionado := false;  

  if tipo = 1 then  
  begin
    writeln('Escolha seu assento na Arquibancada');
    repeat
      for assentoEscolhido := 1 to MaxArquibancada do
      begin
          write('Escolha o número do assento: ');
          readln(assentoEscolhido);
          if assentosArquibancada[assentoEscolhido] then
          begin
            assentosArquibancada[assentoEscolhido] := false;
            writeln('Assento ', assentoEscolhido, ' reservado para você.');
            assentoSelecionado := true;
            break;
          end
          else
            writeln('Este assento já está ocupado. Tente outro.');
      end;
    until assentoSelecionado;
  end
  else if tipo = 3 then 
  begin
    writeln('Escolha seu assento na Geral');
    repeat
      for assentoEscolhido := 1 to MaxGeral do
      begin
          write('Escolha o número do assento: ');
          readln(assentoEscolhido);
          if assentosGeral[assentoEscolhido] then
          begin
            assentosGeral[assentoEscolhido] := false;
            writeln('Assento ', assentoEscolhido, ' reservado para você.');
            assentoSelecionado := true;
            break;
          end
          else
            writeln('Este assento já está ocupado. Tente outro.');
        end;
    until assentoSelecionado;
  end
  else if tipo = 2 then  
  begin
    writeln('Escolha seu assento:');
    writeln('1 - Arquibancada');
    writeln('2 - Geral');
    write('Digite sua escolha: ');
    readln(assentoEscolhido);
    
    if assentoEscolhido = 1 then  
    begin
      writeln('Escolha seu assento na Arquibancada');
      repeat
        for assentoEscolhido := 1 to MaxArquibancada do
        begin
            write('Escolha o número do assento: ');
            readln(assentoEscolhido);
            if assentosArquibancada[assentoEscolhido] then
            begin
              assentosArquibancada[assentoEscolhido] := false;
              writeln('Assento ', assentoEscolhido, ' reservado para você.');
              assentoSelecionado := true;
              break;
            end
            else
              writeln('Este assento já está ocupado. Tente outro.');
        end;
      until assentoSelecionado;
    end
    else if assentoEscolhido = 2 then  
    begin
      writeln('Escolha seu assento na Geral');
      repeat
        for assentoEscolhido := 1 to MaxGeral do
        begin
            writeln('Assento ', assentoEscolhido, ' disponível');
            write('Escolha o número do assento: ');
            readln(assentoEscolhido);
            if assentosGeral[assentoEscolhido] then
            begin
              assentosGeral[assentoEscolhido] := false;
              writeln('Assento ', assentoEscolhido, ' reservado para você.');
              assentoSelecionado := true;
              break;
            end
            else
              writeln('Este assento já está ocupado. Tente outro.');
          end;
      until assentoSelecionado;
    end
    else
      writeln('Escolha inválida! Tente novamente.');
  end;
end;


procedure EntraCliente();
var
  nome: string;
  tipo: integer;
begin
  textcolor(yellow);
  gotoxy(30,23);
  write('Nome: ');
  readln(nome);
  gotoxy(30,24);
  writeln('Tipo: 1-Sócio | 2-Torcedor | 3-Visitante');
  gotoxy(48,26); 
  readln(tipo);  

  case tipo of
    1: 
      if countSocio < MaxSocio then
      begin
        inc(countSocio);
        filaSocio[countSocio] := nome;
        writeln(nome, ' foi adicionado à fila de Sócios.');
      end
      else
        writeln('Fila de sócio cheia!');
    2: 
      if countTorcedor < (MaxArquibancada + MaxGeral) then  
      begin
        inc(countTorcedor);
        filaTorcedor[countTorcedor] := nome;
        writeln(nome, ' foi adicionado à fila de Torcedores.');
      end
      else
        writeln('Fila de torcedor cheia!');
    3: 
      if countVisitante < MaxVisita then
      begin
        inc(countVisitante);
        filaVisitante[countVisitante] := nome;
        writeln(nome, ' foi adicionado à fila de Visitantes.');
      end
      else
        writeln('Fila de visitante cheia!');
  end;

  Monta_Tela();
end;


procedure ProcessaFila();
var
  tipo, i: integer;
  valorIngresso: integer;
begin
  textcolor(yellow);
  gotoxy(30,23);
  writeln('Processar qual fila?');
  gotoxy(30,24);
  writeln('1-Sócio | 2-Torcedor | 3-Visitante');
  gotoxy(48,26);
  readln(tipo);

  case tipo of
    1: 
      if (countSocio > 0) then
      begin
        writeln('Processando ', filaSocio[1], ' (Sócio)');
        for i := 1 to countSocio-1 do
          filaSocio[i] := filaSocio[i+1];
        dec(countSocio);

        valorIngresso := ValorSocio;
        valorAcumuladoSocio := valorAcumuladoSocio + valorIngresso;
        writeln('Valor do ingresso para Sócio: R$', valorIngresso);
        EscolheAssento(tipo); 
      end
      else
        writeln('Fila de sócio vazia!');

    2:
      if (countTorcedor > 0) then
      begin
        writeln('Processando ', filaTorcedor[1], ' (Torcedor)');
        for i := 1 to countTorcedor-1 do
          filaTorcedor[i] := filaTorcedor[i+1];
        dec(countTorcedor);
        
        valorIngresso := ValorArquibancada;  
        valorAcumuladoTorcedor := valorAcumuladoTorcedor + valorIngresso; 
        writeln('Valor do ingresso para Torcedor (Arquibancada): R$', valorIngresso);
        EscolheAssento(tipo);
      end
      else
        writeln('Fila de torcedor vazia!');

    3:
      if (countVisitante > 0) then
      begin
        writeln('Processando ', filaVisitante[1], ' (Visitante)');
        for i := 1 to countVisitante-1 do
          filaVisitante[i] := filaVisitante[i+1];
        dec(countVisitante);
        
        valorIngresso := ValorVisitante;
        valorAcumuladoVisitante := valorAcumuladoVisitante + valorIngresso; 
        writeln('Valor do ingresso para Visitante: R$', valorIngresso);
        EscolheAssento(tipo); 
      end
      else
        writeln('Fila de visitante vazia!');
  end;
end;

BEGIN
  InicializaPilhas;
  repeat
    Monta_Tela();
    readln(op);
    case op of
      1: EntraCliente();
      2: ProcessaFila();
    end;
  until op = 0;
END.
