Public Partial Class Profile
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") Is Nothing Then
            Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
        End If
    End Sub

End Class












