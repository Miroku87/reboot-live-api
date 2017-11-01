var fs  = require('fs'),
	ent = require('ent');

const INSERT_QUERY = "INSERT INTO abilita_militari VALUES ({id_abilita_militare},{nome_abilita_militare},{descrizione_abilita_militare},{distanza_abilita_militare},{costo_abilita_militare},{bruciacarica_abilita_militare},{prerequisito_abilita_militare},{classi_militari_id_classe_militare});\r\n";

var file  = fs.readFileSync('abilita_militari.txt','utf8'),
	lines = file.split("\r\n"),
	data  = [],
	temp  = {},
	linea = "",
	prere = "",
	id    = 0,
	id_cl = 1,
	f_out = "";

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

function trim( s )
{
	return (s+"").replace( /(^\s+|\s+$)/g, "" );
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
			temp.bruciacarica_abilita_militare = linea.substring(linea.indexOf("bruciacarica: ") + 14, linea.length+1) === "si" ? 1 : 0;
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

if( temp !== {} )
{
	data.push( temp );
	temp = {***REMOVED***
}

var temp_query = "",
	temp_value = "";

for( var d in data )
{
	if( data[d].prerequisito_abilita_militare !== "NULL" )
		data[d].prerequisito_abilita_militare = abilityIdByName( data[d].prerequisito_abilita_militare );
	
	temp_query = INSERT_QUERY;
	
	for( var field in data[d] )
	{
		temp_value = ent.encode( trim( data[d][field] ) );
		temp_value = temp_value === "" ? "NULL" : temp_value;
		temp_value = temp_value === "NULL" ? temp_value : "'"+temp_value+"'";
		temp_query = temp_query.replace( "{"+field+"}", temp_value );
	}
	
	f_out += temp_query;
}

fs.writeFileSync("insert_abilita_militari.sql",f_out);
console.log("SQL Scritto");