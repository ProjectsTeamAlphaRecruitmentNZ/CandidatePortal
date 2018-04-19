Partial Public Class CompanyControls
    Inherits System.Web.UI.UserControl
    Public Property Contact() As String
        Get
            Return name_of_contact.Text
        End Get
        Set(ByVal value As String)
            name_of_contact.Text = value
        End Set
    End Property
    Public Property Position() As String
        Get
            Return contacts_position.Text
        End Get
        Set(ByVal value As String)
            contacts_position.Text = value
        End Set
    End Property
    Public Property Company() As String
        Get
            Return company_name.Text
        End Get
        Set(ByVal value As String)
            company_name.Text = value
        End Set
    End Property
    Public Property StartDate() As String
        Get
            Return start_date.Text
        End Get
        Set(ByVal value As String)
            start_date.Text = value
        End Set
    End Property
    Public Property RoleApplied() As String
        Get
            Return role_applied.Text
        End Get
        Set(ByVal value As String)
            role_applied.Text = value
        End Set
    End Property
End Class
