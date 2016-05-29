unit frm_cad_forn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids,
  StdCtrls, Mask, Buttons, PngSpeedButton;

type
  Tfm_cad_forn = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    tab_fornecedores: TTable;
    tab_fornecedorescod_fornecedor: TIntegerField;
    tab_fornecedoresnome_forne: TStringField;
    tab_fornecedorescnpj: TFloatField;
    tab_fornecedoresendereco: TStringField;
    tab_fornecedoresbairro: TStringField;
    tab_fornecedorescidade: TStringField;
    tab_fornecedoresestado: TStringField;
    dbe_cod_forn: TDBEdit;
    ds_tab_fornecedores: TDataSource;
    dbe_nome_forn: TDBEdit;
    dbe_cnpj: TDBEdit;
    dbe_endereco: TDBEdit;
    dbe_bairro: TDBEdit;
    dbe_cidade: TDBEdit;
    dbe_estado: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    tab_fornecedorescep: TIntegerField;
    tab_fornecedorestelefone: TIntegerField;
    dbe_cep: TDBEdit;
    dbe_telefone: TDBEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
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
    procedure FormActivate(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_aceitarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_cad_forn: Tfm_cad_forn;

implementation

{$R *.dfm}

{ Tfm_cad_forn }

procedure Tfm_cad_forn.checa_botoes;
begin
if fm_cad_forn.tab_fornecedores.State = dsBrowse then
 begin
  fm_cad_forn.dbe_cod_forn.Enabled:=false;
  fm_cad_forn.dbe_nome_forn.Enabled:=false;
  fm_cad_forn.dbe_cnpj.Enabled:=false;
  fm_cad_forn.dbe_endereco.Enabled:=false;
  fm_cad_forn.dbe_bairro.Enabled:=false;
  fm_cad_forn.dbe_cidade.Enabled:=false;
  fm_cad_forn.dbe_estado.Enabled:=false;
  fm_cad_forn.dbe_cep.Enabled:=false;
  fm_cad_forn.dbe_telefone.Enabled:=false;
  fm_cad_forn.btn_aceitar.Enabled:=false;
  fm_cad_forn.btn_cancelar.Enabled:=false;
  fm_cad_forn.btn_primeiro.Enabled:=true;
  fm_cad_forn.btn_voltar.Enabled:=true;
  fm_cad_forn.btn_proximo.Enabled:=true;
  fm_cad_forn.btn_ultimo.Enabled:=true;
  fm_cad_forn.btn_novo.Enabled:=true;
  fm_cad_forn.btn_deletar.Enabled:=true;
  fm_cad_forn.btn_editar.Enabled:=true;
  fm_cad_forn.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_cad_forn.dbe_cod_forn.Enabled:=false;
  fm_cad_forn.dbe_nome_forn.Enabled:=true;
  fm_cad_forn.dbe_cnpj.Enabled:=true;
  fm_cad_forn.dbe_endereco.Enabled:=true;
  fm_cad_forn.dbe_bairro.Enabled:=true;
  fm_cad_forn.dbe_cidade.Enabled:=true;
  fm_cad_forn.dbe_estado.Enabled:=true;
  fm_cad_forn.dbe_cep.Enabled:=true;
  fm_cad_forn.dbe_telefone.Enabled:=true;
  fm_cad_forn.btn_aceitar.Enabled:=true;
  fm_cad_forn.btn_cancelar.Enabled:=true;
  fm_cad_forn.btn_primeiro.Enabled:=false;
  fm_cad_forn.btn_voltar.Enabled:=false;
  fm_cad_forn.btn_proximo.Enabled:=false;
  fm_cad_forn.btn_ultimo.Enabled:=false;
  fm_cad_forn.btn_novo.Enabled:=false;
  fm_cad_forn.btn_deletar.Enabled:=false;
  fm_cad_forn.btn_editar.Enabled:=false;
  fm_cad_forn.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_cad_forn.btn_primeiroClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.First;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_voltarClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Prior;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_proximoClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Next;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_ultimoClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Last;
checa_botoes;
end;

procedure Tfm_cad_forn.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

procedure Tfm_cad_forn.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Last;
vcod:=tab_fornecedorescod_fornecedor.Value+1;
tab_fornecedores.Append;
tab_fornecedorescod_fornecedor.Value:=vcod;
dbe_cod_forn.Text:=IntToStr(vcod);
checa_botoes;
end;

procedure Tfm_cad_forn.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_fornecedores.State = dsBrowse then
 if tab_fornecedorescod_fornecedor.Value=0 then
  begin
  MessageDlg('O Banco de Dados está vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Você deseja realmente excluir este registro?','Confirmar Exclusão',308);
  if resp = 6 then
  begin
  tab_fornecedores.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
end;

procedure Tfm_cad_forn.btn_editarClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Edit;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_aceitarClick(Sender: TObject);
begin
if tab_fornecedores.State <> dsBrowse then
tab_fornecedores.Post;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_cancelarClick(Sender: TObject);
begin
if tab_fornecedores.State <> dsBrowse then
tab_fornecedores.Cancel;
checa_botoes;
end;

procedure Tfm_cad_forn.btn_atualizarClick(Sender: TObject);
begin
if tab_fornecedores.State = dsBrowse then
tab_fornecedores.Refresh;
checa_botoes;
end;

end.
