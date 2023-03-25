unit Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFrm_pesquisa = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ed_pesquisa: TEdit;
    Label1: TLabel;
    bt_imprimir: TBitBtn;
    bt_pesquisar: TBitBtn;
    cb_opcao: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Relatorio: TfrxReport;
    rlt_dataset: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure bt_pesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesquisa: TFrm_pesquisa;

implementation

{$R *.dfm}

uses Contato;

procedure TFrm_pesquisa.bt_pesquisarClick(Sender: TObject);
begin
Frmcadastro.q_cadastro.Close;
Frmcadastro.q_cadastro.Params.Clear;
Frmcadastro.q_cadastro.SQL.Add('');
Frmcadastro.q_cadastro.SQL.Clear;
Frmcadastro.q_cadastro.SQL.Add('select*from contato');

case cb_opcao.ItemIndex of
 0:begin
 Frmcadastro.q_cadastro.SQL.add('where ID_CONTATO=:pCONTATO');
 Frmcadastro.q_cadastro.ParamByName('pCONTATO').AsInteger:=StrToInt(ed_pesquisa.Text);

 end;

 1:begin
 Frmcadastro.q_cadastro.SQL.add('where NOME=:pNOME');
 Frmcadastro.q_cadastro.ParamByName('pNOME').AsString:=(ed_pesquisa.Text);

 end;
end;

     Frmcadastro.q_cadastro.Open;
     if Frmcadastro.q_cadastro.IsEmpty then
        begin
         Messagedlg('Nenhum registro encotrado',mtInformation,[mbOk],0);
        end;

end;

end.
