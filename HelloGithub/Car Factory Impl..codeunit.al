codeunit 50000 "Car Factory Impl."
{
    Access = Internal;

    procedure InsertGasolineCar(No: Code[20]; Description: Text; Manufacturer: Text; Model: Code[20]; Year: Integer; FuelType: Enum "Fuel Type")
    var
        Automotive: Record Automotive;
    begin
        Automotive.Init();
        Automotive.Validate("No.", No);
        Automotive.Validate(Description, Description);
        Automotive.Validate(Manufacturer, Manufacturer);
        Automotive.Validate(Model, Model);
        Automotive.Validate(Year, Year);
        Automotive.Validate("Fuel Type", FuelType);
        Automotive.Insert();
    end;
}