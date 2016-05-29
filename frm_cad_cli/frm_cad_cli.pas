unit frm_cad_cli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Mask, DBCtrls, DB, ExtCtrls, DBTables, Grids,
  DBGrids, Buttons, PngSpeedButton;

type
  Tfm_cad_cli = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    ds_tab_clientes: TDataSource;
    tab_clientes: TTable;
    tab_clientescod_cliente: TIntegerField;
    tab_clientesnome_cli: TStringField;
    tab_clientesendereco: TStringField;
    tab_clientesbairro: TStringField;
    tab_clientescidade: TStringField;
    tab_clientesestado: TStringField;
    tab_clientescpf: TFloatField;
    dbe_cod_cliente: TDBEdit;
    dbe_nome_cli: TDBEdit;
    dbe_endereco: TDBEdit;
    dbe_bairro: TDBEdit;
    dbe_cidade: TDBEdit;
    dbe_estado: TDBEdit;
    dbe_cpf: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    tab_clientescep: TIntegerField;
    dbe_cep: TDBEdit;
    tab_clientestelefone: TIntegerField;
    dbe_telefone: TDBEdit;
    Label1: TLabel;
    dbg_clientes: TDBGrid;
    GroupBox10: TGroupBox;
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
    procedure checa_botoes;
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
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_cad_cli: Tfm_cad_cli;

implementation

{$R *.dfm}


procedure Tfm_cad_cli.checa_botoes;
begin
 if fm_cad_cli.tab_clientes.State = dsBrowse then
 begin
  fm_cad_cli.dbe_cod_cliente.Enabled:=False;
  fm_cad_cli.dbe_nome_cli.Enabled:=False;
  fm_cad_cli.dbe_cpf.Enabled:=False;
  fm_cad_cli.dbe_endereco.Enabled:=False;
  fm_cad_cli.dbe_bairro.Enabled:=False;
  fm_cad_cli.dbe_cidade.Enabled:=False;
  fm_cad_cli.dbe_estado.Enabled:=False;
  fm_cad_cli.dbe_cep.Enabled:=False;
  fm_cad_cli.dbe_telefone.Enabled:=False;
  fm_cad_cli.btn_aceitar.Enabled:=false;
  fm_cad_cli.btn_cancelar.Enabled:=false;
  fm_cad_cli.btn_primeiro.Enabled:=true;
  fm_cad_cli.btn_voltar.Enabled:=true;
  fm_cad_cli.btn_proximo.Enabled:=true;
  fm_cad_cli.btn_ultimo.Enabled:=true;
  fm_cad_cli.btn_novo.Enabled:=true;
  fm_cad_cli.btn_deletar.Enabled:=true;
  fm_cad_cli.btn_editar.Enabled:=true;
  fm_cad_cli.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_cad_cli.dbe_cod_cliente.Enabled:=False;
  fm_cad_cli.dbe_nome_cli.Enabled:=True;
  fm_cad_cli.dbe_cpf.Enabled:=True;
  fm_cad_cli.dbe_endereco.Enabled:=True;
  fm_cad_cli.dbe_bairro.Enabled:=True;
  fm_cad_cli.dbe_cidade.Enabled:=True;
  fm_cad_cli.dbe_estado.Enabled:=True;
  fm_cad_cli.dbe_cep.Enabled:=True;
  fm_cad_cli.dbe_telefone.Enabled:=True;
  fm_cad_cli.btn_aceitar.Enabled:=true;
  fm_cad_cli.btn_cancelar.Enabled:=true;
  fm_cad_cli.btn_primeiro.Enabled:=false;
  fm_cad_cli.btn_voltar.Enabled:=false;
  fm_cad_cli.btn_proximo.Enabled:=false;
  fm_cad_cli.btn_ultimo.Enabled:=false;
  fm_cad_cli.btn_novo.Enabled:=false;
  fm_cad_cli.btn_deletar.Enabled:=false;
  fm_cad_cli.btn_editar.Enabled:=false;
  fm_cad_cli.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_cad_cli.btn_primeiroClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.First;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_voltarClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Prior;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_proximoClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Next;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_ultimoClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Last;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Last;
vcod:=tab_clientescod_cliente.Value+1;
tab_clientes.Append;
tab_clientescod_cliente.Value:=vcod;
dbe_cod_cliente.Text:=IntToStr(vcod);
checa_botoes;
end;

procedure Tfm_cad_cli.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_clientes.State = dsBrowse then
 if tab_clientescod_cliente.Value=0 then
  begin
  MessageDlg('O Banco de Dados está vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Você deseja realmente excluir este registro?','Confirmar Exclusão',308);
  if resp = 6 then
  begin
  tab_clientes.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;

end;

procedure Tfm_cad_cli.btn_editarClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Edit;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_aceitarClick(Sender: TObject);
begin
if tab_clientes.State <> dsBrowse then
tab_clientes.Post;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_cancelarClick(Sender: TObject);
begin
if tab_clientes.State <> dsBrowse then
tab_clientes.Cancel;
checa_botoes;
end;

procedure Tfm_cad_cli.btn_atualizarClick(Sender: TObject);
begin
if tab_clientes.State = dsBrowse then
tab_clientes.Refresh;
checa_botoes;
end;

procedure Tfm_cad_cli.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

end.
