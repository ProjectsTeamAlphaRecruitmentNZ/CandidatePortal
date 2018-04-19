<%@ WebService Language="VB" Class="UploaderBackEnd" %>
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Public Class UploaderBackEnd
    <WebMethod()> Public Function SaveFile() As String

        Return "Uploader BaCK End"


    End Function
End Class

