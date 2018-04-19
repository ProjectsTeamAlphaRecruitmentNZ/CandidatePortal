Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports StayinFront.Web.UI

Namespace HPSNZServices
    <System.Web.Script.Services.ScriptService()> _
    <WebService(Namespace:="http://tempuri.org/")> _
    <WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
    <Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
    Public Class StayinFrontSearches
        Inherits System.Web.Services.WebService

        <WebMethod()> _
        Public Function GetIndivsGrid(ByVal strFirstName As String, ByVal strLastName As String, ByVal blnSupportTeam As Boolean, ByVal strCurrentIndivKey As String) As String
            'AUTHOR:        IH 23/7/2012
            'DESCRIPTION:   Get HTML of individual keys
            '               Called by client script showing search popups which allow searching by first and last names
            'PARAMERS:      strFirstName - the start of the first name
            '               strLastName - the start of the surname
            '               blnSupportTeam - whether the user is requesting Support Team members only or all indivs
            '               strCurrentIndivKey - the individual whose support team we are looking at.
            '                       it could be that there are more individuals on a call but this will be the one that we have reatched the call from
            'RETURNS:       HTML of a table of individuals with a checkbox next to the name

            Dim objSys As StayinFront.Engine.IAeSystem
            Dim objIndivs As IAeFolderScan
            Dim objIndiv As IAeClassInst
            Dim strHTML As String
            Dim blnHasResults As Boolean = False
            Dim strFilter As String
            'objSys = Connection.SystemForRequest(Context.Request).This
            strHTML = "<table id='tblIndivsGrid'>"
            strFilter = "Name.FirstName @ '" & strFirstName.Replace("'", "''") & "' And Name.LastName @ '" & strLastName.Replace("'", "''") & "'"
            If blnSupportTeam Then
                strFilter &= " And RelatedIndivSecurity1.Exists(IsActive And Individual2.Key='" & strCurrentIndivKey & "')"
            End If
            objIndivs = objSys.Folders("Individuals").Scan(strFilter, "", 50)
            For Each objIndiv In objIndivs
                blnHasResults = True
                strHTML &= "<tr>"
                strHTML &= "<td><input type='checkbox' name='chkSelect'>" & "</></td>"
                strHTML &= "<td><input id='txtIndivKey' type='text' value='" & objIndiv.Key.ToString() & "' style='display:none;'></input></td>"
                strHTML &= "<td>" & objIndiv.Prompt & "</td></tr>"
            Next

            strHTML &= "</table>"
            If Not blnHasResults Then
                strHTML = "<table><tr><td>No records found</td></tr></table"
            End If
            Return strHTML
        End Function

    End Class

End Namespace