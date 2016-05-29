unit frm_mov_car;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ExtCtrls, DBTables, Buttons, PngSpeedButton;

type
  Tfm_mov_car = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    tab_mov_car: TTable;
    tab_mov_carcod_venda: TIntegerField;
    tab_mov_cardatav: TDateField;
    tab_mov_carvalor: TFloatField;
    tab_mov_carrecebido: TSmallintField;
    dbe_cod_venda: TDBEdit;
    ds_car: TDataSource;
    dbe_data_venda: TDBEdit;
    dbe_valor: TDBEdit;
    dbe_recebido: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
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
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_aceitarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure checa_botoes;
    procedure FormActivate(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_mov_car: Tfm_mov_car;

implementation

{$R *.dfm}

procedure Tfm_mov_car.btn_primeiroClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.First;
checa_botoes;
end;

procedure Tfm_mov_car.btn_voltarClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Prior;
checa_botoes;
end;

procedure Tfm_mov_car.btn_proximoClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Next;
checa_botoes;
end;

procedure Tfm_mov_car.btn_ultimoClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Last;
checa_botoes;
end;

procedure Tfm_mov_car.btn_atualizarClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Refresh;
checa_botoes;
end;

procedure Tfm_mov_car.btn_editarClick(Sender: TObject);
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Edit;
checa_botoes;
end;

procedure Tfm_mov_car.btn_aceitarClick(Sender: TObject);
begin
if tab_mov_car.State <> dsBrowse then
tab_mov_car.Post;
checa_botoes;
end;

procedure Tfm_mov_car.btn_cancelarClick(Sender: TObject);
begin
if tab_mov_car.State <> dsBrowse then
tab_mov_car.Cancel;
checa_botoes;
end;

procedure Tfm_mov_car.checa_botoes;
begin
if fm_mov_car.tab_mov_car.State = dsBrowse then
 begin
  fm_mov_car.dbe_cod_venda.Enabled:=False;
  fm_mov_car.dbe_data_venda.Enabled:=False;
  fm_mov_car.dbe_valor.Enabled:=False;
  fm_mov_car.dbe_recebido.Enabled:=False;
  fm_mov_car.btn_aceitar.Enabled:=false;
  fm_mov_car.btn_cancelar.Enabled:=false;
  fm_mov_car.btn_primeiro.Enabled:=true;
  fm_mov_car.btn_voltar.Enabled:=true;
  fm_mov_car.btn_proximo.Enabled:=true;
  fm_mov_car.btn_ultimo.Enabled:=true;
  fm_mov_car.btn_novo.Enabled:=true;
  fm_mov_car.btn_deletar.Enabled:=true;
  fm_mov_car.btn_editar.Enabled:=true;
  fm_mov_car.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_mov_car.dbe_cod_venda.Enabled:=True;
  fm_mov_car.dbe_data_venda.Enabled:=True;
  fm_mov_car.dbe_valor.Enabled:=True;
  fm_mov_car.dbe_recebido.Enabled:=True;
  fm_mov_car.btn_aceitar.Enabled:=true;
  fm_mov_car.btn_cancelar.Enabled:=true;
  fm_mov_car.btn_primeiro.Enabled:=false;
  fm_mov_car.btn_voltar.Enabled:=false;
  fm_mov_car.btn_proximo.Enabled:=false;
  fm_mov_car.btn_ultimo.Enabled:=false;
  fm_mov_car.btn_novo.Enabled:=false;
  fm_mov_car.btn_deletar.Enabled:=false;
  fm_mov_car.btn_editar.Enabled:=false;
  fm_mov_car.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_mov_car.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

procedure Tfm_mov_car.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_mov_car.State = dsBrowse then
 if tab_mov_carcod_venda.Value=0 then
  begin
  MessageDlg('O Banco de Dados está vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Você deseja realmente excluir este registro?','Confirmar Exclusão',308);
  if resp = 6 then
  begin
  tab_mov_car.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
end;

procedure Tfm_mov_car.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_mov_car.State = dsBrowse then
tab_mov_car.Last;
vcod:=tab_mov_carcod_venda.Value+1;
tab_mov_car.Append;
tab_mov_carcod_venda.Value:=vcod;
dbe_cod_venda.Text:=IntToStr(vcod);
checa_botoes;
end;

end.
