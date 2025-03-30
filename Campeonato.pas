// arquibancada / geral

// arquibancada ( socios e torcedores )

// geral ( torcedores e torcedores visitantes )

// arquibancanda = 1500 espaço

// geral = 850 torcedor / 350 visitantes

// ingressos vendidos em pilhas nas cabine

// um fila pra cada ( sócios (max 200 apenas arquibancada) / visitante ( apenas geral ) / normal )

// após compra, pode escolher o local para sentar

// Valores dos ingressos: arquibancada: 150 reais, sócios 70 reais. 
//                        geral: 50 reais, visitantes: 100 reais

//informar ainda o total arrecadado por tipo de ingresso, bem como o total da renda

program Campeonato;
uses CRT;	

Const
	MaxArquibancada = 1300;
	MaxSocio = 200;
	MaxGeral = 850;
	MaxVisita = 350;

var
	op: byte;	
	
//================ PROCEDURES =================//	
procedure Monta_Tela();
var
	i : integer;
begin
  textcolor(white);
	gotoxy(23,1);
  writeln(' _____________________________');
  gotoxy(23,2);
  writeln('|        Arquibancada         |');
  gotoxy(23,3);
  writeln('|    MAX ',MaxArquibancada,' | Sócio: ',MaxSocio,'    |');
  gotoxy(23,4);
  writeln('|        Vagas: xxxx          |');
  
  gotoxy(56,1);
	writeln(' ___________________________________________ ');
	gotoxy(56,2);
  writeln('|                   Geral                   |');
  gotoxy(56,3);
  writeln('|       MAX Torcedor ',MaxGeral,' / visita ',MaxVisita,'       |');
  gotoxy(56,4);
  writeln('|  Vagas Torcedor: xxx | Vagas Visita: xxx  |');
  
  gotoxy(5,6);
  writeln(' $$ Ingressos Sócio: $ xxx');
  gotoxy(45,6);
  writeln(' $$ Ingressos Torcedor: $ xxx'); 
  gotoxy(90,6);
  writeln('$$ Ingressos Visita: $ xxx');
  
  writeln('========================================================================================================================');
  
  gotoxy(1,8); 
  writeln('=Cabine Visitante=');
  gotoxy(1,9);
  writeln('=Ingresso    Fila=');
  
  gotoxy(31,8); 
  writeln('=Cabine Torcedor= ');
  gotoxy(31,9);
  writeln('=Ingresso    Fila=');
  
  gotoxy(61,8); 
  writeln('=  Cabine Sócio  =');
  gotoxy(61,9);
  writeln('=Ingresso    Fila=');
  
  gotoxy(96,8);  
  writeln('======ESTATISTICAS======');  
  gotoxy(96,23);  
  writeln('=========OPÇÕES=========');  
  gotoxy(102,25);  
  writeln(' 1 - Entra cliente');
	gotoxy(102,26);  
  writeln(' 2 - ação ');  
	gotoxy(102,27);  
  writeln(' 3 - ação ');  
	gotoxy(102,28);  
  writeln(' 4 - ação ');  
	gotoxy(102,29);  
  writeln(' 5 - ação ');    
  for i := 1 to 22 do
  begin
    gotoxy(95,8 + i);
		writeln('|'); 
  end;
  
  
  
  gotoxy(48,27); // aruma o ponteiro no meio
end;


procedure EntraNaFila();
var

begin
end;

procedure EntraCliente();
var
	nome,tipo : string;
begin
	textcolor(yellow);
	gotoxy(30,23);
	write('Nome: ');
	readln(nome);
	gotoxy(30,24);
	writeln('Tipo: 1-sócio | 2-torcedor | 3-visitante');
	gotoxy(48,26); 
	readln(tipo);	
	
	// entra na fila 
	// processa o tipo da fila
		 
end;
	
Begin
	op := 1;
	//po := TamPilha;
	//GeraLista();
	
	while op <> 0 do
	  begin	    
		  clrscr;
		  //Ordenar();
			//pstatus();	   
	    Monta_Tela();
	    //ExibeLista();
	    readln(op);
	    writeln; 
	    case op of
	      0: writeln('Saindo...');
	      1: EntraCliente();
	      //2: Adiciona;
	      //3: limpa;
	      else
				   writeln('Comando Não Existe ( Pressione qualquer tecla para continuar )');
				   readkey;
	      clrscr;
	    end;
	  end;

End.

