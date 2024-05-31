table 50100 Automotive
{
    Caption = 'Automotive';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Description;
    DrillDownPageId = AutomotiveList;
    LookupPageId = AutomotiveList;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; Manufacturer; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Manufacturer';
        }
        field(4; Model; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Model';
        }
        field(5; Year; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';
        }
        field(6; "Fuel Type"; enum "Fuel Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Fuel Type';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Manufacturer) { }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        isHandled: Boolean;
        AutomotiveSetup: Record "Automotive Setup";
        NoSeries: Codeunit "No. Series";
        Automotive: Record Automotive;
    begin
        isHandled := false;
        OnBeforeInsertValidation(Rec, isHandled);
        if isHandled = true then
            exit;

        if rec."No." = '' then begin
            AutomotiveSetup.InsertIfNotExists();
            AutomotiveSetup.TestField("No. Series");


            Rec."No." := NoSeries.GetNextNo(AutomotiveSetup."No. Series");

            Automotive.ReadIsolation(IsolationLevel::ReadUncommitted);
            Automotive.SetLoadFields("No.");
            while Automotive.Get(rec."No.") do
                rec."No." := NoSeries.GetNextNo((AutomotiveSetup."No. Series"));
        end;


        if rec.Description = '' then
            rec.Description := rec."No.";
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertValidation(var Automotive: Record Automotive; var isHandled: Boolean)
    begin
    end;

}