unit frm_cad_cat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBTables,
  StdCtrls, Mask, Buttons, PngSpeedButton;

type
  Tfm_cad_cat = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    tab_categoria: TTable;
    ds_tab_categoria: TDataSource;
    tab_categoriacategoria: TStringField;
    tab_categoriacod_categoria: TIntegerField;
    dbe_categoria: TDBEdit;
    dbe_cod_cat: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dbg_categoria: TDBGrid;
    GroupBox3: TGroupBox;
    BalloonHint1: TBalloonHint;
    btn_primeiro: TPngSpeedButton;
    btn_voltar: TPngSpeedButton;
    btn_proximo: TPngSpeedButton;
    btn_ultimo: TPngSpeedButton;
    btn_novo: TPngSpeedButton;
    btn_deletar: TPngSpeedButton;
    btn_editar: TPngSpeedButton;
    btn_aceitar: TPngSpeedButton;
    btn_cancelar: TPngSpeedButton;
    btn_atualizar: TPngSpeedButton;
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_aceitarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure checa_botoes;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_cad_cat: Tfm_cad_cat;

implementation

{$R *.dfm}



procedure Tfm_cad_cat.checa_botoes;
begin
 if fm_cad_cat.tab_categoria.State = dsBrowse then
 begin
  fm_cad_cat.dbe_cod_cat.Enabled:=false;
  fm_cad_cat.dbe_categoria.Enabled:=false;
  fm_cad_cat.btn_aceitar.Enabled:=false;
  fm_cad_cat.btn_cancelar.Enabled:=false;
  fm_cad_cat.btn_primeiro.Enabled:=true;
  fm_cad_cat.btn_voltar.Enabled:=true;
  fm_cad_cat.btn_proximo.Enabled:=true;
  fm_cad_cat.btn_ultimo.Enabled:=true;
  fm_cad_cat.btn_novo.Enabled:=true;
  fm_cad_cat.btn_deletar.Enabled:=true;
  fm_cad_cat.btn_editar.Enabled:=true;
  fm_cad_cat.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_cad_cat.dbe_cod_cat.Enabled:=false;
  fm_cad_cat.dbe_categoria.Enabled:=true;
  fm_cad_cat.btn_aceitar.Enabled:=true;
  fm_cad_cat.btn_cancelar.Enabled:=true;
  fm_cad_cat.btn_primeiro.Enabled:=false;
  fm_cad_cat.btn_voltar.Enabled:=false;
  fm_cad_cat.btn_proximo.Enabled:=false;
  fm_cad_cat.btn_ultimo.Enabled:=false;
  fm_cad_cat.btn_novo.Enabled:=false;
  fm_cad_cat.btn_deletar.Enabled:=false;
  fm_cad_cat.btn_editar.Enabled:=false;
  fm_cad_cat.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_cad_cat.btn_primeiroClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.First;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_voltarClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Prior;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_proximoClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Next;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_ultimoClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Last;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Last;
vcod:=tab_categoriacod_categoria.Value+1;
tab_categoria.Append;
tab_categoriacod_categoria.Value:=vcod;
dbe_cod_cat.Text:=IntToStr(vcod);
checa_botoes;
dbe_categoria.SetFocus;
end;

procedure Tfm_cad_cat.btn_deletarClick(Sender: TObject);
var resp:integer;
begin
resp:=0;
if tab_categoria.State = dsBrowse then
  if tab_categoriacod_categoria.Value=0 then
  begin
  MessageDlg('O Banco de Dados est� vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Voc� deseja realmente excluir este registro?','Confirmar Exclus�o',308);
  if resp = 6 then
  begin
  tab_categoria.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
  end;

procedure Tfm_cad_cat.btn_editarClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Edit;
checa_botoes;
dbe_categoria.SetFocus;
end;

procedure Tfm_cad_cat.btn_aceitarClick(Sender: TObject);
begin
if tab_categoria.State <> dsBrowse then
tab_categoria.Post;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_cancelarClick(Sender: TObject);
begin
if tab_categoria.State <> dsBrowse then
tab_categoria.Cancel;
checa_botoes;
end;

procedure Tfm_cad_cat.btn_atualizarClick(Sender: TObject);
begin
if tab_categoria.State = dsBrowse then
tab_categoria.Refresh;
checa_botoes;
end;

procedure Tfm_cad_cat.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

end.
