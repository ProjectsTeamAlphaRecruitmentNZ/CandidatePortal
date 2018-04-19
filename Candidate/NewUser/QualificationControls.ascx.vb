Partial Public Class QualificationControls
    Inherits System.Web.UI.UserControl
    Public Property Degree() As String
        Get
            Return DegreeField.Text
        End Get
        Set(ByVal value As String)
            DegreeField.Text = value
        End Set
    End Property
    Public Property Description() As String
        Get
            Return DescriptionField.Text
        End Get
        Set(ByVal value As String)
            DescriptionField.Text = value
        End Set
    End Property
    Public Property Field() As String
        Get
            Return FieldField.Text
        End Get
        Set(ByVal value As String)
            FieldField.Text = value
        End Set
    End Property
    Public Property School() As String
        Get
            Return SchoolField.Text
        End Get
        Set(ByVal value As String)
            SchoolField.Text = value
        End Set
    End Property
    Public Property FromYear() As String
        Get
            Return FromYearField.SelectedValue
        End Get
        Set(ByVal value As String)
            FromYearField.SelectedValue = value
        End Set
    End Property
    Public Property ToYear() As String
        Get
            Return ToYearField.SelectedValue
        End Get
        Set(ByVal value As String)
            ToYearField.SelectedValue = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Dim i As Integer
        ToYearField.Items.Add(" ")
        FromYearField.Items.Add(" ")
        For i = DateTime.Now.Year - 50 To DateTime.Now.Year + 10
            FromYearField.Items.Add(i.ToString())
            ToYearField.Items.Add(i.ToString())
        Next i
    End Sub
End Class
