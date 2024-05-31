report 50000 "Automotive Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordReport;

    dataset
    {
        dataitem(Automotive; Automotive)
        {
            column(No_Automotive; "No.")
            {
            }
            column(Description_Automotive; Description)
            {
            }
            column(FuelType_Automotive; "Fuel Type")
            {
            }
            column(Manufacturer_Automotive; Manufacturer)
            {
            }
            column(Model_Automotive; Model)
            {
            }
            column(Year_Automotive; Year)
            {
            }
            column(No_Automotive_Cpt; FieldCaption("No."))
            {
            }
            column(Description_Automotive_Cpt; FieldCaption(Description))
            {
            }
            column(FuelType_Automotive_Cpt; FieldCaption("Fuel Type"))
            {
            }
            column(Manufacturer_Automotive_Cpt; FieldCaption(Manufacturer))
            {
            }
            column(Model_Automotive_Cpt; FieldCaption(Model))
            {
            }
            column(Year_Automotive_Cpt; FieldCaption(Year))
            {
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(WordReport)
        {
            Type = Word;
            LayoutFile = './Reports/WordLayout.docx';
        }
        layout(ExcelReport)
        {
            Type = Excel;
            LayoutFile = './Reports/WordLayout.xlsx';
        }
    }
    labels
    {
        TitleLbl = 'List of Automotives';
    }

    var
        myInt: Integer;

    trigger OnPreReport()
    var
        LanguageCU: Codeunit Language;

    begin
        CurrReport.Language := LanguageCU.GetLanguageIdOrDefault('DAN');
    end;
}