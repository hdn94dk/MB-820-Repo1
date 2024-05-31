codeunit 50006 "Web Request Example"
{
    procedure RequestJsonPlaceHolder()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ResponseText: Text;
        JArray: JsonArray;
        JToken: JsonToken;
    begin
        Client.Get('https://jsonplaceholder.typicode.com/users', ResponseMessage);
        if not ResponseMessage.IsSuccessStatusCode then
            Error('could not reach api');

        ResponseMessage.Content().ReadAs(ResponseText);

        JArray.ReadFrom(ResponseText);
        foreach JToken in JArray do;

    end;
}