Imports StayinFront.Engine
Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        'BP 28/1/2017
        'function to authenicate user
        If Request.QueryString("OriginalURL") <> "" AndAlso Request.QueryString("OriginalURL").EndsWith(".aspx") Then
            'use _ww to redirect to the correct page
            Response.Redirect("/_ww/ww.dll?webworks/login?UID=" & Login1.UserName & "&PWD=" & Login1.Password & "&OriginalURL=" & Request.QueryString("OriginalURL"), False)
            Session("LoginId") = Login1.UserName
        Else
            Session("LoginId") = Login1.UserName
            Response.Redirect("/_ww/ww.dll?webworks/login?UID=" & Login1.UserName & "&PWD=" & Login1.Password & "&OriginalURL=" & Request.QueryString("OriginalURL") & "/default.aspx?userN=" & Login1.UserName, False)
            'Response.Redirect("/_ww/ww.dll?webworks/login?UID=" & Login1.UserName & "&PWD=" & Login1.Password & "&OriginalURL=../candidate/default.aspx?userN=" & Login1.UserName, False)
        End If
    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.Request.QueryString("timeout") = 1 Then
            lblMessage.Text = "Your session has timed out.  Please login again to continue."
            hfCountdown.Value = -1
        Else
            lblMessage.Text = ""
        End If
        If Request.QueryString("Retry") <> 0 Then
            hfCountdown.Value = 10
            lblMessage.Text = "Incorrect username or password"
        End If
    End Sub

    Private Sub Login_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'BP clear everything from memory for this session.
            Session.Contents.RemoveAll()
            Session.Abandon()
        End If
    End Sub
End Class