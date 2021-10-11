//==============================================================================
     Unit GestH;  
//==============================================================================

{------ HISTORIQUE --------------------------------

#3  : ajouté LeftH
#2  : dernier lifting pour conformité code   //2
#1  : MàJ pour DRONES                        //1
#0  : création pour remplacement de SYSTUS
}

//==============================================================================
    INTERFACE
//==============================================================================

uses
    StrUtils  // ansireplace
  , dialogs   // messageDLG
  , SysUtils
  , StdCtrls
  , Classes   // pour TstringList
  ;

CONST  VersionGesth = '1.0.0.3';   // premier 1 = Hebdo
  
//------------------ functions et procedures diverses -------------------
procedure msg(data:variant);
procedure msg2(data1,data2:variant);
procedure msg3(data1,data2,data3:variant);
function  OuiNon(Question:string):boolean;  
function  NonOui(Question:string):boolean;  
Function  justG(chaine:string; longueur:integer; ajout:char=#32):string;   
Function  justD(chaine:string; longueur:integer; ajout:char=#32):string;   
Function  justC(chaine:string; longueur:integer; ajout:char=#32):string;  
function  Extension(fic:string; ext:string):string;
function  posN(souschaine:string; chaine:string; depart:integer=0):integer;
function  NonNum(data:variant):boolean; 
function  OkNum(data:variant):boolean;  
function  iif(condition:boolean; dataVRAI,dataFAUX:variant):variant;
///-------------------------------------------------------------------------
function  qteH(chaine:string; separ:string=''):integer;   
function  derH(chaine:string; separ:string=''):integer; 
procedure addH(var chaine:string; data:variant; separ:string='');
procedure insH(var CHAINE:string; data:variant; NumChamp:integer; separ:string='');
procedure delH(var chaine:string; NumChamp:integer; separ:string=''); 
procedure putH(var CHAINE:string; data:variant; n:integer; separ:string='');
function  getH(chaine:string; numchamp:integer=0; separ:string=''):variant;
function  xofH(chaine:string; data:variant; majus:integer=1; separ:string=''):integer;
procedure incH(var CHAINE:string; NumChamp:integer; valeur:integer=1; separ:string='');
procedure decH(var CHAINE:string; NumChamp:integer; valeur:integer=1; separ:string='');
function  rndH(chaine:string; separ:string=''):variant;
procedure msgH(chaine:string);
function  CodH(chaine:string):string;    // 'A;B;C' ==> 'A¸B¸C'
function  DcoH(chaine:string):string;    // 'A¸B¸C' ==> 'A;B;C'
function  Mot(chaine:string; NumMot:integer=1):variant;
procedure ChgH(var O:Tmemo; H:string);               overload
procedure ChgH(var O:TstringList; H:string);         overload
function  SvgH(var O:Tmemo):string;                  overload
function  SvgH(var O:TstringList):string;            overload
function  SvgH(var O:TListBox):string;               overload
//1 : 1.0.0.1
function  LeftH(chaine:string; nbreChamps:integer; separ:string=''):string;
{=============================} var {=============================}

kSEP   : string;


//==============================================================================
      IMPLEMENTATION
//==============================================================================

{functions et procedures diverses}

//2------------------------------------------------------------- Msg 1 2 3
procedure msg(data:variant);
var chaine:string;
begin
  chaine := data;
  messageDLG(chaine,mtinformation,[mbOk],0)
end;
//-------------
procedure msg2(data1,data2:variant);
var chaine1,chaine2:string;
begin
  chaine1 := data1;
  chaine2 := data2;
  messageDLG(chaine1+#10#13+chaine2,mtinformation,[mbOk],0)
end;
//-------------
procedure msg3(data1,data2,data3:variant);
var chaine1,chaine2,chaine3:string;
begin
  chaine1 := data1;
  chaine2 := data2;
  chaine3 := data3;
  messageDLG(chaine1+#10#13+chaine2+#10#13+chaine3,mtinformation,[mbOk],0)
end;

//2-----------------------------------------------------------------------------
function OuiNon(Question:string):boolean;  //use Dialogs pour messageDLG
begin
  result := (messageDLG(Question,mtinformation,[mbOk,mbNo],0)= 1)
end;
//2-----------------------------------------------------------------------------
function  NonOui(Question:string):boolean;  //use Dialogs pour messageDLG
begin
  result := (messageDLG(Question,mtinformation,[mbOk,mbNo],0)<> 1)
end;

//2-----------------------------------------------------------------  JustG
Function justG(chaine:string; longueur:integer; ajout:char=#32):string; 
begin 
  result := copy(trim(chaine)+DupeString(ajout,longueur),1,longueur); 
End;

//2-----------------------------------------------------------------  JustD
Function justD(chaine:string; longueur:integer; ajout:char=#32):string;      
Begin 
  chaine := trim(chaine); 
  result := copy(DupeString(ajout,longueur)+chaine,length(chaine)+1,longueur); 
End;
            
//2-----------------------------------------------------------------  JustC
Function justC(chaine:string; longueur:integer; ajout:char=#32):string;    
//use StrUtils pour Dupestring
var longChaine:byte;
Begin
  longChaine := length(trim(chaine));
  if longChaine>longueur
    then 
      result := copy(trim(chaine),1,longueur)
    else 
      result := copy(dupestring(ajout,(longueur-longChaine) div 2) 
              + chaine + dupestring(ajout,longueur),1,longueur);
End;
  
//2--------------------------------------------------------------- Extension
function extension(fic:string; ext:string):string;
begin
  result := ChangeFileExt(fic,'.'+ext)
end;

//2--------------------------------------------------------------- posN
function  posN(souschaine:string; chaine:string; depart:integer=0):integer;
var position:integer;
begin
  result := 0;
  position :=  pos(souschaine,copy(chaine,depart+1,length(chaine)));
  if position>0 then
    result := position+depart;
end;

//2---------------------------------------------------------------------  NonNum
function  NonNum(data:variant):boolean;  //28
var chaine:string; valeur,erreur:integer;
begin
  chaine := data;
  system.Val(chaine,valeur,erreur);
  result := (erreur<>0);
  data := valeur;   // pour éviter <conseil> à la compil
end;

//2---------------------------------------------------------------------  OkNum
function  OkNum(data:variant):boolean;  //28
var chaine:string; valeur,erreur:integer;
begin
  chaine := data;
  system.Val(chaine,valeur,erreur);
  result := (erreur=0);
  data := valeur;   // pour éviter <conseil> à la compil
end;

//2---------------------------------------------------------------------- IIF
function iif(condition:boolean; dataVRAI,dataFAUX:variant):variant;
begin
  if condition 
    then 
      result := dataVRAI 
  else 
    result := dataFAUX;
end;

//------------------------------------------------------------------------------
//function  DirParam:string;    
//result := extractFilePath(paramstr(1)) 
//------------------------------------------------------------------ 
//function Minus(chaine:string):string; 
//  result := lowercase(chaine)    
//------------------------------------------------------------------  
//function Majus(chaine:string):string; 
//result := uppercase(chaine)    



///===================================== GestH =================================

function VZ(data:variant):string;       // privé
begin
 result := data;
end;


//2-------------------------------------------------------------------- qteH
function qteH(chaine:string; separ:string=''):integer;
  // renvoie nombre de champs   (0 si vide)
var 
  quantite,index:integer;
begin
  if separ='' then
    separ := Ksep;   // ; par défaut
  quantite := 0;     // pas de champ par défaut (chaine vide)
  result := quantite;
  if trim(chaine)='' then exit;
  quantite := 1;     // il y a au moins 1 champ
  index := pos(separ,chaine);
  while index>0 do
    begin
      inc(quantite);
      index := posN(separ,chaine,index);
    end;
  result := quantite
end;

//2---------------------------------------------------------------------  derH
function  derH(chaine:string; separ:string=''):integer;    
  // n° du dernier champ (derH-1)
begin
  if separ='' then separ := Ksep;
  result := qteH(chaine,separ)-1;
end;

//2---------------------------------------------------------------------  ADDH
procedure addH(var chaine:string; data:variant; separ:string='');
  // ajoute le champ data à la fin
begin
  if separ='' then
    separ := Ksep;
  chaine := chaine + separ + vz(data);
end;

//2----------------------------------------------------------------------  insH
procedure insH(var CHAINE:string; data:variant; NumChamp:integer; separ:string='');
// insere champ data à la position  Numchamp
// si numchamp > nombre de champ, ajoute le champ à la fin
///  h=a;b;c;d   insh(h,9,1)-> a;9;b;c;d
var
  DernierChamp,
  posChamp1,posChamp2,
  index:integer;
begin
  if trim(CHAINE)='' then     // chaine vide au départ
    begin
      CHAINE := data;
      exit
    end;
  data := vz(data);          // conversion data en string
  if separ='' then 
    separ := Ksep;
  DernierChamp := derh(CHAINE,separ);
  if NumChamp>DernierChamp then 
    begin
      CHAINE := CHAINE + separ + data;     
      exit
    end;
  if NumChamp=0 then         // 1er champ
    begin
      CHAINE := data + separ + CHAINE;   // a;b;c;d;e; -> x;a;b;c;d;e;
      exit
    end;
  index  := 0;
  posChamp1 := 0;
  posChamp2 := pos(separ,CHAINE);
  while NumChamp>index do 
    begin
      inc(index);
      posChamp1 := posChamp2;
      posChamp2 := posN(separ,CHAINE,posChamp1);
    end;
  CHAINE := copy(CHAINE,1,posChamp1)     // intégre le ; 
          + data + separ 
          + copy(CHAINE,posChamp1+1,length(CHAINE));
end;

//2---------------------------------------------------------------------  DELH
procedure delH(var chaine:string; NumChamp:integer; separ:string='');
  // supprime le champ NumChamp
  // ne fait rien si numchamp>nombre de champs
  // chaine='a;b;c;d'   delh(chaine,1)-> 'a;c;d'
var 
  DernierChamp,
  posChamp1,posChamp2,
  index:integer;
begin
  if separ='' then 
    separ := Ksep;
  DernierChamp := derh(chaine,separ);
  if NumChamp>DernierChamp then exit;
  if DernierChamp=0 then       // un seul champ
    begin
      chaine := '';  
      exit
    end;
  index := 0;
  posChamp1 := 0;
  posChamp2 := pos(separ,chaine);
  if NumChamp=0 then         // 1er champ
    begin
      chaine := copy(chaine,posChamp2-1,length(chaine));   // a;b;c;d;e; -> b;c;d;e;
      exit
    end;
  while NumChamp>index do
    begin
      inc(index);
      posChamp1 := posChamp2;
      posChamp2 := posN(separ,chaine,posChamp1);
    end;
  if NumChamp=DernierChamp
    then 
      chaine := copy(chaine,1,posChamp1-1)
    else 
      chaine := copy(chaine,1,posChamp1) + copy(chaine,posChamp2+1,length(chaine));
end;

//2---------------------------------------------------------------------  PUTH
procedure putH(var CHAINE:string; data:variant; n:integer; separ:string='');
var DerChamp,                // numéro dernier champ
    posComaPrec,             // position du ; précédent
    posComa,                 // position courante du ; trouvé
    OldNumChamp:integer;     //x  ancien numéro de champ
begin
  if separ='' then separ := Ksep;
  data := VZ(data);          // conversion data en string
  DerChamp := derH(CHAINE,separ);    // numéro dernier champ
  if DerChamp=0 then           // un seul champ
    begin
      CHAINE := data;
      exit
    end;
  OldNumChamp  := 0;
  posComaPrec  := 0;
  posComa := pos(';',CHAINE);
  if n=0 then                    // 1er champ
    begin
      CHAINE := data + copy(CHAINE,posComa,length(CHAINE));   // data;x;x;x;x;
      exit
    end;
  while n>OldNumChamp do
    begin
      inc(OldNumChamp);
      posComaPrec := posComa;
      posComa := posN(';',CHAINE,posComaPrec);
    end;
  if n=DerChamp
    then
      CHAINE := copy(CHAINE,1,posComaPrec) + data
    else
      CHAINE := copy(CHAINE,1,posComaPrec)
                   + data
                   + copy(CHAINE,posComa,length(CHAINE));
end;

//2---------------------------------------------------------------------  GETH
function  getH(chaine:string; numchamp:integer=0; separ:string=''):variant;
var DerChamp,             //  numéro dernier champ
    posComaPrec,          //  position du ; précédent
    posComa,              //  position courante du ; trouvé
    OldNumChamp:integer;  // ancien numéro de champ
begin
  if separ='' then separ := Ksep;
  result := chaine;       // par défaut
  DerChamp := derh(chaine,separ);
  if DerChamp=0 then exit;      // un seul champ
  OldNumChamp := 0;             // position num champ précédent
  posComaPrec := 0;             // position séparateur courant
  posComa := pos(separ,chaine);   // position premier séparateur
  if numchamp=0 then            // si numéro champ appelé est le premier
    begin 
      result := copy(chaine,1,posComa-1); // renvoie premier champ
      exit
    end;
  while numchamp>OldNumChamp do 
    begin
      inc(OldNumChamp);
      posComaPrec := posComa;
      posComa := posN(separ,chaine,posComaPrec);
    end;
  if numchamp=DerChamp
    then 
      result := copy(chaine,posComaPrec+1,length(chaine))
    else 
      result := copy(chaine,posComaPrec+1,posComa-posComaPrec-1);
end;



//2---------------------------------------------------------------------  XofH
function  xofH(chaine:string; data:variant; majus:integer=1; separ:string=''):integer;
  /// renvoie position colonne de data dans H
  /// h=a;b;c;d   XofH(h,'b')-> 1  XofH(h,'z')-> -1
  /// si e=1 ou omis : Majus ou Minus, sinon Test carac
  var ChaineData:string; NumChamp,DerChamp:integer;
begin
  if separ='' then
    separ := Ksep;
  ChaineData := vz(data);
  if majus=1 then
    begin
      chaine := uppercase(chaine);
      ChaineData := uppercase(ChaineData);
    end;
  result := -1; // par défaut : pas trouvé
  NumChamp := -1;
  DerChamp := derh(chaine,separ);
  while NumChamp<DerChamp do
    begin
      inc(NumChamp);
      if ChaineData=geth(chaine,NumChamp,separ) then
        begin
          result := NumChamp;      // champ trouvé
          NumChamp := DerChamp;    // pour fin du while
        end;
     end;
end;


//2---------------------------------------------------------------------  IncH
procedure incH(var CHAINE:string; NumChamp:integer; valeur:integer=1; separ:string='');
var resultat:integer; ContenuChamp:variant;
begin
  if separ='' then 
    separ := Ksep;
  ContenuChamp := geth(CHAINE,NumChamp,separ);
  if NonNum(ContenuChamp) then exit;
  resultat := ContenuChamp + valeur;
  puth(CHAINE,resultat,NumChamp,separ);
end;

//2---------------------------------------------------------------------  DecH
procedure decH(var CHAINE:string; NumChamp:integer; valeur:integer=1; separ:string='');
var resultat:integer; ContenuChamp:variant;
begin
  if separ='' then
    separ := Ksep;
  ContenuChamp := geth(CHAINE,NumChamp,separ);
  if NonNum(ContenuChamp) then exit;
  resultat := ContenuChamp - valeur;
  puth(CHAINE,resultat,NumChamp,separ);
end;

//2---------------------------------------------------------------------- rndH
function  rndH(chaine:string; separ:string=''):variant;
var NbChamps:integer;
begin
  if separ='' then
    separ := ';';
  NbChamps := qteH(chaine,separ);
  if NbChamps<2 
    then 
      result := chaine
    else
      result := getH(chaine,random(NbChamps),separ);
end;

//2---------------------------------------------------------------------  CodH
function  CodH(chaine:string):string;    // 'A;B;C' ==> 'A¸B¸C'
begin
  result := AnsiReplaceStr(chaine,#59,#247)
end;
//2---------------------------------------------------------------------  DcoH
function  DcoH(chaine:string):string;    // 'A¸B¸C' ==> 'A;B;C'
begin
  result := AnsiReplaceStr(chaine,#247,#59)
end;

{--------------------------------------}
procedure msgH(chaine:string);
begin
  chaine := AnsiReplaceStr(chaine,#59,#10#13);
            // remplace les coma par des retours ligne
  chaine := AnsiReplaceStr(chaine,#247,#59); 
            // remplace les coma codés par de vrais coma
            // pour utilisation avec svgH
  messageDLG(chaine,mtinformation,[mbOk],0);
end;

procedure ChgH(var O:Tmemo; H:string);
  var i:integer;  w:boolean;
  begin
  O.clear;
  if H='' then exit;   // vide par défaut
  w := o.WordWrap;
  o.WordWrap := false;
  for i:=0 to DerH(H) do O.Lines.Add(AnsiReplaceStr(getH(H,i),'¸',#59));
    // decoma(getH(H,i)));
  o.WordWrap := w;
  end;

procedure ChgH(var O:TstringList; H:string);
  var i:integer;
  begin
  O.clear;
  if H='' then exit;   // vide par défaut
  for i:=0 to DerH(H) do O.Add(AnsiReplaceStr(getH(H,i),'¸',#59));
  end;

function SvgH(var O:TstringList):string;
  var i:integer; H:string;
  begin
  result := '';
  if O.Count=0 then exit;  // liste vide
  H := AnsiReplaceStr(O[0],#59,'¸'); // remplace les points virgule ligne 0
  result := H;  if O.Count=1 then exit;   // une seule ligne
  for i:=1 to O.Count-1 do addH(H,AnsiReplaceStr(O[i],#59,'¸'));
  result := H;
  end;


function SvgH(var O:Tmemo):string;
  var i:integer; H:string;  w:boolean;
  begin
  result := '';
  w := o.WordWrap;
  o.WordWrap := false;
  if O.Lines.Count=0 then exit;  // liste vide
  H := AnsiReplaceStr(O.Lines[0],#59,'¸'); // remplace les points virgule ligne 0
  result := H;  if O.Lines.Count=1 then exit;   // une seule ligne
  for i:=1 to O.Lines.Count-1 do addH(H,AnsiReplaceStr(O.Lines[i],#59,'¸'));
  o.WordWrap := w;
  result := H;
  end;

function SvgH(var O:TListBox):string;
  var i:integer; H:string;  w:boolean;
  begin
  result := '';
  if O.Items.Count=0 then exit;  // liste vide
  H := AnsiReplaceStr(O.Items[0],#59,'¸'); // remplace les points virgule ligne 0
  result := H;  if O.Items.Count=1 then exit;   // une seule ligne
  for i:=1 to O.Items.Count-1 do addH(H,AnsiReplaceStr(O.Items[i],#59,'¸'));
  result := H;
  end;

//2---------------------------------------------------------------------  Mot
function Mot(chaine:string; NumMot:integer=1):variant;
// équivalent à GetH(chaine,NumMot-1,' ')
// renvoie le champs NumMot avec kSEP=espace  avec  NumMot = 1 à QteH(h)
// Mot(chaine)   renvoie le premier mot
// Mot(chaine,2) renvoie le 2éme mot
// si NumMot>nombre de mot  : renvoie le dernier;
// si NumMot<1 renvoie le premier
begin
result := getH(chaine,NumMot-1,' ');   // mot 1 = champ 0
end;

//3----------------------------------------------------------------- LeftH
function  LeftH(chaine:string; nbreChamps:integer; separ:string=''):string;
// renvoie les "NbreChamps" premiers champs de la "chaine"
  var 
    resu:string;
    debut:integer;
begin
  if separ='' then separ := Ksep;
  resu := '';
  debut := 0;
  while (derH(chaine,separ)>=debut) and (NbreChamps>0) do
    begin
      if debut=0
        then resu := getH(chaine,debut,separ)
        else addH(resu,getH(chaine,debut,separ),separ);
      inc(debut);
      dec(NbreChamps);
    end;
  result := resu;
end; 



///*****************************************************************************
BEGIN
Ksep := ';';

//==============================================================================
             END.
//==============================================================================
