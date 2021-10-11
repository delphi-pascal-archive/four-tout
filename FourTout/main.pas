unit main;

{******************************************************************************}
{******************************************************************************}
{*******************}   interface  {*******************************************}
{******************************************************************************}
{******************************************************************************}



uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  gestH,
  ExtCtrls,
  Clipbrd,
  ShellApi,
  JPEG;

CONST
  FIC = 'FourTout.lxf';
  VERSION = '1.0.0.0';

type
  TForm1 = class(TForm)
    P1: TPanel;
    //--------- panel CHOIX ----------------------
    CHOIXpanel: TPanel;
        //-- ligne supérieure
        CHOIXfermer : TPanel;
        CHOIXenregistre: TPanel;
        CHOIXquitter: TPanel;
        //-- ligne inférieure
        CHOIXaide : TPanel;
        CHOIXmemo: TPanel;
        CHOIXimage: TPanel;
        CHOIXurl  : TPanel;
        CHOIXinfo : TPanel;

    //--------- panel TXT -------------------------------
    TXTpanel: TPanel;
        TXThead: TPanel;
           TXTfermer: TPanel;
           TXTtitre: TEdit;
           TXTprecede: TButton;
           TXTsuite: TButton;
        TXTmemo: TMemo;
    //--------- panel Liste TXT
    ListTXTpanel: TPanel;
        ListTXThead: TPanel;
           ListTXTfermer: TPanel;
           ListTXTdel: TPanel;
        ListTXT: TListBox;
    //--------------------------------------- URL -----------------
    URLpanel: TPanel;
        URLhead: TPanel;
           URLfermer: TPanel;
           URLtitre: TEdit;
           URLlancer: TButton;
           URLprecede: TButton;
           URLsuite: TButton;
        URLweb: TEdit;
    //--------------
    ListURLpanel: TPanel;
        ListURLhead: TPanel;
           ListURLfermer: TPanel;
           ListURLdel: TPanel;
        ListURL: TListBox;
    ////----------------------------------------- IMG -------------
    IMGpanel: TPanel;
        IMAGEhead: TPanel;
           IMGfermer: TPanel;
           IMGtitre: TEdit;
           IMGstretch: TButton;
           IMGprecede: TButton;
           IMGsuite: TButton;
        IMGjpg: TImage;
    //------------------
    ListIMGpanel: TPanel;
        ListIMGhead: TPanel;
           ListIMGfermer: TPanel;
           ListIMGdel: TPanel;
        ListIMG: TListBox;
    //---------------------- procedures
    procedure FormCreate(Sender: TObject);
    //---------------
    procedure P1Click(Sender: TObject);
    //---------------
    procedure CHOIXaideClick(Sender: TObject);
    procedure CHOIXenregistreClick(Sender: TObject);
    procedure CHOIXfermerClick(Sender: TObject);
    procedure CHOIXimageClick(Sender: TObject);
    procedure CHOIXinfoClick(Sender: TObject);
    procedure CHOIXmemoClick(Sender: TObject);
    procedure CHOIXquitterClick(Sender: TObject);
    procedure CHOIXurlClick(Sender: TObject);
    //---------------
    procedure IMGfermerClick(Sender: TObject);
    procedure IMGprecedeClick(Sender: TObject);
    procedure IMGstretchClick(Sender: TObject);
    procedure IMGsuiteClick(Sender: TObject);
    //---------------
    procedure ListIMGdelClick(Sender: TObject);
    procedure ListIMGfermerClick(Sender: TObject);
    //---------------
    procedure ListTXTdelClick(Sender: TObject);
    procedure ListTXTfermerClick(Sender: TObject);
    procedure ListURLdelClick(Sender: TObject);
    procedure ListURLfermerClick(Sender: TObject);
    //---------------
    procedure TXTfermerClick(Sender: TObject);
    procedure TXTprecedeClick(Sender: TObject);
    procedure TXTsuiteClick(Sender: TObject);
    //---------------
    procedure URLfermerClick(Sender: TObject);
    procedure URLlancerClick(Sender: TObject);
    procedure URLprecedeClick(Sender: TObject);
    procedure URLsuiteClick(Sender: TObject);
    procedure ListTXTDblClick(Sender: TObject);
    procedure ListURLDblClick(Sender: TObject);
    procedure ListIMGDblClick(Sender: TObject);
  private
    procedure INITIALISATION;
    procedure CREATION;
    procedure QUITTER;
    procedure ClicPanel(var pan: Tpanel; coef:integer=1);
    procedure AcqImage;
    procedure Enregistrement;
    procedure CHARGE;
    procedure SAUVE;
    procedure PURGE(var Liste: Tstringlist);   // inutilisé
    procedure MajTXT;
    procedure MajIMG;
    procedure MajURL;
  end;

var
  Form1    : TForm1;
  QteTXT   : integer;
  QteIMG   : integer;
  QteURL   : integer;
  LX       : TstringList;
  IndexIMG : integer;
  LTXT     : TstringList;
  LIMG     : TstringList;
  LURL     : TstringList;
  IX       : integer;
  Help0    : string;
  HelpTXT  : string;
  HelpURL  : string;
  HelpIMG  : string;

{******************************************************************************}
{******************************************************************************}
{*******************}   implementation  {**************************************}
{******************************************************************************}
{******************************************************************************}

{$R *.dfm}

//------------------------------------ clic panel (simu bouton)
procedure TForm1.ClicPanel(var pan:Tpanel; coef:integer=1);
  var couleur:integer;
begin
  couleur := Pan.Color;
  Pan.Color := clBlack;
  Pan.Refresh;
  sleep(300*coef);
  Pan.Color := couleur;
end;

//0---------------------------------------------------------- FormCreate
procedure TForm1.FormCreate(Sender: TObject);
begin
  left := 0;
  top  := 0;
  autosize := true;
  CHOIXpanel.SetBounds(0,0,257,112);
  ListURLpanel.SetBounds(0,0,441,441);
  URLpanel.SetBounds(0,0,600,90);
  ListTXTpanel.SetBounds(0,0,441,441);
  TXTpanel.SetBounds(0,0,441,441);
  ListIMGpanel.SetBounds(0,0,441,441);
  IMGpanel.SetBounds(0,0,441,441);
  INITIALISATION;
end;

//0----------------------------------------------------- QUITTER
procedure TForm1.QUITTER;
begin
  SAUVE;
  LX.Free;
  LURL.Free;
  LIMG.Free;
  LTXT.Free;
  application.Terminate;
end;

//0----------------------------------------------------- INITILISATION
procedure TForm1.INITIALISATION;
begin
  LTXT    := TStringList.Create;
  LIMG    := TStringList.Create;
  LURL    := TStringList.Create;
  Help0   := svgH(TXTmemo);   TXTmemo.Clear;  TXTmemo.WordWrap := true;
  HelpTXT := svgH(ListTXT); ListTXT.Clear;
  HelpURL := svgH(ListURL); ListURL.Clear;
  HelpIMG := svgH(ListIMG); ListIMG.Clear;
  LX      := TStringList.Create;
  if not FileExists(FIC) then CREATION;
  CHARGE;
  IX := -1;
end;

//0------------------------------------------------------ Creation Fichier LXF
procedure TForm1.CREATION;
  var L9:TstringList;
begin
  L9 := TstringList.Create;
  L9.Clear;
  L9.Add('FourTout;' + version + ';0;0;0;0;*;*;');
  L9.SaveToFile(FIC);
  L9.Free;
end;



//******************************************************************************
//***** P1 *********************************************************************
//******************************************************************************

//0-----------------------------------------------------------  Clic P1
procedure TForm1.P1Click(Sender: TObject);
begin
  P1.Visible := false;
  CHOIXpanel.Visible := true;
  CHOIXpanel.BringToFront
end;

//******************************************************************************
//***** CHOIX ******************************************************************
//******************************************************************************

//0--------------------------------------------------------- clic Fermer CHOIX
procedure TForm1.CHOIXfermerClick(Sender: TObject);
begin
  CHOIXpanel.Visible := false;
  P1.Visible := true;
end;

//0------------------------------------------------------------ Clic Quitter
procedure TForm1.CHOIXquitterClick(Sender: TObject);
begin
  QUITTER
end;

//0---------------------------------------------------- clic CHOIX visu micro
procedure TForm1.CHOIXmemoClick(Sender: TObject);
begin
  //ClicPanel(CHOIXmemo);
  CHOIXpanel.Visible := false;
  ListTXTpanel.Visible := true;
  ListTXTpanel.BringToFront;
end;


//0-------------------------------------------------------- CHOIX URL
procedure TForm1.CHOIXurlClick(Sender: TObject);
begin
  CHOIXpanel.Visible := false;
  ListURLpanel.Visible := true;
  ListURLpanel.BringToFront;
end;

//0---------------------------------------------------- Clic CHOIX visu image
procedure TForm1.CHOIXimageClick(Sender: TObject);
begin
  CHOIXpanel.Visible := false;
  ListIMGpanel.Visible := true;
  ListIMGpanel.BringToFront;
end;

//0---------------------------------------------------- à propos
procedure TForm1.CHOIXinfoClick(Sender: TObject);
begin
msgH('Fourtout.exe' +
     ';Version ' + version +
     ';RD 10 janvier 2013' +
     ';Delphi 7');
end;

//0-------------------------------------------------------- CHOIX Aide
procedure TForm1.CHOIXaideClick(Sender: TObject);
begin
ClicPanel(CHOIXaide);
MsgH(Help0);
MsgH(HelpTXT);
MsgH(HelpURL);
MsgH(HelpIMG);
end;

//==============================================================================
//==============================================================================
//===============================  TEXTE  ======================================
//==============================================================================
//==============================================================================

//******************************************************************************
//***** Liste Texte ************************************************************
//******************************************************************************

//0---------------------------------------------------- clic fermer visu MEMO
procedure TForm1.ListTXTfermerClick(Sender: TObject);
begin
  ListTXTpanel.Visible := false;
  CHOIXpanel.Visible := true;
end;

//-------------------------------------------------- double clic sur liste texte
procedure TForm1.ListTXTDblClick(Sender: TObject);
begin
  TXTtitre.Text := getH(LTXT[ListTXT.itemIndex],0);
  chgH(TXTmemo,LTXT[ListTXT.itemIndex]);
  IX := ListTXT.ItemIndex;
  ListTXTpanel.Visible := false;
  TXTtitre.text := ListTXT.Items[ListTXT.ItemIndex];
  TXTpanel.Visible := true;
end;


//******************************************************************************
//***** Visu TEXTE *************************************************************
//******************************************************************************

//--------------------------------------------------------- Mise à jour Texte
procedure TForm1.MajTXT;
var ligne0,chaine:string;
begin
  ligne0 := leftH(TXTmemo.Lines[0],4,' ');
  if ligne0<>TXTtitre.Text
    then chaine := TXTtitre.Text + ';' + SvgH(TXTmemo)
    else chaine := SvgH(TXTmemo);
  LTXT[IX] := chaine;
  ListTXT.Items[IX] := TXTtitre.Text;
end;

//0---------------------------------------------------- Clic Fermer Texte
procedure TForm1.TXTfermerClick(Sender: TObject);
begin
  TXTpanel.Visible := false;
  MaJTXT;
  ListTXTpanel.Visible := true;
end;

//------------------------------------------------------ Texte précédent
procedure TForm1.TXTprecedeClick(Sender: TObject);
begin
  if IX<1 then exit;
  MajTXT;
  dec(IX);
  TXTtitre.Text := getH(LTXT[IX],0);
  chgH(TXTmemo,LTXT[IX]);
end;

//------------------------------------------------------ Texte suivant
procedure TForm1.TXTsuiteClick(Sender: TObject);
begin
  if IX=LTXT.Count-1 then exit;
  MajTXT;
  inc(IX);
  TXTtitre.Text := getH(LTXT[IX],0);
  chgH(TXTmemo,LTXT[IX]);
end;

//0--------------------------------------------------------  Supprime ligne
procedure TForm1.ListTXTdelClick(Sender: TObject);
var index:integer;
begin
index := ListTXT.ItemIndex;
if Index<0 then exit;
if NONOUI('Supprime la ligne') then exit;
ListTXT.Items.Delete(Index);
LTXT.Delete(Index);
ListTXT.ItemIndex := -1;
end;


//==============================================================================
//==============================================================================
//===============================  URL  ========================================
//==============================================================================
//==============================================================================


//---------------------------------------------------- double clic sur liste URL
procedure TForm1.ListURLDblClick(Sender: TObject);
begin
  URLtitre.Text := getH(LURL[ListURL.itemIndex],0);
  URLweb.Text   := getH(LURL[ListURL.itemIndex],1);
  ListURLpanel.Visible := false;
  URLtitre.text := ListURL.Items[ListURL.ItemIndex];
  URLpanel.Visible := true;
  IX := ListURL.ItemIndex;
end;

//------------------------------------------------------- Ferme Liste URL
procedure TForm1.ListURLfermerClick(Sender: TObject);
begin
  ListURLpanel.Visible   := false;
  CHOIXpanel.Visible := true;
end;

//-------------------------------------------------- Ouvrir la page WEB
procedure TForm1.URLlancerClick(Sender: TObject);
begin
ShellExecute(Handle,'Open',PChar(URLweb.Text),nil,nil,SW_HIDE)
end;

//------------------------------------------------------- Ferme  URL
procedure TForm1.URLfermerClick(Sender: TObject);
begin
  URLpanel.Visible := false;
  ListURLpanel.Visible := true;
end;

//-------------------------------------------------- Supprime ligne URL
procedure TForm1.ListURLdelClick(Sender: TObject);
var index:integer;
begin
index := ListURL.ItemIndex;
if Index<0 then exit;
if NONOUI('Supprime l''URL') then exit;
ListURL.Items.Delete(Index);
LURL.Delete(Index);
ListURL.ItemIndex := -1;
end;

//---------------------------------------------------- URL précédente
procedure TForm1.URLprecedeClick(Sender: TObject);
begin
  if IX<1 then exit;
  MajURL;
  dec(IX);
  URLtitre.Text := getH(LURL[IX],0);
  URLweb.Text   := getH(LURL[IX],1);
  ListURLpanel.Visible := false;
end;

//---------------------------------------------------- URL suivante
procedure TForm1.URLsuiteClick(Sender: TObject);
begin
  if IX=LURL.Count-1 then exit;
  MajURL;
  inc(IX);
  URLtitre.Text := getH(LURL[IX],0);
  URLweb.Text   := getH(LURL[IX],1);
  ListURLpanel.Visible := false;
end;

//------------------------------------------ Mise à jour URL
procedure TForm1.MajURL;
var titre,chaine:string;
begin
  titre  := URLtitre.Text;
  chaine := titre;
  addH(chaine,URLweb.Text);
  LURL[IX] := chaine;
  ListURL.Items[IX] := titre;
end;



//==============================================================================
//==============================================================================
//===============================  IMAGE =======================================
//==============================================================================
//==============================================================================


//******************************************************************************
//***** Liste IMAGE ***********************************************************
//******************************************************************************

//0---------------------------------------------------- clic fermer visu IMAGE
procedure TForm1.ListIMGfermerClick(Sender: TObject);
begin
  ListIMGpanel.Visible := false;
  CHOIXpanel.Visible := true;
end;

//------------------------------------------------- double clic sur liste images
procedure TForm1.ListIMGDblClick(Sender: TObject);
begin
  IX := ListIMG.ItemIndex;
  ListIMGpanel.Visible := false;
  IMGtitre.text := ListIMG.Items[ListIMG.ItemIndex];
  IMGjpg.Picture.LoadFromFile(getH(LIMG[IX],1));
  IMGpanel.Visible := true;
end;


//----------------------------------------------------- Supprime ligne
procedure TForm1.ListIMGdelClick(Sender: TObject);
var index:integer;
begin
index := ListIMG.ItemIndex;
if Index<0 then exit;
if NONOUI('Supprime l''image') then exit;
ListIMG.Items.Delete(Index);
LIMG.Delete(Index);
ListIMG.ItemIndex := -1;
end;

//******************************************************************************
//***** Visu IMAGE *************************************************************
//******************************************************************************

//0---------------------------------------------------- Clic Fermer IMAGE
procedure TForm1.IMGfermerClick(Sender: TObject);
begin
  IMGpanel.Visible := false;
  MajIMG;
  ListIMGpanel.Visible := true;
end;

//0---------------------------------------------------- Mise à Jour IMAGE
procedure TForm1.MajIMG;
var titre,chaine:string;
begin
  titre  := IMGtitre.Text;
  chaine := LIMG[IX];
  putH(chaine,titre,0);
  LIMG[IX] := chaine;
  ListIMG.Items[IX] := titre;
end;

//------------------------------------------------------- Image precedente
procedure TForm1.IMGprecedeClick(Sender: TObject);
begin
  if IX<1 then exit;
  MajIMG;
  dec(IX);
  IMGtitre.text := ListIMG.Items[IX];
  IMGjpg.Picture.LoadFromFile(getH(LIMG[IX],1));
end;

//------------------------------------------------------- Image suivante
procedure TForm1.IMGsuiteClick(Sender: TObject);
begin
  if IX=LIMG.Count-1 then exit;
  MajIMG;
  inc(IX);
  IMGtitre.text := ListIMG.Items[IX];
  IMGjpg.Picture.LoadFromFile(getH(LIMG[IX],1));
end;

//--------------------------------------------------- Stretch image
procedure TForm1.IMGstretchClick(Sender: TObject);
begin
IMGjpg.Stretch := not IMGjpg.Stretch;
end;


//==============================================================================
//==============================================================================
//=============================  CLIPBOARD =====================================
//==============================================================================
//==============================================================================

//******************************************************************************
//******* Enregistrement ClipBoard *********************************************
//******************************************************************************

//0----------------------------------------------------  Clic Enregistrement
procedure TForm1.CHOIXenregistreClick(Sender: TObject);
begin
Enregistrement;
end;

//0------------------------------------------------------ Enregisrement
procedure TForm1.Enregistrement;
   //---------------------
   //   CF_TEXT	Texte contenant une combinaison CR-LF àla fin de chaque ligne.
   //      La fin du texte est identifiée par un caractère NULL.
   //   CF_BITMAP	Graphique bitmap Windows.
   //   CF_METAFILEPICT	Métafichier graphique Windows.
   //   CF_PICTURE	Objet de type TPicture.
   //   CF_COMPONENT	Tout objet persistant.
   function TestIMG:boolean;
     begin
       result := false;
       Clipboard.Open;
       if (Clipboard.HasFormat(CF_PICTURE)) or
          (Clipboard.HasFormat(CF_BITMAP))  then
         begin
           AcqImage;
           result := true;
           clicPanel(CHOIXenregistre);
           clicPanel(CHOIXimage);
         end;
       Clipboard.Close;
     end;
   //-----------------------
   function TestURL:boolean;
     var ligne0,Majus0:string;  chaine,titre:string; x:integer;
     begin
       result := false;
       ligne0 := clipboard.astext;
       Majus0 := uppercase(ligne0);
       if  (copy(Majus0,1,7) = 'HTTP://') or
           (copy(Majus0,1,4) = 'WWW.')    then
         begin
           clicPanel(CHOIXenregistre);
           //http://www.delphifr.com /forum/sujet-RAPPELER-PROCEDURE-ONMOUSEUP_1621327.aspx
           x := pos('WWW.',Majus0);
           if x>0
             then chaine := copy(ligne0,x+4,length(ligne0))  //on enlève http://www.
             else chaine := copy(ligne0,8,length(ligne0));                //on enlève http://
           // delphifr.com /forum/sujet-RAPPELER-PROCEDURE-ONMOUSEUP_1621327.aspx
           titre := geth(chaine,0,'/');  // on garde l'adresse de base
           ListURL.Items.Add(titre);
           addH(titre,Ligne0);
           inc(QteURL);
           LURL.Add(titre);
           Result := true;
           clicPanel(CHOIXurl,2);
         end;
     end;
   //-----------------------
   procedure TestTXT;
     var titre:string;
     begin
       clicPanel(CHOIXenregistre,1);
       TXTmemo.Clear;
       SendMessage(TXTmemo.Handle, WM_Paste, 0, 0);
       clicPanel(CHOIXmemo,2);
       titre := leftH(trim(TXTmemo.Lines[0]),4,' ');  // ' premiers mots
       ListTXT.Items.Add(titre);
       addH(titre,SvgH(TXTmemo));
       LTXT.Add(titre);
     end;
   //---------------------------
begin
  if TestIMG then exit;
  if TestURL  then exit;
  TestTXT;
end;

//0---------------------------------------------------- Acquisition Image
procedure TForm1.AcqImage;
var
  Image:Timage;
  jp:TJPEGImage;
  nomImage:string;
//nécessite l'ajout des unités "jpeg" et "Clipbrd", à la clause "uses".
begin
  image := Timage.Create(Form1);
  inc(IndexIMG);
  nomImage := 'image' + inttostr(IndexIMG);
  nomImage := ChangeFileExt(nomimage,'.jpg');
  image.Picture.Assign(Clipboard);
  jp :=TJPEGImage.Create;
  try
    jp.Assign(image.Picture.Bitmap);
    jp.SaveToFile(nomimage);
  finally
    jp.Free;
  end;
  ListIMG.Items.Add(nomImage);
  LIMG.Add(nomImage + ';' + nomImage);
  image.Free;
end;



//==============================================================================
//==============================================================================
//=========================  SAUVE -- CHARGE ===================================
//==============================================================================
//==============================================================================


//0--------------------------------------------------------------- CHARGE
procedure TForm1.CHARGE;
var Ligne0:string; i,index:integer;
begin
  LX.LoadFromfile(FIC);
  Ligne0   := LX[0];
  QteTXT   := getH(Ligne0,2);
  QteURL   := getH(Ligne0,3);
  QteIMG   := getH(Ligne0,4);
  IndexIMG := getH(Ligne0,5);
  index    := 0;       // ligne 0 
  //------------ Memo -----------
  LTXT.clear;
  ListTXT.clear;    // voir ListMEM.items.clear;
  if QteTXT>0 then
    for i:=1 to QteTXT do
      begin
        inc(index);
        LTXT.add(LX[index]);
        ListTXT.Items.Add(getH(LX[index]));  // champ 0 = titre
      end;
  //------------ URL -----------
  LURL.clear;
  ListURL.clear;    // voir ListMEM.items.clear;
  if QteURL>0 then
    for i:=1 to QteURL do
      begin
        inc(index);
        LURL.add(LX[index]);
        ListURL.Items.add(getH(LX[index]));  // champ 0 = titre
      end;
  //------------ Images -----------
  LIMG.clear;
  ListIMG.clear;    // voir ListMEM.items.clear;
  if QteIMG>0 then
    for i:=1 to QteIMG do
      begin
        inc(index);
        LIMG.add(LX[index]);
        ListIMG.Items.add(getH(LX[index]));  // champ 0 = titre
      end;
end;

//0--------------------------------------------------------------- SAUVE
procedure TForm1.SAUVE;
var Ligne0:string;
begin
  LX.clear;
  //Purge(LTXT);
  QteTXT := LTXT.count;
  //Purge(LURL);
  QteURL := LURL.count;
  //Purge(LIMG);
  QteIMG := LIMG.count;
  Ligne0 := 'Fourtout';
  addH(Ligne0,Version);
  addH(Ligne0,QteTXT);
  addH(Ligne0,QteURL);
  addH(Ligne0,QteIMG);
  addH(Ligne0,IndexIMG);
  LX.add(Ligne0);
  LTXT.Sorted := true;
  LURL.Sorted := true;
  LIMG.Sorted := true;
  if QteTXT>0 then LX.AddStrings(LTXT);
  if QteURL>0 then LX.AddStrings(LURL);
  if QteIMG>0 then LX.AddStrings(LIMG);
  LX.savetofile(FIC);
end;

//0--------------------------------------------------- PURGE
// Elimine les lignes vides et trie la Liste  (inutilisé : plante !))
procedure TForm1.PURGE(var Liste:Tstringlist);
var L9:TStringList;  i:integer;  chaine:string; qte:integer;
begin
  L9 := TStringList.create;
  qte := Liste.count;
  if qte>0 then
    for i:=0 to qte-1 do
      begin
        chaine := trim(Liste[i]);
        if chaine<>'' then L9.add(chaine);
      end;
  Liste := L9;
  L9.free;
end;










end.
