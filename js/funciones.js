
   function EsFecha(InString,formato)
             {
             
				if (formato == "dma"){
					dia=InString.substring(0,2);
					mes=InString.substring(3,5);
					anyo=InString.substring(6,10);
				}
				
				if (formato == "mda"){
					mes=InString.substring(0,2);
					dia=InString.substring(3,5);
					anyo=InString.substring(6,10);
				}
				
				if (formato == "amd"){
					anyo=InString.substring(0,4);
					mes=InString.substring(5,7);
					dia=InString.substring(8,10);
				}
				
				if (dia == '08') dia = '8';	// parseInt("08") == 10		base octogonal
				if (dia == '09') dia = '9';	// parseInt("09") == 11		base octogonal
				if (mes == '08') mes = '8';	// parseInt("08") == 10		base octogonal
				if (mes == '09') mes = '9'; // parseInt("09") == 11		base octogonal
				
				dia=parseInt(dia);
				mes=parseInt(mes);
				anyo=parseInt(anyo);
				if (anyo < 1900) return false;    // Anyo mayor a 1900 (por la Base de Datos)
				mes = mes - 1;  // El mes se representa del 0 al 11 (solo para la validación)
				esfecha = new Date(anyo,mes,dia);
				if (dia == esfecha.getDate()){
					if(mes == esfecha.getMonth()){
						if(anyo == esfecha.getFullYear()){
							return true;
						}
					}
				}
				
			return false;
		  }


function trim(cadena)
{
	for(i=0; i<cadena.length; )
	{
		if(cadena.charAt(i)==" ")
			cadena=cadena.substring(i+1, cadena.length);
		else
			break;
	}

	for(i=cadena.length-1; i>=0; i=cadena.length-1)
	{
		if(cadena.charAt(i)==" ")
			cadena=cadena.substring(0,i);
		else
			break;
	}
	
	  return cadena;
}


function checkDecimals(fieldName, fieldValue,decimales) 
{

    decallowed = decimales;  

    if (isNaN(fieldValue) || fieldValue == "") {

      return 1;

    }
    else
    {

     if (fieldValue.indexOf('.') == -1) fieldValue += ".";
     dectext = fieldValue.substring(fieldValue.indexOf('.')+1, fieldValue.length);

            if (dectext.length > decallowed)
            {
               return 2;
               
            }else
            {
               return 0;
            }
    }
}




//var nav4 = window.Event ? true : false;
//function acceptNum(evt)
//{	 	
//   var key = nav4 ? evt.which : evt.keyCode;	
//   return (key <= 13 || (key >= 48 && key <= 57));
//}

var strExplorador;
strExplorador = navigator.appName;
function acceptNum(evento) {
var Tecla;
var bolReg=false;
if (strExplorador.indexOf("Explorer",0) != -1) {
Tecla = evento.keyCode;
} else {
Tecla=evento.which;
}
if (((Tecla > 47) && (Tecla < 58)) || (Tecla == 13)){
bolReg=true;
}
if (strExplorador.indexOf("Explorer",0) != -1) {
if (!bolReg) {
evento.keyCode = "";
alert("Sólo puedes introducir números");
}
}
return bolReg;
}







function ValidaAlfaNumerico(campo) {
    var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ " + "abcdefghijklmnñopqrstuvwxyzáéíóú " + "0123456789";
    var checkStr = campo.value;
    var allValid = true;

    for (i = 0; i < checkStr.length; i++) {
        ch = checkStr.charAt(i);
        for (j = 0; j < checkOK.length; j++)
            if (ch == checkOK.charAt(j))
            break;
        if (j == checkOK.length) {
            allValid = false;
            break;
        }
    }
    return allValid;
}

///////////////////
/*  VALIDA RUT   */
///////////////////

function ChequeaRut(obj)
{

    Char = obj.value;    

    Char = ltrim(Char);
    
     if(parseInt(Char) < 1 )return false;
       
   
        
	var letra
	letra = '';
	var varrut = '';
	var dv = '';


	if (Char != '')
	{
		Char = reemplazaString(Char ,'.','');
		Char = reemplazaString(Char ,'-','');
		

        j=1;
		dv = Char.charAt(Char.length - 1);
		for (i=Char.length-2; i >= 0;i--)
		{
			letra = Char.charAt(i)
			if (j == 3 && Char.length > 4 ){
				letra = '.' + letra;
				j = 1;
			}
			else {
				j = j + 1;
			}
			varrut = letra + varrut;
		}
		
		Char = varrut + '-' + dv;
		
		if (!ValidaRutFormateado(Char)){
		           
                   return false;
		}

        obj.value = String(Char);  
		return true;
	}
}

function ValidaRutFormateado(Char) {

	var dvr = '0'
	suma = 0
	mult = 2
	strRut = Char
	if (strRut.length<0 && strRut.length>12)
		return false;
	strChar = strRut.substring(0, strRut.length-2);
	strObjDig = strRut.substring(strRut.length-1);
	for ( i = strChar.length - 1 ; i >= 0 ; i -- ) {
		if (strChar.charAt(i)!='.' && strChar.charAt(i)!='-'){
			suma = suma + strChar.charAt(i) * mult;
			if ( mult == 7 )
				mult = 2;
			else
				mult ++;
		}
	}
	res = suma % 11;
	if ( res == 1 )
		dvr = 'k';
	else {
		if ( res == 0 )
			dvr = '0';
		else {
			dvi = 11 - res;
			dvr = dvi + "";
		}
	}
	if ( dvr != strObjDig.toLowerCase() )
		return false;
	return true;
}



function reemplazaString(InString,encontrar,remplaza){
    pos=0;
    while(pos >= 0){
		pos=InString.indexOf(encontrar);
		if(pos < 0) return InString;
		Strinicio=InString.substring(0,pos);
		Strfin=InString.substring(pos + encontrar.length,InString.length);
		InString=Strinicio + remplaza + Strfin;
    }
}

 function ltrim(InString) 
 {
	n = i = 0;
	while (i < InString.length) {
		if (InString.charAt(i) != " ") {
			n = i
			break
		}
		i++
	}
	if (n == 0 && i == InString.length)
		InString = ''
	else
		InString = InString.substring(n, InString.length)
	return InString;
}
		
  function compare_dates(fecha, fecha2)   
  {   
    var xMonth=fecha.substring(3, 5);   
    var xDay=fecha.substring(0, 2);   
    var xYear=fecha.substring(6,10);   
    var yMonth=fecha2.substring(3, 5);   
    var yDay=fecha2.substring(0, 2);   
    var yYear=fecha2.substring(6,10);   
    if (xYear> yYear)   
    {   
        return(true)   
    }   
    else  
    {   
      if (xYear == yYear)   
      {    
        if (xMonth> yMonth)   
        {   
            return(true)   
        }   
        else  
        {    
          if (xMonth == yMonth)   
          {   
            if (xDay> yDay)   
              return(true);   
            else  
              return(false);   
          }   
          else  
            return(false);   
        }   
      }   
      else  
        return(false);   
    }   
} 


		
		