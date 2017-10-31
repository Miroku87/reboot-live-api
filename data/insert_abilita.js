var fs = require('fs');

var file  = fs.readFileSync('abilita_militari.txt','utf8'),
	lines = file.split("\r\n"),
	data  = [],
	temp  = {},
	linea = "",
	prere = "",
	id    = 0,
	id_cl = 1;

function abilityIdByName( name )
{
	name = name.replace(/(^\s+|\s+$)/g,"");
	
	//TODO: aggiungere TRIGGERS
	if( name.toLowerCase().indexOf("tutte") !== -1 )
		return -1;
	else if( name.toLowerCase() === "fuoco a terra e tiratore scelto" )
		return -2;
	else if( name.toLowerCase().indexOf("almeno 5 abilit") !== -1 )
		return -3;
	else if( name.toLowerCase().indexOf("almeno 3 abilit") !== -1 )
		return -4;
	
	var filtered = data.filter( function( item ){ return item.nome_abilita_militare.replace(/(^\s+|\s+$)/g,"") === name; } );
	return filtered[0].id_abilita_militare;
}
	
for( var l in lines )
{
	l     = parseInt(l),
	linea = lines[l];
	
	if( linea.indexOf( "-CLASSE" ) === 0 )
	{
		id_cl = linea.substr( linea.indexOf( "-CLASSE " ) + 8, 1 );
	}
	else if( linea.indexOf( "Prerequisiti:" ) !== -1 )
	{
		if( Object.keys(temp).length !== 0 )
		{
			data.push( temp );
			temp = {***REMOVED***
		}
		
		temp.id_abilita_militare = ++id;
		temp.classi_militari_id_classe_militare = id_cl;
		temp.nome_abilita_militare = linea.split(" Prerequisiti: ")[0];
		
		prere = linea.split(" Prerequisiti: ")[1] === "nessuno" || linea.split(" Prerequisiti: ")[1] === "" ? "NULL" : linea.split(" Prerequisiti: ")[1];
		
		temp.prerequisito_abilita_militare = prere;
	}
	else if ( l > 0 && linea.indexOf( "Prerequisiti:" ) === -1 )
	{
		if( linea.indexOf("Distanza:") === 0 )
		{
			temp.distanza_abilita_militare = linea.substring(10,linea.indexOf("Costo")-1);
			temp.costo_abilita_militare = linea.substring(linea.indexOf("Costo: ") + 7,linea.indexOf("bruciacarica")-1);
			temp.bruciacarica_abilita_militare = linea.substring(linea.indexOf("bruciacarica: ") + 14, linea.length+1) === "si";
		}
		else if ( linea.indexOf("Distanza:") !== 0 && !temp.descrizione_abilita_militare )
		{
			temp.descrizione_abilita_militare = linea.replace("\r\n", " ");
		}
		else if ( linea.indexOf("Distanza:") !== 0 && temp.descrizione_abilita_militare )
		{
			temp.descrizione_abilita_militare += linea.replace("\r\n", " ");
		}
	}
}

for( var d in data )
{
	if( data[d].prerequisito_abilita_militare !== "NULL" )
		data[d].prerequisito_abilita_militare = abilityIdByName( data[d].prerequisito_abilita_militare );
}

if( temp !== {} )
{
	data.push( temp );
	temp = {***REMOVED***
}

console.log(data);