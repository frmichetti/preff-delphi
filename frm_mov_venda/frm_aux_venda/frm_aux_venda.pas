unit frm_aux_venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Mask,
  Buttons, PngSpeedButton;


type
  Tfm_aux_venda = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    tab_aux_venda: TTable;
    tab_produtos: TTable;
    tab_aux_vendacod_venda: TIntegerField;
    tab_aux_vendaquantidade: TIntegerField;
    tab_aux_vendavalor_unit: TFloatField;
    tab_aux_vendacod_produto: TIntegerField;
    DBEdit1: TDBEdit;
    ds_aux_venda: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    tab_produtoscod_produto: TIntegerField;
    tab_produtoscod_categoria: TIntegerField;
    tab_produtoscod_fornecedor: TIntegerField;
    tab_produtosnome_prod: TStringField;
    tab_produtospreco_custo: TFloatField;
    tab_produtospreco_venda: TFloatField;
    tab_produtosqtd_disponivel: TIntegerField;
    ds_produtos: TDataSource;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_aux_venda: Tfm_aux_venda;

implementation

{$R *.dfm}

end.
