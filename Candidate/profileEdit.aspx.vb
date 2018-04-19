Public Partial Class profileEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Stop
        Dim ferns() As String = {"Psilotopsida", _
                                 "Equisetopsida", _
                                 "Marattiopsida", _
                                 "Polypodiopsida"}
        ' Loop over each element with For Each.
        For Each fern As String In ferns
            System.Diagnostics.Debug.WriteLine(fern)
        Next
    End Sub

End Class