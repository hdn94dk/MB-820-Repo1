query 50000 MyQuery
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            dataitem(Sales_Invoice_Header; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";

                dataitem(Sales_Invoice_Line; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = Sales_Invoice_Header."No.";
                }

            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}