object Form1: TForm1
  Left = 271
  Top = 128
  BorderIcons = [biHelp]
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 837
  ClientWidth = 1124
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object TXTpanel: TPanel
    Left = 10
    Top = 649
    Width = 444
    Height = 160
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    Visible = False
    DesignSize = (
      440
      156)
    object TXThead: TPanel
      Left = 10
      Top = 10
      Width = 421
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        421
        53)
      object TXTfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme Texte'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = TXTfermerClick
      end
      object TXTtitre: TEdit
        Left = 134
        Top = 10
        Width = 281
        Height = 28
        Hint = 'Titre du Texte modifiable'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object TXTprecede: TButton
        Left = 59
        Top = 17
        Width = 33
        Height = 21
        Hint = 'Texte precedent'
        Caption = '<'
        TabOrder = 2
        OnClick = TXTprecedeClick
      end
      object TXTsuite: TButton
        Left = 96
        Top = 17
        Width = 33
        Height = 21
        Hint = 'texte suivant'
        Caption = '>'
        TabOrder = 3
        OnClick = TXTsuiteClick
      end
    end
    object TXTmemo: TMemo
      Left = 10
      Top = 63
      Width = 421
      Height = 85
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -18
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'Fourtout 1.0.0.0'
        '---------------------------------------------'
        '[O] : ouvre le panel de choix'
        '--------------------------------------------'
        '******    panel de choix   *****'
        '[O) : Referme le panel'
        '[Enregistre] : Stocke et classe le contenu du presse papier'
        '[X] : Ferme l'#39'application'
        '[?] : cette aide'
        '[M] : ouvre la liste des textes memorises'
        '[J] : ouvre la liste des images memorisees'
        '[@] : ouvre la liste des URL memorisees'
        '[!] : a propos')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      WantTabs = True
      WordWrap = False
    end
  end
  object IMGpanel: TPanel
    Left = 561
    Top = 660
    Width = 445
    Height = 158
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    DesignSize = (
      441
      154)
    object IMGjpg: TImage
      Left = 10
      Top = 63
      Width = 421
      Height = 85
      Anchors = [akLeft, akTop, akRight, akBottom]
      Proportional = True
      Stretch = True
    end
    object IMAGEhead: TPanel
      Left = 10
      Top = 10
      Width = 421
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        421
        53)
      object IMGstretch: TButton
        Left = 57
        Top = 5
        Width = 71
        Height = 18
        Hint = 'Stretch'
        Caption = '<=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = IMGstretchClick
      end
      object IMGfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme Image'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = IMGfermerClick
      end
      object IMGtitre: TEdit
        Left = 134
        Top = 10
        Width = 281
        Height = 28
        Hint = 'Titre de l'#39'image modifiable'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object IMGprecede: TButton
        Left = 59
        Top = 27
        Width = 33
        Height = 21
        Hint = 'Image precedenet'
        Caption = '<'
        TabOrder = 3
        OnClick = IMGprecedeClick
      end
      object IMGsuite: TButton
        Left = 96
        Top = 27
        Width = 33
        Height = 21
        Hint = 'Image suivante'
        Caption = '>'
        TabOrder = 4
        OnClick = IMGsuiteClick
      end
    end
  end
  object P1: TPanel
    Left = 0
    Top = 0
    Width = 49
    Height = 49
    Hint = 'Ouvre fenetre CHOIX'
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Caption = 'O'
    Color = 8453888
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -38
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = P1Click
  end
  object CHOIXpanel: TPanel
    Left = 94
    Top = 20
    Width = 257
    Height = 112
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    object CHOIXfermer: TPanel
      Left = 4
      Top = 4
      Width = 49
      Height = 49
      Hint = 'Ferme fenetre CHOIX'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'O'
      Color = 16744703
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CHOIXfermerClick
    end
    object CHOIXquitter: TPanel
      Left = 199
      Top = 2
      Width = 50
      Height = 50
      Hint = 'Quitte l'#39'application'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'X'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = CHOIXquitterClick
    end
    object CHOIXenregistre: TPanel
      Left = 53
      Top = 4
      Width = 148
      Height = 49
      Hint = 'Enregistre le presse-papier'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'Enregistrement'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = CHOIXenregistreClick
    end
    object CHOIXaide: TPanel
      Left = 4
      Top = 53
      Width = 49
      Height = 49
      Hint = 'Aide et Utilisation'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = '?'
      Color = 4227327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = CHOIXaideClick
    end
    object CHOIXmemo: TPanel
      Left = 53
      Top = 53
      Width = 49
      Height = 49
      Hint = 'Liste des Textes enregistres'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'M'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = CHOIXmemoClick
    end
    object CHOIXimage: TPanel
      Left = 102
      Top = 53
      Width = 49
      Height = 49
      Hint = 'Liste des images enregistrees'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'J'
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = CHOIXimageClick
    end
    object CHOIXinfo: TPanel
      Left = 201
      Top = 53
      Width = 49
      Height = 49
      Hint = 'A propos et Options'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = '!'
      Color = 4227327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = CHOIXinfoClick
    end
    object CHOIXurl: TPanel
      Left = 151
      Top = 53
      Width = 50
      Height = 49
      Hint = 'Liste des URL enregistrees'
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = '@'
      Color = 8454016
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -38
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = CHOIXurlClick
    end
  end
  object ListTXTpanel: TPanel
    Left = 10
    Top = 462
    Width = 444
    Height = 179
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 4
    Visible = False
    DesignSize = (
      440
      175)
    object ListTXThead: TPanel
      Left = 9
      Top = 10
      Width = 421
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Textes Memorises'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        421
        53)
      object ListTXTfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme liste des textes'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ListTXTfermerClick
      end
      object ListTXTdel: TPanel
        Left = 374
        Top = 10
        Width = 31
        Height = 31
        Hint = 'Supprime Ligne'
        Anchors = [akTop, akRight]
        Caption = 'X'
        Color = 4227327
        TabOrder = 1
        OnClick = ListTXTdelClick
      end
    end
    object ListTXT: TListBox
      Left = 9
      Top = 62
      Width = 423
      Height = 105
      Hint = 'double Clic pour voir le texte'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 16744576
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 25
      Items.Strings = (
        'Textes memorises'
        '--------------- Liste -------------------------'
        '[O) : Ferme la liste'
        '[x] : Supprime la ligne selectionnee'
        
          '(dlic) sur une igne : selectionne la ligne (pour la supprimer ev' +
          'entuellement)'
        '(double clic) sur une ligne : ouvre le texte correspondant'
        
          '----------------------------------------------------------------' +
          '-----'
        '[O) : Retour a la liste de texte'
        '[<] : Texte precedent'
        '[>] : Texte suivant'
        '[ Titre du texte ] : peut etre modifie'
        'Texte memorise  (peut etre modifie)')
      ParentFont = False
      TabOrder = 1
      OnDblClick = ListTXTDblClick
    end
  end
  object ListIMGpanel: TPanel
    Left = 561
    Top = 471
    Width = 445
    Height = 151
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 5
    Visible = False
    DesignSize = (
      441
      147)
    object ListIMGhead: TPanel
      Left = 9
      Top = 10
      Width = 421
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Images Memorises'
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        421
        53)
      object ListIMGfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme liste des Images'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ListIMGfermerClick
      end
      object ListIMGdel: TPanel
        Left = 374
        Top = 10
        Width = 31
        Height = 31
        Hint = 'Supprime Ligne'
        Anchors = [akTop, akRight]
        Caption = 'X'
        Color = 4227327
        TabOrder = 1
        OnClick = ListIMGdelClick
      end
    end
    object ListIMG: TListBox
      Left = 9
      Top = 62
      Width = 423
      Height = 76
      Hint = 'double Clic pour voir l'#39'image'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 16744576
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 25
      Items.Strings = (
        'IMAGES memorisees'
        '--------------- Liste -------------------------'
        '[O) : Ferme la liste'
        '[x] : Supprime la ligne selectionnee'
        
          '(clic) sur une ligne : selectionne la ligne (pour la supprimer e' +
          'ventuellement)'
        '(double clic) sur une ligne : ouvre l'#39'image correspondante'
        
          '----------------------------------------------------------------' +
          '-----'
        '[O) : Retour a la liste de texte'
        '[<] : Image precedente'
        '[>] : Ymage suivante'
        '[ Titre de l'#39'image] : peut etre modifie')
      ParentFont = False
      TabOrder = 1
      OnDblClick = ListIMGDblClick
    end
  end
  object ListURLpanel: TPanel
    Left = 551
    Top = 28
    Width = 445
    Height = 170
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 6
    Visible = False
    DesignSize = (
      441
      166)
    object ListURLhead: TPanel
      Left = 9
      Top = 10
      Width = 421
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Caption = 'URL Memorises'
      Color = 8454016
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        421
        53)
      object ListURLfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme liste des URL'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ListURLfermerClick
      end
      object ListURLdel: TPanel
        Left = 374
        Top = 10
        Width = 31
        Height = 31
        Hint = 'Supprime Ligne'
        Anchors = [akTop, akRight]
        Caption = 'X'
        Color = 4227327
        TabOrder = 1
        OnClick = ListURLdelClick
      end
    end
    object ListURL: TListBox
      Left = 9
      Top = 62
      Width = 423
      Height = 96
      Hint = 'double Clic pour voir l'#39'URL'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 16744576
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 25
      Items.Strings = (
        'URL memorisees'
        '--------------- Liste -------------------------'
        '[O) : Ferme la liste'
        '[x] : Supprime la ligne selectionnee'
        
          '(dlic) sur une ligne : selectionne la ligne (pour la supprimer e' +
          'ventuellement)'
        '(double clic) sur une ligne : ouvre l'#39'URL correspondante'
        
          '----------------------------------------------------------------' +
          '-----'
        '[O) : Retour a la liste de texte'
        '[<] : URL precedente'
        '[>] : URL suivante'
        '[ Titre de l'#39'URL] : peut etre modifie'
        'URL  (peut etre modifiee)')
      ParentFont = False
      TabOrder = 1
      OnDblClick = ListURLDblClick
    end
  end
  object URLpanel: TPanel
    Left = 551
    Top = 245
    Width = 434
    Height = 108
    BevelInner = bvRaised
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 7
    Visible = False
    DesignSize = (
      430
      104)
    object URLhead: TPanel
      Left = 5
      Top = 5
      Width = 410
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      Color = 8454016
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        410
        53)
      object URLfermer: TPanel
        Left = 4
        Top = 1
        Width = 49
        Height = 49
        Hint = 'Ferme Texte'
        BevelInner = bvRaised
        BorderStyle = bsSingle
        Caption = 'O'
        Color = 16744703
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -38
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = URLfermerClick
      end
      object URLtitre: TEdit
        Left = 134
        Top = 10
        Width = 271
        Height = 28
        Hint = 'Titre de l'#39'URL modifiable'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object URLlancer: TButton
        Left = 59
        Top = 5
        Width = 70
        Height = 21
        Hint = 'Aller sur la page WEB'
        Caption = 'Lancer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = URLlancerClick
      end
      object URLprecede: TButton
        Left = 59
        Top = 27
        Width = 33
        Height = 21
        Hint = 'URL precedente'
        Caption = '<'
        TabOrder = 3
        OnClick = URLprecedeClick
      end
      object URLsuite: TButton
        Left = 96
        Top = 27
        Width = 33
        Height = 21
        Hint = 'URL suivante'
        Caption = '>'
        TabOrder = 4
        OnClick = URLsuiteClick
      end
    end
    object URLweb: TEdit
      Left = 5
      Top = 62
      Width = 418
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
