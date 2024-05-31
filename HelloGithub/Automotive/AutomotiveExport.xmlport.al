xmlport 50000 "AutomotiveExport"
{
    Direction = Export;
    FileName = 'Automotive.xml';
    Format = xml;

    schema
    {
        textelement(Rootelement)
        {
            tableelement(Automotive; Automotive)
            {
                fieldattribute(No; Automotive."No.")
                {

                }
                fieldelement(Description; Automotive.Description)
                {

                }
                textelement(Configuration)
                {
                    XmlName = 'Configuration';
                    fieldelement(Model; Automotive.Model)
                    {
                        fieldattribute(Manufacturer; Automotive.Manufacturer)
                        {

                        }
                        fieldattribute(Model; Automotive.Model)
                        {

                        }
                    }
                }
                fieldelement(FuelType; Automotive."Fuel Type")
                {
                    XmlName = 'Fuel';
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
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
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}