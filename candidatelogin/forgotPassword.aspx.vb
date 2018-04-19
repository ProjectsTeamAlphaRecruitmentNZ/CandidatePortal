Imports StayinFront.Engine
Imports System.Net
Imports System.Net.Mail
Imports System.Drawing
Imports System.Configuration
Imports System.IO

Public Class ForgotPassword
    Inherits System.Web.UI.Page
    Public ReadOnly Property SIFSystem() As StayinFront.Engine.IAeSystem
        Get
            Return SIFConnection.TheSystem.This
        End Get
    End Property

    Protected Sub SendEmail(sender As Object, e As EventArgs)
        Dim objCandidate As IAeClassInst = Nothing
        If (txtUserName.Text <> "") Then
            objCandidate = GetInstance(SIFSystem, "Candidate", False, "Username='" + UCase(txtUserName.Text) & "' Or eMailAddress.eMailAddress='" + UCase(txtUserName.Text) & "'")
            If Not objCandidate Is Nothing Then
                Dim strEmail As String = GetValue(objCandidate, "Emailaddress.eMailAddress")
                Dim mm As MailMessage = New MailMessage
                mm.From = New MailAddress(ConfigurationManager.AppSettings("UserName"))
                mm.Subject = "Password Recovery"
                mm.Body = "<html><body style='font-family:Tahoma; font-size:14px; color:#333;'> Hi " & GetValue(objCandidate, "Name.FirstName") & " " & GetValue(objCandidate, "Name.LastName") & "," _
                            & "<br/><br/> We received a request to reset your JobsOnline Portal password. If you want to reset your password, click the link below:" _
                            & "<br/><br/><a href='http://www.alphaonline.co.nz/jobsonline/candidatelogin/resetpassword.aspx?ukey=" & objCandidate.Key & "' target='_blank'>http://www.alphaonline.co.nz/jobsonline/candidatelogin/resetpassword.aspx?ukey=" & objCandidate.Key & "</a></b><br/>" _
                            & "<br/>This link takes you to a page where you can choose a new password.<br/><br/>Please ignore this message if you don't want to change your password. Your password will not be reset." _
                            & "<br/><br/><a href='http://www.alphaonline.co.nz/jobsonline/Candidate'>JobsOnline Portal</a></body></html>"
                mm.IsBodyHtml = True
                mm.To.Add(strEmail)
                Dim smtp As SmtpClient = New SmtpClient
                smtp.Host = ConfigurationManager.AppSettings("Host")
                smtp.Port = Integer.Parse(ConfigurationManager.AppSettings("Port"))
                smtp.Send(mm)
                lblMessage.ForeColor = Color.Green
                lblMessage.Text = "Password reset link has been sent to " & strEmail
            Else
                lblMessage.ForeColor = Color.Red
                lblMessage.Text = "We couldn't find an account associated with."
            End If
        Else
            lblMessage.Text = "Please enter your email or username"
        End If
    End Sub

    Private Sub ForgotPassword_Init(sender As Object, e As EventArgs) Handles Me.Init

    End Sub
End Class