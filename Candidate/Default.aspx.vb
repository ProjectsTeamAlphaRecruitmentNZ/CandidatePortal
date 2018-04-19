Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Set the logged in User
        Dim objUserName As String = Request.QueryString("userN")
        Session("Username") = Request.QueryString("userN")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master, Portal).SIFSystem, "Candidate", False, "Username='" + objUserName & "'")
        IsNewCandidate.Value = GetValue(objCandidate, "IsNewUser")
        IsDocPackSent.Value = GetValue(objCandidate, "IsDocPackSent")
        Session("IsNewCandidate") = IsNewCandidate.Value
        Session("IsDocPackSent") = IsDocPackSent.Value
        If Not Page.IsPostBack Then
            If Not objCandidate Is Nothing Then
                'Check if User is new or not
                If Session("IsNewCandidate") <> "" And Session("IsDocPackSent") <> "" Then
                    If Session("IsNewCandidate") = "True" And Session("IsDocPackSent") = "False" Then
                        Response.Redirect("~/NewUser/NewUser-ProfileInfo-1.aspx")
                    ElseIf Session("IsNewCandidate") = "True" And Session("IsDocPackSent") = "True" Then
                        Response.Redirect("~/NewUser/NewUser-ProfileInfo-1.aspx")
                    ElseIf Session("IsNewCandidate") = "False" And Session("IsDocPackSent") = "True" Then
                        Response.Redirect("~/Online_Docs/Criminal conviction history - third party.aspx")
                    Else
                        'Response.Redirect("~/Profile/Profile-Details.aspx?&userN=" & Request.QueryString("userN"))
                        Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidate/profile/default.htm")
                    End If
                Else
                    Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
                End If
            Else
                Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
            End If
        End If

        'If Session("IsNew") <> 1 Then
        'Response.Redirect("~/New/NewUser-ProfileInfo-1.aspx?userN=" & Request.QueryString("userN"))
        'FName.Text = GetValue(objCandidate, "Name.Firstname")
        'LName.Text = GetValue(objCandidate, "Name.Lastname")
        'email.Text = GetValue(objCandidate, "emailAddress.emailAddress")
        'Moj.Text = GetValue(objCandidate, "MoJReportReceived")
        'userKey.Value = Session("LoginUser")
        'userN.Value = LoginCandidate
        'Else
        'Response.Redirect("~/Profile/Profile.html?&userN=" & Request.QueryString("userN"))
        'End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        saved = False
        Dim LoginCandidate1 As String
        LoginCandidate1 = Request.QueryString("userN")
        Dim objCandidate1 As IAeClassInst = GetInstance(CType(Master, Portal).SIFSystem, "Candidate", False, "Username='" + LoginCandidate1 & "'")
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master, Portal).SIFSystem.BeginTransaction
        If Not objCandidate1 Is Nothing Then
            SetValue(objCandidate1, "Name.Firstname", FName.Text)
            SetValue(objCandidate1, "MoJReportReceived", Moj.Text)
            objCandidate1.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
        End If
    End Sub

End Class