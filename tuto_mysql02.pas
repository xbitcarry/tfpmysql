Program tutorial;
{$codepage UTF8}
{$mode objfpc}{$H+}

Uses
	Crt, MySQL4;

Var
	servidor, usuario, contrasena, basededatos : String;
	alloc,socket : PMYSQL;
	qmysql : TMYSQL;
	texto_consulta : String;
	consulta : PChar;
	bufer_respuesta : PMYSQL_RES;
	fila_bufer : MYSQL_ROW;
	
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
	Writeln;
	texto_consulta := 'SELECT * from datos' +#0;
	consulta := @texto_consulta[1];
	mysql_query(socket,consulta);
	bufer_respuesta := mysql_store_result(socket);
	fila_bufer := mysql_fetch_row(bufer_respuesta);
	Writeln('ID: ', fila_bufer[0],' - Nombre: ', fila_bufer[1], ' - Edad: ', fila_bufer[2],' - Correo: ',fila_bufer[3]);
	mysql_free_result(bufer_respuesta);
End.