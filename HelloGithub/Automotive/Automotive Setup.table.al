table 50002 "Automotive Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }

        field(2; "No. Series"; Code[50])
        {
            tablerelation = "no. series";
            dataclassification = systemmetadata;
            caption = 'No. Series';
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}