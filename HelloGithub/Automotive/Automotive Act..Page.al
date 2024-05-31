page 50003 "Automotive Act."
{
    ApplicationArea = All;
    Caption = 'Automotive Act.';
    PageType = CardPart;
    SourceTable = "Activities Cue";
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Activities")
            {

                field("Total Automotives"; Rec."Total Automotives")
                {
                    ToolTip = 'Specifies the value of the Total Automotives field.', Comment = '%';
                }
                field("Sales This Month"; Rec."Sales This Month")
                {
                    ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not rec.Get() then begin
            Rec.Init();
            Rec.Insert();
            Commit();
        end;
    end;


}
