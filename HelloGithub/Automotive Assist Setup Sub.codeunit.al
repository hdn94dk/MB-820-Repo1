codeunit 50010 "Automotive Assist Setup Sub"
{
    local procedure UpdatedSetupStatus()
    var
        AutomotiveSetup: Record "Automotive Setup";
        GuidedExperience: Codeunit "Guided Experience";
    begin
        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" <> '' then
            GuidedExperience.CompleteAssistedSetup(ObjectType::Page, Page::AutomotiveAssistedSetup);
    end;

    local procedure GetMyAppId(): Guid
    var
        ModInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ModInfo);
        exit(ModInfo.Id);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure "Guided Experience_OnRegisterAssistedSetup"()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertAssistedSetup('Automative Setup',
        'Automative Setup',
        'Allow you to setup and start using NO. Series in the Automative Soluton',
        2,
        ObjectType::Page,
        Page::AutomotiveAssistedSetup,
        "Assisted Setup Group"::Extensions,
        '',
        "Video Category"::Uncategorized,
        '');


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRerunOfCompletedAssistedSetup', '', false, false)]
    local procedure "Guided Experience_OnRerrunOfCompletedAssistedSetup"(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer; Handled: Boolean)
    begin
        if ExtensionID <> GetMyAppID() then
            exit;

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::AutomotiveAssistedSetup) then
            exit;

        Handled := true;
        if Confirm('It Seems that you have already completed the setup, would you like to rerun the setup?', true) then
            Page.RunModal(Page::AutomotiveAssistedSetup)
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRerunOfCompletedAssistedSetup', '', false, false)]
    local procedure "Guided Experience_OnAfterRunAssistedSetup"(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer)
    var
        AutomotiveSetup: Record "Automotive Setup";
    begin
        if ExtensionID <> GetMyAppID() then
            exit;

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::AutomotiveAssistedSetup) then
            exit;

        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" <> '' then begin
            UpdatedSetupStatus();
            Message('Congrats');
            //LogMessage();
        end;

    end;
}