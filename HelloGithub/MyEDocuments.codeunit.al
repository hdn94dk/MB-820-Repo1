codeunit 50004 "MyEDocuments" implements "E-Document"
{
    procedure Check(var SourceDocumentHeader: RecordRef; EDocumentService: Record "E-Document Service"; EDocumentProcessingPhase: enum Microsoft.eServices.EDocument."E-Document Processing Phase")
    var
        SalesHeader: Record "Sales Header";
        EDocPEPPOLBIS3: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        case SourceDocumentHeader.Number of
            Database::"Sales Header":
                begin
                    case
                        EDocumentProcessingPhase of
                        EDocumentProcessingPhase::Release:
                            begin
                                SourceDocumentHeader.SetTable(SalesHeader);
                                SalesHeader.TestField("Your Reference");
                            end;
                    end;
                end;

        end;

        EDocPEPPOLBIS3.Check(SourceDocumentHeader, EDocumentService, EDocumentProcessingPhase);
    end;

    procedure Create(EDocumentService: Record "E-Document Service"; var EDocument: Record "E-Document"; var SourceDocumentHeader: RecordRef; var SourceDocumentLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS3: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS3.Create(EDocumentService, EDocument, SourceDocumentHeader, SourceDocumentLines, TempBlob);
    end;

    procedure CreateBatch(EDocumentService: Record "E-Document Service"; var EDocuments: Record "E-Document"; var SourceDocumentHeaders: RecordRef; var SourceDocumentsLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS3: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS3.CreateBatch(EDocumentService, EDocuments, SourceDocumentHeaders, SourceDocumentsLines, TempBlob);
    end;

    procedure GetBasicInfoFromReceivedDocument(var EDocument: Record "E-Document"; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS3: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS3.GetBasicInfoFromReceivedDocument(EDocument, TempBlob);
    end;

    procedure GetCompleteInfoFromReceivedDocument(var EDocument: Record "E-Document"; var CreatedDocumentHeader: RecordRef; var CreatedDocumentLines: RecordRef; var TempBlob: codeunit System.Utilities."Temp Blob")
    var
        EDocPEPPOLBIS3: Codeunit "EDoc PEPPOL BIS 3.0";
    begin
        EDocPEPPOLBIS3.GetCompleteInfoFromReceivedDocument(EDocument, CreatedDocumentHeader, CreatedDocumentLines, TempBlob);
    end;
}