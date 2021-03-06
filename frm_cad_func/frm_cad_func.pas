unit frm_cad_func;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB, DBTables, ExtCtrls, DBCtrls,
  StdCtrls, Mask, Buttons, PngSpeedButton;

type
  Tfm_cad_func = class(TForm)
    menu_princ: TMainMenu;
    Arquivo1: TMenuItem;
    Ajuda1: TMenuItem;
    tab_funcionarios: TTable;
    tab_funcionarioscod_funcionario: TIntegerField;
    tab_funcionariosnome_func: TStringField;
    tab_funcionariosendereco: TStringField;
    tab_funcionariosbairro: TStringField;
    tab_funcionarioscidade: TStringField;
    tab_funcionariosestado: TStringField;
    tab_funcionarioscpf: TFloatField;
    dbe_cod_func: TDBEdit;
    ds_tab_funcionarios: TDataSource;
    dbe_nome_func: TDBEdit;
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
    tab_funcionarioscep: TIntegerField;
    tab_funcionariostelefone: TIntegerField;
    dbe_cep: TDBEdit;
    dbe_telefone: TDBEdit;
    Label1: TLabel;
    GroupBox10: TGroupBox;
    dbg_func: TDBGrid;
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
    procedure FormActivate(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_cad_func: Tfm_cad_func;

implementation

{$R *.dfm}

procedure Tfm_cad_func.checa_botoes;
begin
  if fm_cad_func.tab_funcionarios.State = dsBrowse then
 begin
  fm_cad_func.dbe_cod_func.Enabled:=False;
  fm_cad_func.dbe_nome_func.Enabled:=False;
  fm_cad_func.dbe_cpf.Enabled:=False;
  fm_cad_func.dbe_endereco.Enabled:=False;
  fm_cad_func.dbe_bairro.Enabled:=False;
  fm_cad_func.dbe_cidade.Enabled:=False;
  fm_cad_func.dbe_estado.Enabled:=False;
  fm_cad_func.dbe_cep.Enabled:=False;
  fm_cad_func.dbe_telefone.Enabled:=False;
  fm_cad_func.btn_aceitar.Enabled:=false;
  fm_cad_func.btn_cancelar.Enabled:=false;
  fm_cad_func.btn_primeiro.Enabled:=true;
  fm_cad_func.btn_voltar.Enabled:=true;
  fm_cad_func.btn_proximo.Enabled:=true;
  fm_cad_func.btn_ultimo.Enabled:=true;
  fm_cad_func.btn_novo.Enabled:=true;
  fm_cad_func.btn_deletar.Enabled:=true;
  fm_cad_func.btn_editar.Enabled:=true;
  fm_cad_func.btn_atualizar.Enabled:=true;
 end
 else
 begin
  fm_cad_func.dbe_cod_func.Enabled:=False;
  fm_cad_func.dbe_nome_func.Enabled:=True;
  fm_cad_func.dbe_cpf.Enabled:=True;
  fm_cad_func.dbe_endereco.Enabled:=True;
  fm_cad_func.dbe_bairro.Enabled:=True;
  fm_cad_func.dbe_cidade.Enabled:=True;
  fm_cad_func.dbe_estado.Enabled:=True;
  fm_cad_func.dbe_cep.Enabled:=True;
  fm_cad_func.dbe_telefone.Enabled:=True;    
  fm_cad_func.btn_aceitar.Enabled:=true;
  fm_cad_func.btn_cancelar.Enabled:=true;
  fm_cad_func.btn_primeiro.Enabled:=false;
  fm_cad_func.btn_voltar.Enabled:=false;
  fm_cad_func.btn_proximo.Enabled:=false;
  fm_cad_func.btn_ultimo.Enabled:=false;
  fm_cad_func.btn_novo.Enabled:=false;
  fm_cad_func.btn_deletar.Enabled:=false;
  fm_cad_func.btn_editar.Enabled:=false;
  fm_cad_func.btn_atualizar.Enabled:=false;

 end;
end;

procedure Tfm_cad_func.FormActivate(Sender: TObject);
begin
checa_botoes;
end;

procedure Tfm_cad_func.btn_primeiroClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.First;
checa_botoes;
end;

procedure Tfm_cad_func.btn_voltarClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Prior;
checa_botoes;
end;

procedure Tfm_cad_func.btn_proximoClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Next;
checa_botoes;
end;

procedure Tfm_cad_func.btn_ultimoClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Last;
checa_botoes;
end;

procedure Tfm_cad_func.btn_novoClick(Sender: TObject);
var vcod:integer;
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Last;
vcod:=tab_funcionarioscod_funcionario.Value+1;
tab_funcionarios.Append;
tab_funcionarioscod_funcionario.Value:=vcod;
dbe_cod_func.Text:=IntToStr(vcod);
checa_botoes;

end;

procedure Tfm_cad_func.btn_deletarClick(Sender: TObject);
var resp:Integer;
begin
resp:=0;
if tab_funcionarios.State = dsBrowse then
 if tab_funcionarioscod_funcionario.Value=0 then
  begin
  MessageDlg('O Banco de Dados est� vazio',mtWarning,[mbok],0);
  end
  else
  resp:=Application.MessageBox('Voc� deseja realmente excluir este registro?','Confirmar Exclus�o',308);
  if resp = 6 then
  begin
  tab_funcionarios.Delete;
  MessageDlg('Registro Excluido',mtInformation,[mbok],0);
  checa_botoes;
  end;
end;

procedure Tfm_cad_func.btn_editarClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Edit;
checa_botoes;
end;

procedure Tfm_cad_func.btn_aceitarClick(Sender: TObject);
begin
if tab_funcionarios.State <> dsBrowse then
tab_funcionarios.Post;
checa_botoes;
end;

procedure Tfm_cad_func.btn_cancelarClick(Sender: TObject);
begin
if tab_funcionarios.State <> dsBrowse then
tab_funcionarios.Cancel;
checa_botoes;
end;

procedure Tfm_cad_func.btn_atualizarClick(Sender: TObject);
begin
if tab_funcionarios.State = dsBrowse then
tab_funcionarios.Refresh;
checa_botoes;
end;

end.
