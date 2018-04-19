Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Partial Class Online_Docs_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        If Not Page.IsPostBack Then
            'Set the logged in User
            Dim objUserName As String = Session("Username")
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            'Scan and fetch Profile Categories
            If Not objCandidate Is Nothing Then
                Dim CandidateDocs As IAeFolder = objCandidate.Folders("CandidateDocPackLibraries")
                'Display Values
                Dim strHTML1 As String = ""
                For Each CandidateDoc As IAeClassInst In CandidateDocs
                    strHTML1 &= "<a href=""Criminal conviction history - third party.aspx"">" & GetValue(CandidateDoc, "DocumentLibrary.DocumentName") & "</a><br>"
                Next
                DocumentList.Text = strHTML1
            End If
        End If
    End Sub
End Class
