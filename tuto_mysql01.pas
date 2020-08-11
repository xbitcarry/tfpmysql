Program tutorial;
{$codepage UTF8}
{$mode objfpc}{$H+}

Uses
	Crt, MySQL4;

Var
	servidor, usuario, contrasena, basededatos : String;
	alloc,socket : PMYSQL;
	qmysql : TMYSQL;
	
Begin
	ClrScr;
	Write('Servidor: ');
	Readln(servidor);
	Write('Usuario: ');
	Readln(usuario);
	Write('Contraseña: ');
	Readln(contrasena);
	Write('Base de Datos: ');
	Readln(basededatos);
	alloc := mysql_init(PMYSQL(@qmysql));
	socket := mysql_real_connect(alloc, PChar(servidor), PChar(usuario), PChar(contrasena), PChar(basededatos), 0, nil, 0);
	If socket=Nil then
	begin
		Writeln (stderr,'Couldn''t connect to MySQL.');
		Writeln (stderr, 'Error was: ', mysql_error(@qmysql));
		halt(1);
	end;
End.
