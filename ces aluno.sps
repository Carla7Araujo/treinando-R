* Encoding: UTF-8.
dataset close all.

GET DATA
  /TYPE=ODBC
  /CONNECT='DSN=casa;DATABASE=casa;SERVER=192.168.1.100;PORT=5432;UID=postgres;PWD=!^$}$I#_!^*'+
    'u&x;SSLmode=disable;ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;RowVersioning='+
    '0;ShowSystemTables=0;Fetch=100;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize='+
    '8190;Debug=0;CommLog=0;UseDeclareFetch=0;TextAsLongVarchar=1;UnknownsAsLongVarchar='+
    '0;BoolsAsChar=1;Parse=0;ExtraSysTablePrefixes=;LFConversion=1;UpdatableCursors=1;TrueIsMinus1='+
    '0;BI=0;ByteaAsLongVarBinary=1;UseServerSidePrepare=1;LowerCaseIdentifier=0;D6='+
    '-101;OptionalErrors=0;XaOpt=1'
  /SQL=
" SELECT "
" nu_ano_censo," 
" tp_categoria_administrativa," 
" tp_sexo," 
" tp_cor_raca," 
" tp_turno,"
" in_concluinte,"
" in_matricula,"
" in_ingresso_total"
" FROM casa.educacenso.rf18_ts_matricula "
" union all "
" SELECT "
" nu_ano_censo," 
" tp_categoria_administrativa," 
" tp_sexo," 
" tp_cor_raca," 
" tp_turno,"
" in_concluinte,"
" in_matricula,"
" in_ingresso_total"
" FROM casa.educacenso.rf17_ts_matricula"
  /ASSUMEDSTRWIDTH=255.
CACHE.
EXECUTE.

VALUE LABELS TP_COR_RACA
  '0' 'Aluno não quis declarar cor/raça'
  '1' 'Branca'
  '2' 'Preta'
  '3' 'Parda'
  '4' 'Amarela'
  '5' 'Indígena'
  '9' 'Não dispõe da informação (Não resposta)'.
EXECUTE.

VALUE LABELS TP_CATEGORIA_ADMINISTRATIVA
  '1' 'Pública Federal'
  '2' 'Pública Estadual'
  '3' 'Pública Municipal'
  '4' 'Privada com fins lucrativos'
  '5' 'Privada sem fins lucrativos'
  '7' 'Especial'.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=tp_categoria_administrativa tp_cor_raca DISPLAY=LABEL
  /TABLE tp_categoria_administrativa [C] BY tp_cor_raca [C][COUNT F40.0]
  /CATEGORIES VARIABLES=tp_categoria_administrativa ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES 
    POSITION=AFTER
  /CATEGORIES VARIABLES=tp_cor_raca ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE.

