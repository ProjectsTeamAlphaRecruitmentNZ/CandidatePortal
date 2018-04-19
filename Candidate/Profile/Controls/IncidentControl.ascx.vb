Imports StayinFront.Engine

Partial Public Class IncidentControl
    Inherits System.Web.UI.UserControl
    Public Property Assignment() As String
        Get
            Return JobBox.SelectedValue
        End Get
        Set(ByVal value As String)
            JobBox.SelectedValue = value
        End Set
    End Property
    Public Property IncKey() As String
        Get
            Return IncKeyBox.Value
        End Get
        Set(ByVal value As String)
            IncKeyBox.Value = value
        End Set
    End Property
    Public Property keyVal() As String
        Get
            Return key.Value
        End Get
        Set(ByVal value As String)
            key.Value = value
        End Set
    End Property
    Public Property NotifierType() As String
        Get
            Return notifier_type.SelectedValue
        End Get
        Set(ByVal value As String)
            notifier_type.SelectedValue = value
        End Set
    End Property
    Public Property NotifierFN() As String
        Get
            Return NotifierFirstName.Text
        End Get
        Set(ByVal value As String)
            NotifierFirstName.Text = value
        End Set
    End Property
    Public Property NotifierLN() As String
        Get
            Return NotifierLastName.Text
        End Get
        Set(ByVal value As String)
            NotifierLastName.Text = value
        End Set
    End Property
    Public Property NotifierAreaP() As String
        Get
            Return PhoneAreaBox.Text
        End Get
        Set(ByVal value As String)
            PhoneAreaBox.Text = value
        End Set
    End Property
    Public Property NotifierNumP() As String
        Get
            Return PhoneNumBox.Text
        End Get
        Set(ByVal value As String)
            PhoneNumBox.Text = value
        End Set
    End Property
    Public Property NotifierAreaM() As String
        Get
            Return MobileAreaBox.Text
        End Get
        Set(ByVal value As String)
            MobileAreaBox.Text = value
        End Set
    End Property
    Public Property NotifierNumM() As String
        Get
            Return MobileNumBox.Text
        End Get
        Set(ByVal value As String)
            MobileNumBox.Text = value
        End Set
    End Property
    Public Property NotifierEmail() As String
        Get
            Return EmailBox.Text
        End Get
        Set(ByVal value As String)
            EmailBox.Text = value
        End Set
    End Property
    Public Property NotifierAddress() As String
        Get
            Return AddressBox.Text
        End Get
        Set(ByVal value As String)
            AddressBox.Text = value
        End Set
    End Property
    Public Property NotifierCity() As String
        Get
            Return CityBox.Text
        End Get
        Set(ByVal value As String)
            CityBox.Text = value
        End Set
    End Property
    Public Property NotifierPostCode() As String
        Get
            Return PostCodeBox.Text
        End Get
        Set(ByVal value As String)
            PostCodeBox.Text = value
        End Set
    End Property
    Public Property DateOfIncidet() As String
        Get
            Return DateBox.Text
        End Get
        Set(ByVal value As String)
            DateBox.Text = value
        End Set
    End Property
    Public Property TimeOfIncident() As String
        Get
            Return IncTimeBox.Text
        End Get
        Set(ByVal value As String)
            IncTimeBox.Text = value
        End Set
    End Property
    Public Property Place() As String
        Get
            Return IncidentPlaceBox.Text
        End Get
        Set(ByVal value As String)
            IncidentPlaceBox.Text = value
        End Set
    End Property
    Public Property IncidentAddr() As String
        Get
            Return IncidentAddressBox.Text
        End Get
        Set(ByVal value As String)
            IncidentAddressBox.Text = value
        End Set
    End Property
    Public Property IncidentCity() As String
        Get
            Return IncidentCityBox.Text
        End Get
        Set(ByVal value As String)
            IncidentCityBox.Text = value
        End Set
    End Property
    Public Property IncidentPostCode() As String
        Get
            Return IncidentPostCodeBox.Text
        End Get
        Set(ByVal value As String)
            IncidentPostCodeBox.Text = value
        End Set
    End Property
    Public Property IncidentWH() As String
        Get
            Return SelectWHBox.SelectedValue
        End Get
        Set(ByVal value As String)
            SelectWHBox.SelectedValue = value
        End Set
    End Property
    Public Property IncidentPC() As String
        Get
            Return PCBOX.SelectedValue
        End Get
        Set(ByVal value As String)
            PCBOX.SelectedValue = value
        End Set
    End Property
    Public Property IncidentDesc() As String
        Get
            Return DescriptionBox.Text
        End Get
        Set(ByVal value As String)
            DescriptionBox.Text = value
        End Set
    End Property
    Public Property IncidentPeople() As String
        Get
            Return PeopleInvolvedBox.Text
        End Get
        Set(ByVal value As String)
            PeopleInvolvedBox.Text = value
        End Set
    End Property
    Public Property Weather() As String
        Get
            Return WeatherBox.Text
        End Get
        Set(ByVal value As String)
            WeatherBox.Text = value
        End Set
    End Property
    Public Property Hazard() As String
        Get
            Return HazardBox.Text
        End Get
        Set(ByVal value As String)
            HazardBox.Text = value
        End Set
    End Property

    Public Property Notified() As String
        Get
            Return NotifiedBox.SelectedValue
        End Get
        Set(ByVal value As String)
            NotifiedBox.SelectedValue = value
        End Set
    End Property
    Public Property SitePreserved() As String
        Get
            Return SitePreservedBox.Checked
        End Get
        Set(ByVal value As String)
            SitePreservedBox.Checked = value
        End Set
    End Property
    Public Property AgencyName() As String
        Get
            Return AgencyNameBox.Text
        End Get
        Set(ByVal value As String)
            AgencyNameBox.Text = value
        End Set
    End Property
    Public Property AgencyArea() As String
        Get
            Return AgencyPhoneAreaBox.Text
        End Get
        Set(ByVal value As String)
            AgencyPhoneAreaBox.Text = value
        End Set
    End Property
    Public Property AgencyNum() As String
        Get
            Return AgencyPhoneNumBox.Text
        End Get
        Set(ByVal value As String)
            AgencyPhoneNumBox.Text = value
        End Set
    End Property

    Public Property HSRWork() As String
        Get
            Return hsr_workingBox.Checked
        End Get
        Set(ByVal value As String)
            hsr_workingBox.Checked = value
        End Set
    End Property
    Public Property HSRNZQA() As String
        Get
            Return hsr_nzqaBox.Checked
        End Get
        Set(ByVal value As String)
            hsr_nzqaBox.Checked = value
        End Set
    End Property
    Public Property Declaration() As String
        Get
            Return declarationBox.Text
        End Get
        Set(ByVal value As String)
            declarationBox.Text = value
        End Set
    End Property
    Public Property DecFN() As String
        Get
            Return DecFirstNameBox.Text
        End Get
        Set(ByVal value As String)
            DecFirstNameBox.Text = value
        End Set
    End Property
    Public Property DecLN() As String
        Get
            Return DeclastNameBox.Text
        End Get
        Set(ByVal value As String)
            DeclastNameBox.Text = value
        End Set
    End Property
    Public Property DecAddr() As String
        Get
            Return DecAddrBox.Text
        End Get
        Set(ByVal value As String)
            DecAddrBox.Text = value
        End Set
    End Property
    Public Property DecCity() As String
        Get
            Return DecCityBox.Text
        End Get
        Set(ByVal value As String)
            DecCityBox.Text = value
        End Set
    End Property
    Public Property DecPostCode() As String
        Get
            Return DecPCBox.Text
        End Get
        Set(ByVal value As String)
            DecPCBox.Text = value
        End Set
    End Property
    Public Property DecEmail() As String
        Get
            Return DecEmailBox.Text
        End Get
        Set(ByVal value As String)
            DecEmailBox.Text = value
        End Set
    End Property
    Public Property DecPhone() As String
        Get
            Return DecPhoneBox.Text
        End Get
        Set(ByVal value As String)
            DecPhoneBox.Text = value
        End Set
    End Property
    Public Property DecDate() As String
        Get
            Return DecDateBox.Text
        End Get
        Set(ByVal value As String)
            DecDateBox.Text = value
        End Set
    End Property
    Public Property Designation() As String
        Get
            Return DesignationBox.Text
        End Get
        Set(ByVal value As String)
            DesignationBox.Text = value
        End Set
    End Property
    Public Property Test() As String
        Get
            Return TestBox1.Text
        End Get
        Set(ByVal value As String)
            TestBox1.Text = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        JobAssignDS.DataBind()
        IndustryBox.SelectedValue = "da438142-d8d9-4177-a834-423de53b6616"
    End Sub
    Protected Sub saveIncident_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveIncident.Click

        Dim objUserName As String = Session("Username")
        Dim key As String = IncKey

        Dim existingIncident = GetInstance(SIFConn.TheSystem.This, "HS_Incident", False, "key='" & key & "'")

        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction

        Dim incidents = objCandidate.Folders("IncidentHistories")
        If Not objCandidate Is Nothing Then
            Dim oHSInst, JobInst As IAeClassInst
            If existingIncident Is Nothing Then
                oHSInst = incidents.CreateNewInstance(SIFConn.TheSystem.This.classes("HS_Incident"))
            Else
                oHSInst = existingIncident
            End If
            JobInst = GetInstance(SIFConn.TheSystem.This, "JobAssignments", False, "key='" & Assignment & "'")

            SetValue(oHSInst, "notifier_type", NotifierType)
            SetValue(oHSInst, "notifier_Name.FirstName", NotifierFN)
            SetValue(oHSInst, "notifier_Name.LastName", NotifierLN)
            SetValue(oHSInst, "notifier_phone.AreaCode", NotifierAreaP)
            SetValue(oHSInst, "notifier_phone.Number", NotifierNumP)
            SetValue(oHSInst, "notifier_mobile.AreaCode", NotifierAreaM)
            SetValue(oHSInst, "notifier_mobile.Number", NotifierNumM)
            SetValue(oHSInst, "notifier_email.eMailAddress", NotifierEmail)
            SetValue(oHSInst, "notifier_address.Address", NotifierAddress)
            SetValue(oHSInst, "notifier_address.City", NotifierCity)
            SetValue(oHSInst, "notifier_address.PostCode", NotifierPostCode)
            'incidents SAVE
            SetValue(oHSInst, "Incident_date", DateOfIncidet)
            'SetValue(oHSInst, "Incident_time", TimeOfIncident)
            If Not Hazard Is Nothing Then
                SetValue(oHSInst, "incident_place", Place)
            End If
            SetValue(oHSInst, "incident_address.Address", IncidentAddr)
            SetValue(oHSInst, "incident_address.City", IncidentCity)
            SetValue(oHSInst, "incident_address.PostCode", IncidentPostCode)

            Dim HSFolder = oHSInst.Folders("Candidate_HSes")
            If Not HSFolder Is Nothing Then
                For Each HSVal In HSFolder
                    HSVal.Delete(objTransaction)
                Next
            End If
            Dim value_WHs = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_WHs, "HS", IncidentWH)
            Dim value_PCs = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_PCs, "HS", IncidentPC)
            SetValue(oHSInst, "incident_details", IncidentDesc)
            SetValue(oHSInst, "detail_involved", IncidentPeople)
            SetValue(oHSInst, "weather_condition", Weather)
            If Not Hazard Is Nothing Then
                SetValue(oHSInst, "hazard_involved", Hazard)
            End If
            If Not SitePreserved Is Nothing Then
                SetValue(oHSInst, "SitePreserved", SitePreserved)
            End If
            If Not Notified Is Nothing Then
                SetValue(oHSInst, "notified", Notified)
            End If
            SetValue(oHSInst, "notified_agency_name", AgencyName)
            SetValue(oHSInst, "notified_agency_phone.AreaCode", AgencyArea)
            SetValue(oHSInst, "notified_agency_phone.Number", AgencyNum)
            'PCBU Save

            SetValue(oHSInst, "hsr_working", HSRWork)
                SetValue(oHSInst, "hsr_nzqa", HSRNZQA)
                'DECLARATION SAVe

                'SetValue(oHSInst, "declaration_date", DecDate)
                'SetValue(oHSInst, "designation", Designation)
                SetJoinValue(JobInst.Key.ToString(), oHSInst, "JobAssignment")
                SetJoinValue(objCandidate.Key.ToString(), oHSInst, "Candidate")
                SetJoinValue(oHSInst.Key.ToString(), value_WHs, "CandidateIncidentHistory")
                SetJoinValue(oHSInst.Key.ToString(), value_PCs, "CandidateIncidentHistory")

                oHSInst.Save()
                value_WHs.Save()
                value_PCs.Save()
                objValidate = objTransaction.Validate
                If objValidate.Status <> 3 Then
                    objTransaction.Commit()
                    saved = True
                    Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
                Else
                    objTransaction = Nothing
                    saved = False
                End If
                objTransaction = Nothing
                objValidate = Nothing
            End If

    End Sub

End Class

