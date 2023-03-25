unit Contato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmCadastro = class(TForm)
    conexao: TFDConnection;
    q_cadastro: TFDQuery;
    ds_cadastro: TDataSource;
    q_cadastroID_CONTATO: TIntegerField;
    q_cadastroNOME: TStringField;
    q_cadastroTELEFONE: TStringField;
    q_cadastroCELULAR: TStringField;
    q_cadastroEMAIL: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    db_codigo: TDBEdit;
    Label2: TLabel;
    db_nome: TDBEdit;
    Label3: TLabel;
    db_telefone: TDBEdit;
    Label4: TLabel;
    db_celular: TDBEdit;
    Label5: TLabel;
    db_email: TDBEdit;
    bt_editar: TBitBtn;
    bt_deletar: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_atualizar: TBitBtn;
    bt_novo: TBitBtn;
    bt_sair: TBitBtn;
    Panel3: TPanel;
    bt_pesquisar: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_editarClick(Sender: TObject);
    procedure bt_deletarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_atualizarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_pesquisarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

uses Pesquisa;



procedure TFrmCadastro.bt_sairClick(Sender: TObject);
begin
if MessageDlg('Deseja sair?',mtConfirmation,[mbOk,mbNo],0 )=mrOk then
begin
Application.Terminate;
end
else
abort;

end;


procedure TFrmCadastro.bt_atualizarClick(Sender: TObject);
begin
q_cadastro.Refresh;
MessageDlg('Registro Atualizado com Sucesso',mtInformation,[mbOK],0);
end;

procedure TFrmCadastro.bt_cancelarClick(Sender: TObject);
begin
q_cadastro.Cancel;
end;

procedure TFrmCadastro.bt_deletarClick(Sender: TObject);
begin
q_cadastro.Delete;
end;

procedure TFrmCadastro.bt_editarClick(Sender: TObject);
begin
q_cadastro.Edit;
end;

procedure TFrmCadastro.bt_gravarClick(Sender: TObject);
begin
q_cadastro.Post;
MessageDlg('Registro salvo com sucesso',mtInformation,[mbOK],0);
end;

procedure TFrmCadastro.bt_novoClick(Sender: TObject);

var prox:integer;

begin
q_cadastro.Active:= true;
q_cadastro.last;
prox:=q_cadastroID_CONTATO.AsInteger +1;
q_cadastro.Append;
q_cadastroID_CONTATO.AsInteger:= prox;
db_nome.SetFocus;
end;

procedure TFrmCadastro.bt_pesquisarClick(Sender: TObject);
begin
Frm_pesquisa:=Tfrm_pesquisa.Create(self);
Frm_pesquisa.ShowModal;
try

finally
   Frm_pesquisa.Free;
   Frm_pesquisa:=nil;
end;
end;

end.
