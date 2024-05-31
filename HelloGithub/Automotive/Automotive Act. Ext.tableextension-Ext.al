tableextension 50000 "Automotive Act. Ext" extends "Activities Cue"
{
    fields
    {
        field(50000; "Total Automotives"; Integer)
        {
            FieldClass = flowfield;
            Calcformula = count(Automotive);
        }
    }

}