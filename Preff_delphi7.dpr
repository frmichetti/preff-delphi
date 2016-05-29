program Preff_delphi7;

uses
  Forms,
  frm_princ in 'frm_princ\frm_princ.pas' {fm_princ},
  frm_cad_cat in 'frm_cad_cat\frm_cad_cat.pas' {fm_cad_cat},
  frm_cad_cli in 'frm_cad_cli\frm_cad_cli.pas' {fm_cad_cli},
  frm_cad_prod in 'frm_cad_prod\frm_cad_prod.pas' {fm_cad_prod},
  frm_cad_forn in 'frm_cad_forn\frm_cad_forn.pas' {fm_cad_forn},
  frm_cad_func in 'frm_cad_func\frm_cad_func.pas' {fm_cad_func},
  frm_mov_compra in 'frm_mov_compra\frm_mov_compra.pas' {fm_mov_comp},
  frm_aux_compra in 'frm_mov_compra\frm_aux_compra\frm_aux_compra.pas' {fm_aux_compra},
  frm_mov_venda in 'frm_mov_venda\frm_mov_venda.pas' {fm_mov_venda},
  frm_aux_venda in 'frm_mov_venda\frm_aux_venda\frm_aux_venda.pas' {fm_aux_venda},
  frm_mov_cap in 'frm_mov_cap\frm_mov_cap.pas' {fm_mov_cap},
  frm_mov_car in 'frm_mov_car\frm_mov_car.pas' {fm_mov_car};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Preff v2 - Controle de Drogaria';
  Application.CreateForm(Tfm_princ, fm_princ);
  Application.Run;
end.
