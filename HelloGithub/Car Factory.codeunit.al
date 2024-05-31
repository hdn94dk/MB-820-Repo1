codeunit 50001 "Car Factory"
{
    var
        CarFactoryImpl: Codeunit "Car Factory Impl.";

    procedure InsertGasolineCar(No: Code[20]; Description: Text; Manufacturer: Text; Model: Code[20]; Year: Integer; FuelType: Enum "Fuel Type")
    begin
        CarFactoryImpl.InsertGasolineCar(No, Description, Manufacturer, Model, Year, FuelType);
    end;
}