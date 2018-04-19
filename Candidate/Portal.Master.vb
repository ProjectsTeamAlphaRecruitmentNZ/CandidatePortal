Imports StayinFront.Engine
Partial Public Class Portal
    Inherits System.Web.UI.MasterPage
    Private objCandidate As IAeClassInst

    Public ReadOnly Property SIFSystem() As StayinFront.Engine.IAeSystem
        Get
            Return SIFConnection.TheSystem.This
        End Get
    End Property

    ReadOnly Property CurrentUser() As IAeClassInst
        Get
            Dim objClient As IAeClient = Nothing
            Dim objInst As IAeClassInst = Nothing
            Dim objSystem As IAeSystem = Nothing
            Try
                objSystem = SIFConnection.TheSystem.This
                objClient = objSystem.User
                objInst = objClient.Object
                Return objInst
            Finally
                objClient = Nothing
                objInst = Nothing
            End Try
        End Get
    End Property

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'Stop
        If IO.Path.GetFileName(Request.PhysicalPath) <> "login.aspx" Then
            'refresh the page to default just before the page times out
            Response.AppendHeader("Refresh", Convert.ToString(((Session.Timeout * 60) - 5)) + "; Url=http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=1&Lockout=0")
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'Stop
        'If IO.Path.GetFileName(Request.PhysicalPath).ToLower = "login.aspx" Then
        'mnMain.Visible = False
        'divCand.Visible = False
        'Else
        'If (Not Page.Request.IsAuthenticated) And Request.QueryString("userN") Is Nothing OrElse Request.QueryString("userN") = "" Then
        'Response.Redirect("http://localhost/candidateportal_1.0/portal_1.3/")
        'End If
        'End If
        
    End Sub
End Class
