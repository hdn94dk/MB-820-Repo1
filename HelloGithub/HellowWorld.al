pageextension 50000 "CustomerListExt" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(HelloWorld)
            {
                ApplicationArea = All;
                Caption = 'Hello Customer';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('Hello %1', Rec.Name);
                end;
            }
        }
    }
}