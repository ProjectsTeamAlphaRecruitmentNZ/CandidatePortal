Partial Class PersonalInfo
    Inherits System.Web.UI.UserControl
    Public Property AltEmail() As String
        Get
            Return AltEmailEdit.Text
        End Get
        Set(ByVal value As String)
            AltEmailEdit.Text = value
        End Set
    End Property
    Public Property Email() As String
        Get
            Return EmailEdit.Text
        End Get
        Set(ByVal value As String)
            EmailEdit.Text = value
        End Set
    End Property
    Public Property Phone() As String
        Get
            Return PhoneEdit.Text
        End Get
        Set(ByVal value As String)
            PhoneEdit.Text = value
        End Set
    End Property
    Public Property Mobile() As String
        Get
            Return MobileEdit.Text
        End Get
        Set(ByVal value As String)
            MobileEdit.Text = value
        End Set
    End Property
    Public Property Address() As String
        Get
            Return candidateAddressEdit.Text
        End Get
        Set(ByVal value As String)
            candidateAddressEdit.Text = value
        End Set
    End Property
    Public Property Suburb() As String
        Get
            Return SuburbEdit.Text
        End Get
        Set(ByVal value As String)
            SuburbEdit.Text = value
        End Set
    End Property
    Public Property City() As String
        Get
            Return candidateCityEdit.Text
        End Get
        Set(ByVal value As String)
            candidateCityEdit.Text = value
        End Set
    End Property
    Public Property Country() As String
        Get
            Return CountryEdit.Text
        End Get
        Set(ByVal value As String)
            CountryEdit.Text = value
        End Set
    End Property
    Public Property PostCode() As String
        Get
            Return candidatePostCodeEdit.Text
        End Get
        Set(ByVal value As String)
            candidatePostCodeEdit.Text = value
        End Set
    End Property
    Public Property DOB() As String
        Get
            Return DOBEdit.Value
        End Get
        Set(ByVal value As String)
            DOBEdit.Value = value
        End Set
    End Property
    Public Property POB() As String
        Get
            Return POBEdit.Text
        End Get
        Set(ByVal value As String)
            POBEdit.Text = value
        End Set
    End Property
    Public Property Linkedin() As String
        Get
            Return LinkedInEdit.Text
        End Get
        Set(ByVal value As String)
            LinkedInEdit.Text = value
        End Set
    End Property
    Public Property Availability() As String
        Get
            Return AvailabilityEdit.Text
        End Get
        Set(ByVal value As String)
            AvailabilityEdit.Text = value
        End Set
    End Property
    Public Property Skype() As String
        Get
            Return SkypeEdit.Text
        End Get
        Set(ByVal value As String)
            SkypeEdit.Text = value
        End Set
    End Property
    Public Property Gender() As String
        Get
            Return GenderEdit.SelectedValue
        End Get
        Set(ByVal value As String)
            GenderEdit.SelectedValue = value
        End Set
    End Property
    Public Property DriversLicense() As Boolean
        Get
            Return DriverLicenseEdit.Checked
        End Get
        Set(ByVal value As Boolean)
            DriverLicenseEdit.Checked = value
        End Set
    End Property
    Public Property OwnTransport() As Boolean
        Get
            Return OwnTransportEdit.Checked
        End Get
        Set(ByVal value As Boolean)
            OwnTransportEdit.Checked = value
        End Set
    End Property
    Public Property Smoker() As Boolean
        Get
            Return SmokerEdit.Checked
        End Get
        Set(ByVal value As Boolean)
            SmokerEdit.Checked = value
        End Set
    End Property
    Public Property EmContName() As String
        Get
            Return CandidatesEmergencyContactNameEdit.Text
        End Get
        Set(ByVal value As String)
            CandidatesEmergencyContactNameEdit.Text = value
        End Set
    End Property
    Public Property EmContLastName() As String
        Get
            Return CandidatesEmergencyContactLastNameEdit.Text
        End Get
        Set(ByVal value As String)
            CandidatesEmergencyContactLastNameEdit.Text = value
        End Set
    End Property

    Public Property EmPhone() As String
        Get
            Return CandidatesEmergencyContactPhoneEdit.Text
        End Get
        Set(ByVal value As String)
            CandidatesEmergencyContactPhoneEdit.Text = value
        End Set
    End Property
    Public Property EmEmail() As String
        Get
            Return EmailEmEdit.Text
        End Get
        Set(ByVal value As String)
            EmailEmEdit.Text = value
        End Set
    End Property
    Public Property EmContRelationship() As String
        Get
            Return CandidatesEmergencyContactRelationshipEdit.Text
        End Get
        Set(ByVal value As String)
            CandidatesEmergencyContactRelationshipEdit.Text = value
        End Set
    End Property
    'Public Property WorkPhoneArea() As String
    '    Get
    '        Return WorkPhoneEditArea.Text
    '    End Get
    '    Set(ByVal value As String)
    '        WorkPhoneEditArea.Text = value
    '    End Set
    'End Property
    'Public Property WorkPhoneNum() As String
    '    Get
    '        Return WorkPhoneEditNum.Text
    '    End Get
    '    Set(ByVal value As String)
    '        WorkPhoneEditNum.Text = value
    '    End Set
    'End Property
    'Public Property WorkEmail() As String
    '    Get
    '        Return WorkEmailEdit.Text
    '    End Get
    '    Set(ByVal value As String)
    '        WorkEmailEdit.Text = value
    '    End Set
    'End Property
End Class
