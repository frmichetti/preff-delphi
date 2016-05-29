unit frm_mov_compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ExtCtrls, Buttons, PngSpeedButton;

type
  Tfm_mov_comp = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    tab_compra: TTable;
    tab_fornecedor: TTable;
    tab_compracod_compra: TIntegerField;
    tab_compracod_fornecedor: TIntegerField;
    tab_compranum_nota_fiscal: TFloatField;
    tab_compravalor: TFloatField;
    dbe_cod_compra: TDBEdit;
    ds_compra: TDataSource;
    dbe_cod_forn: TDBEdit;
    dbe_num_nota: TDBEdit;
    dbe_vtotal: TDBEdit;
    tab_fornecedorcod_fornecedor: TIntegerField;
    tab_fornecedornome_forne: TStringField;
    tab_fornecedorcnpj: TFloatField;
    tab_fornecedorendereco: TStringField;
    tab_fornecedorbairro: TStringField;
    tab_fornecedorcidade: TStringField;
    tab_fornecedorestado: TStringField;
    tab_fornecedorcep: TIntegerField;
    tab_fornecedortelefone: TIntegerField;
    ds_fornecedor: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    tab_compradatav: TDateField;
    dbe_datac: TDBEdit;
    GroupBox6: TGroupBox;
    tab_compradatac: TDateField;
    dbe_datav: TDBEdit;
    qr_mov_compra: TQuery;
    qr_mov_compracod_compra: TIntegerField;
    qr_mov_compranome_forne: TStringField;
    qr_mov_compranum_nota_fiscal: TFloatField;
    qr_mov_compradatac: TDateField;
    qr_mov_compradatav: TDateField;
    qr_mov_compravalor: TFloatField;
    ds_qr_compra: TDataSource;
    Label1: TLabel;
    BalloonHint1: TBalloonHint;
    DBGrid1: TDBGrid;
    GroupBox7: TGroupBox;
    dbl_forn: TDBLookupComboBox;
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
    btn_itens_compra: TPngSpeedButton;
    procedure checa_botoes;
    procedure btn_itens_compraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_aceitarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure atualiza_query;
    procedure tab_compraAfterDelete(DataSet: TDataSet);
    procedure tab_compraAfterEdit(DataSet: TDataSet);
    procedure tab_compraAfterInsert(DataSet: TDataSet);
    procedure tab_compraAfterPost(DataSet: TDataSet);
    procedure tab_compraAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_mov_comp: Tfm_mov_comp;

implementation

uses frm_aux_compra;
{$R *.dfm}

procedure Tfm_mov_comp.checa_botoes;
begin
 if fm_mov_comp.tab_compra.State = dsBrowse then
 begin
  fm_mov_comp.dbe_cod_compra.Enabled:=False;
  fm_mov_comp.btn_itens_compra.Enabled:=True;
  fm_mov_comp.dbe_cod_forn.Enabled:=False;
  fm_mov_comp.dbl_forn.Enabled:=False;
  fm_mov_comp.dbe_num_nota.Enabled:=False;
  fm_mov_comp.dbe_cod_forn.Enabled:=False;
  fm_mov_comp.dbe_datac.Enabled:=False;
  fm_mov_comp.dbe_datav.Enabled:=False;
  fm_mov_comp.dbe_vtotal.Enabled:=False;
  fm_mov_comp.btn_aceitar.Enabled:=false;
  fm_mov_comp.btn_cancelar.Enabled:=false;
  fm_mov_comp.btn_primeiro.Enabled:=true;
  fm_mov_comp.btn_voltar.Enabled:=true;
  fm_mov_comp.btn_proximo.Enabled:=true;
  fm_mov_comp.btn_ultimo.Enabled:=true;
  fm_mov_comp.btn_novo.Enabled:=true;
  fm_mov_comp.btn_deletar.Enabled:=true;
  fm_mov_comp.btn_editar.Enabled:=true;
  fm_mov_comp.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_mov_comp.dbe_cod_compra.Enabled:=False;
  fm_mov_comp.btn_itens_compra.Enabled:=False;
  fm_mov_comp.dbe_cod_forn.Enabled:=True;
  fm_mov_comp.dbl_forn.Enabled:=True;
  fm_mov_comp.dbe_num_nota.Enabled:=True;
  fm_mov_comp.dbe_cod_forn.Enabled:=True;
  fm_mov_comp.dbe_datac.Enabled:=True;
  fm_mov_comp.dbe_datav.Enabled:=True;
  fm_mov_comp.dbe_vtotal.Enabled:=True;
  fm_mov_comp.btn_aceitar.Enabled:=true;
  fm_mov_comp.btn_cancelar.Enabled:=true;
  fm_mov_comp.btn_primeiro.Enabled:=false;
  fm_mov_comp.btn_voltar.Enabled:=false;
  fm_mov_comp.btn_proximo.Enabled:=false;
  fm_mov_comp.btn_ultimo.Enabled:=false;
  fm_mov_comp.btn_novo.Enabled:=false;
  fm_mov_comp.btn_deletar.Enabled:=false;
  fm_mov_comp.btn_editar.Enabled:=false;
  fm_mov_comp.btn_atualizar.Enabled:=false;

 end
end;

procedure Tfm_mov_comp.btn_itens_compraClick(Sender: TObject);
begin
if tab_compracod_compra.Value = 0 then
begin
ShowMessage('Nenhum item cadastrado');
end
else
begin
if not Assigned (fm_aux_compra)then
  fm_aux_compra:= Tfm_aux_compra.create(self);
  fm_aux_compra.show;

end;
end;
procedure Tfm_mov_comp.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

procedure Tfm_mov_comp.btn_primeiroClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.First;
qr_mov_compra.First;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_voltarClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.Prior;
qr_mov_compra.Prior;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_proximoClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.Next;
qr_mov_compra.Next;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_ultimoClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.Last;
qr_mov_compra.Last;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_editarClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.Edit;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_atualizarClick(Sender: TObject);
begin
if tab_compra.State = dsBrowse then
tab_compra.Refresh;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_compra.State = dsBrowse then
tab_compra.Last;
vcod:=tab_compracod_compra.Value+1;
tab_compra.Append;
tab_compracod_compra.Value:=vcod;
dbe_cod_compra.Text:=IntToStr(vcod);
checa_botoes;
end;

procedure Tfm_mov_comp.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_compra.State = dsBrowse then
 if tab_compracod_compra.Value=0 then
  begin
  MessageDlg('O Banco de Dados está vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Você deseja realmente excluir este registro?','Confirmar Exclusão',308);
  if resp = 6 then
  begin
  tab_compra.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
end;

procedure Tfm_mov_comp.btn_aceitarClick(Sender: TObject);
begin
if tab_compra.State <> dsBrowse then
tab_compra.Post;
checa_botoes;
end;

procedure Tfm_mov_comp.btn_cancelarClick(Sender: TObject);
begin
if tab_compra.State <> dsBrowse then
tab_compra.Cancel;
checa_botoes;
end;

procedure Tfm_mov_comp.atualiza_query;
begin
qr_mov_compra.Close;
qr_mov_compra.SQL.Clear;
qr_mov_compra.SQL.Add('SELECT cp.`cod_compra`,f.`nome_forne`,cp.`num_nota_fiscal`,cp.`datac`,cp.`datav`,cp.`valor`');
qr_mov_compra.SQL.Add('FROM t_compra cp INNER JOIN t_fornecedor f');
qr_mov_compra.SQL.Add('ON (cp.cod_fornecedor = f.cod_fornecedor);');
qr_mov_compra.ExecSQL;
qr_mov_compra.Active:=True;
end;

procedure Tfm_mov_comp.tab_compraAfterDelete(DataSet: TDataSet);
begin
atualiza_query;
end;

procedure Tfm_mov_comp.tab_compraAfterEdit(DataSet: TDataSet);
begin
atualiza_query;
end;

procedure Tfm_mov_comp.tab_compraAfterInsert(DataSet: TDataSet);
begin
atualiza_query;
end;

procedure Tfm_mov_comp.tab_compraAfterPost(DataSet: TDataSet);
begin
atualiza_query;
end;

procedure Tfm_mov_comp.tab_compraAfterRefresh(DataSet: TDataSet);
begin
atualiza_query;
end;

end.
