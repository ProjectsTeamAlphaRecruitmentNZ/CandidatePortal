
Partial Class DeclarationControl
    Inherits System.Web.UI.UserControl
    Public Property Organisation() As String
        Get
            Return OrganisationBox.Text
        End Get
        Set(ByVal value As String)
            OrganisationBox.Text = value
        End Set
    End Property

End Class
