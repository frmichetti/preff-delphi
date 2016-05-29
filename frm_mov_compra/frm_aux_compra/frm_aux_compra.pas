unit frm_aux_compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, StdCtrls, Mask, DBTables, Menus, Grids,
  DBGrids, Buttons, ADODB, PngSpeedButton;

type
  Tfm_aux_compra = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dbl_produtos: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    edt_subtotal: TMaskEdit;
    GroupBox5: TGroupBox;
    tab_aux_compra: TTable;
    tab_aux_compracod_compra: TIntegerField;
    tab_aux_compracod_produto: TIntegerField;
    tab_aux_compravalor_unit: TFloatField;
    dbe_cod_compra: TDBEdit;
    ds_aux_compra: TDataSource;
    dbe_cod_produto: TDBEdit;
    dbe_valor: TDBEdit;
    tab_produtos: TTable;
    tab_produtoscod_produto: TAutoIncField;
    tab_produtoscod_categoria: TIntegerField;
    tab_produtoscod_fornecedor: TIntegerField;
    tab_produtosnome_prod: TStringField;
    tab_produtospreco_custo: TFloatField;
    tab_produtospreco_venda: TFloatField;
    tab_produtosqtd_disponivel: TIntegerField;
    ds_produtos: TDataSource;
    qr_itens_compra: TQuery;
    qr_itens_compracod_compra: TIntegerField;
    qr_itens_compracod_produto: TIntegerField;
    qr_itens_compraquantidade: TIntegerField;
    qr_itens_compravalor_unit: TFloatField;
    DBEdit1: TDBEdit;
    tab_aux_compraquantidade: TIntegerField;
    dbe_quantidade: TDBEdit;
    ds_query: TDataSource;
    BalloonHint1: TBalloonHint;
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
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
    procedure checa_botoes;
    procedure FormActivate(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_aceitarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure atualiza_query;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_aux_compra: Tfm_aux_compra;

implementation

uses frm_mov_compra, Math;
var cod:string;
{$R *.dfm}
procedure Tfm_aux_compra.FormActivate(Sender: TObject);
begin
cod:= fm_mov_comp.dbe_cod_compra.Text;
checa_botoes;
qr_itens_compra.Close;
qr_itens_compra.SQL.Clear;
qr_itens_compra.SQL.Text:=('SELECT * FROM t_aux_compra WHERE cod_compra = '+cod+';');
qr_itens_compra.ExecSQL;
qr_itens_compra.Active:=True;
end;
procedure Tfm_aux_compra.btn_atualizarClick(Sender: TObject);
begin
tab_aux_compra.Refresh;
atualiza_query;
end;

procedure Tfm_aux_compra.checa_botoes;
begin
 if fm_aux_compra.tab_aux_compra.State = dsBrowse then
 begin
  fm_aux_compra.dbe_cod_compra.Enabled:=False;
  fm_aux_compra.dbe_cod_produto.Enabled:=False;
  fm_aux_compra.dbl_produtos.Enabled:=False;
  fm_aux_compra.dbe_quantidade.Enabled:=False;
  fm_aux_compra.dbe_valor.Enabled:=False;
  fm_aux_compra.edt_subtotal.Enabled:=False;
  fm_aux_compra.btn_aceitar.Enabled:=false;
  fm_aux_compra.btn_cancelar.Enabled:=false;
  fm_aux_compra.btn_primeiro.Enabled:=true;
  fm_aux_compra.btn_voltar.Enabled:=true;
  fm_aux_compra.btn_proximo.Enabled:=true;
  fm_aux_compra.btn_ultimo.Enabled:=true;
  fm_aux_compra.btn_novo.Enabled:=true;
  fm_aux_compra.btn_deletar.Enabled:=true;
  fm_aux_compra.btn_editar.Enabled:=true;
  fm_aux_compra.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_aux_compra.dbe_cod_compra.Enabled:=True;
  fm_aux_compra.dbe_cod_produto.Enabled:=True;
  fm_aux_compra.dbl_produtos.Enabled:=True;
  fm_aux_compra.dbe_quantidade.Enabled:=True;
  fm_aux_compra.dbe_valor.Enabled:=True;
  fm_aux_compra.edt_subtotal.Enabled:=True;
  fm_aux_compra.btn_aceitar.Enabled:=true;
  fm_aux_compra.btn_cancelar.Enabled:=true;
  fm_aux_compra.btn_primeiro.Enabled:=false;
  fm_aux_compra.btn_voltar.Enabled:=false;
  fm_aux_compra.btn_proximo.Enabled:=false;
  fm_aux_compra.btn_ultimo.Enabled:=false;
  fm_aux_compra.btn_novo.Enabled:=false;
  fm_aux_compra.btn_deletar.Enabled:=false;
  fm_aux_compra.btn_editar.Enabled:=false;
  fm_aux_compra.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_aux_compra.btn_primeiroClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.First;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_voltarClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.Prior;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_proximoClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.Next;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_ultimoClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.Last;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_editarClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.Edit;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_cancelarClick(Sender: TObject);
begin
if tab_aux_compra.State <> dsBrowse then
tab_aux_compra.Cancel;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_aceitarClick(Sender: TObject);
begin
if tab_aux_compra.State <> dsBrowse then
tab_aux_compra.Post;
checa_botoes;
end;

procedure Tfm_aux_compra.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_aux_compra.State = dsBrowse then
 if tab_aux_compracod_compra.Value=0 then
  begin
  MessageDlg('O Banco de Dados est� vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Voc� deseja realmente excluir este registro?','Confirmar Exclus�o',308);
  if resp = 6 then
  begin
  tab_aux_compra.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
end;

procedure Tfm_aux_compra.btn_novoClick(Sender: TObject);
begin
if tab_aux_compra.State = dsBrowse then
tab_aux_compra.First;
tab_aux_compra.Append;
dbe_cod_compra.Text:=cod;
checa_botoes;
end;

procedure Tfm_aux_compra.atualiza_query;
begin
qr_itens_compra.Close;
qr_itens_compra.SQL.Clear;
qr_itens_compra.SQL.Add('SELECT * FROM t_aux_compra WHERE cod_compra = '+cod);
qr_itens_compra.ExecSQL;
qr_itens_compra.Active:=True;
end;

end.
