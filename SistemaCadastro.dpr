program SistemaCadastro;

uses
  Vcl.Forms,
  Contato in 'Contato.pas' {FrmCadastro},
  Pesquisa in 'Pesquisa.pas' {Frm_pesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TFrm_pesquisa, Frm_pesquisa);
  Application.Run;
end.
