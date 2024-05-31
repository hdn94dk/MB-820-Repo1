table 50000 "Automotive Manufacturer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Manufacturer Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Manufacturer code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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

}