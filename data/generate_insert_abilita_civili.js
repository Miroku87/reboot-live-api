var fs  = require('fs'),
	ent = require('ent');

const INSERT_QUERY = "INSERT INTO abilita_civili VALUES ({id_abilita_civile},{nome_abilita_civile},{costo_px_abilita_civile},{descrizione_abilita_civile},{prerequisito_abilita_civile},{classi_civili_id_classe_civile});\r\n";

var file  = fs.readFileSync('abilita_civili.txt','utf8'),
	lines = file.split("\r\n"),
	data  = [],
	temp  = {},
	linea = "",
	prere = "NULL",
	id    = 0,
	id_cl = 1,
	f_out = "";

function trim( s )
{
	return (s+"").replace( /(^\s+|\s+$)/g, "" );
}

function abilityIdByName( name )
{
	name = trim( name );
	
	//TODO: aggiungere TRIGGERS
	if( name.toLowerCase().indexOf("almeno 4 abilit") !== -1 )
		return -1;
	
	var filtered = data.filter( function( item ){ return trim( item.nome_abilita_civile ) === name; } );
	return filtered[0].id_abilita_civile;
}
	
for( var l in lines )
{
	l     = parseInt(l),
	linea = lines[l];
	
	if( linea.indexOf( "–CLASSE" ) === 0 )
	{
		id_cl = linea.substr( linea.indexOf( "–CLASSE " ) + 8, 1 );
	}
	else if( linea.indexOf( "PUNTI ESPERIENZA" ) !== -1 )
	{
		if( Object.keys(temp).length !== 0 )
		{
			data.push( temp );
			temp = {***REMOVED***
		}
		
		temp.id_abilita_civile = ++id;
		temp.classi_civili_id_classe_civile = id_cl;
		temp.nome_abilita_civile = linea.substring( 0, linea.lastIndexOf("–") ).replace(/(\–\s*)?\(.*?\)/, "");
		temp.costo_px_abilita_civile = linea.replace(/.*?(\d+)\s*?PUNTI.*/, "$1");
		
		prere = linea.indexOf("Prerequisito:") !== -1 ? linea.replace(/.*?Prerequisito:([\s\S]*?)\).*/, "$1") : "NULL";
		
		temp.prerequisito_abilita_civile = prere;
	}
	else if ( linea.indexOf( "PUNTI ESPERIENZA" ) === -1 && !temp.descrizione_abilita_civile )
	{
		temp.descrizione_abilita_civile = linea.replace("\r\n", " ");
	}
	else if ( linea.indexOf( "PUNTI ESPERIENZA" ) === -1 && temp.descrizione_abilita_civile )
	{
		temp.descrizione_abilita_civile += linea.replace("\r\n", " ");
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
	if( data[d].prerequisito_abilita_civile !== "NULL" )
		data[d].prerequisito_abilita_civile = abilityIdByName( data[d].prerequisito_abilita_civile );
	
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

fs.writeFileSync("insert_abilita_civili.sql",f_out);
console.log("SQL Scritto");