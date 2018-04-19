Imports StayinFront.Engine
Partial Class ResetPassword
    Inherits System.Web.UI.Page
    Public ReadOnly Property SIFSystem() As StayinFront.Engine.IAeSystem
        Get
            Return SIFConnection.TheSystem.This
        End Get
    End Property
    Private Sub ResetPassword_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim objCandidate As IAeClassInst = Nothing
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = SIFSystem.BeginTransaction
        objCandidate = GetInstance(SIFSystem, "Candidate", False, "Key='" + Request.QueryString("ukey") & "'")
        If Not objCandidate Is Nothing Then
            SetValue(objCandidate, "Password", rePass.text)
            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("reset-password-submit.aspx")
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        Else
            Response.Redirect("http://www.alphaonline.co.nz/jobsonline/Candidate/")
        End If
    End Sub
End Class