codeunit 50005 MyTestCodeunit
{
    Subtype = test;

    [Test]
    procedure CustomerExists_InsertSalesDocument_SalesDocumentWithCustomerExist()
    var
        LibrarySales: Codeunit "Library - Sales";
        CustomerNo: Code[20];
    begin
        //[GIVEN] given
        CustomerNo := LibrarySales.CreateCustomerNo()
        //[WHEN] when
        //[THEN] then
    end;

    [Test]
    procedure "AutomotiveSetupIsComplete_CreateANewAutomotive_ANewAutomotiveExistsInMyAutomotiveTable"()
    var
        AutomotiveSetup: Record "Automotive Setup";
        AutomotiveNo: Code[20];
    begin
        //[GIVEN] given
        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" = '' then
            Error('The No. Series has not been setup');
        //[WHEN] when
        AutomotiveNo := 'TESTAUTO';
        InsertAnAutomotive(AutomotiveNo);
        //[THEN] then
        VerifyNewAutomotive(AutomotiveNo);
    end;

    local procedure InsertAnAutomotive(AutomotiveNo: Code[20])
    var
        Automotive: Record Automotive;
    begin
        Automotive.Init();
        Automotive.Validate("No.", AutomotiveNo);
        Automotive.Validate(Description, AutomotiveNo);
        Automotive.Insert()
    end;

    local procedure VerifyNewAutomotive(AutomotiveNo: Code[20])
    var
        Automotive: Record Automotive;
    begin
        Automotive.Get(AutomotiveNo);
    end;
}