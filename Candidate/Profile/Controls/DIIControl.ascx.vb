Imports StayinFront.Engine
Partial Class DIIControl
    Inherits System.Web.UI.UserControl
    Public Property Assignment() As String
        Get
            Return JobBox1.SelectedValue
        End Get
        Set(ByVal value As String)
            JobBox1.SelectedValue = value
        End Set
    End Property
    Public Property IncKey() As String
        Get
            Return IncKeyBox1.Value
        End Get
        Set(ByVal value As String)
            IncKeyBox1.Value = value
        End Set
    End Property
    Public Property keyVal() As String
        Get
            Return key1.Value
        End Get
        Set(ByVal value As String)
            key1.Value = value
        End Set
    End Property
    Public Property NotifierType() As String
        Get
            Return notifier_type1.SelectedValue
        End Get
        Set(ByVal value As String)
            notifier_type1.SelectedValue = value
        End Set
    End Property
    Public Property NotifierFN() As String
        Get
            Return NotifierFirstName1.Text
        End Get
        Set(ByVal value As String)
            NotifierFirstName1.Text = value
        End Set
    End Property
    Public Property NotifierLN() As String
        Get
            Return NotifierLastName1.Text
        End Get
        Set(ByVal value As String)
            NotifierLastName1.Text = value
        End Set
    End Property
    Public Property NotifierAreaP() As String
        Get
            Return PhoneAreaBox1.Text
        End Get
        Set(ByVal value As String)
            PhoneAreaBox1.Text = value
        End Set
    End Property
    Public Property NotifierNumP() As String
        Get
            Return PhoneNumBox1.Text
        End Get
        Set(ByVal value As String)
            PhoneNumBox1.Text = value
        End Set
    End Property
    Public Property NotifierAreaM() As String
        Get
            Return MobileAreaBox1.Text
        End Get
        Set(ByVal value As String)
            MobileAreaBox1.Text = value
        End Set
    End Property
    Public Property NotifierNumM() As String
        Get
            Return MobileNumBox1.Text
        End Get
        Set(ByVal value As String)
            MobileNumBox1.Text = value
        End Set
    End Property
    Public Property NotifierEmail() As String
        Get
            Return EmailBox1.Text
        End Get
        Set(ByVal value As String)
            EmailBox1.Text = value
        End Set
    End Property
    Public Property NotifierAddress() As String
        Get
            Return AddressBox1.Text
        End Get
        Set(ByVal value As String)
            AddressBox1.Text = value
        End Set
    End Property
    Public Property NotifierCity() As String
        Get
            Return CityBox1.Text
        End Get
        Set(ByVal value As String)
            CityBox1.Text = value
        End Set
    End Property
    Public Property NotifierPostCode() As String
        Get
            Return PostCodeBox1.Text
        End Get
        Set(ByVal value As String)
            PostCodeBox1.Text = value
        End Set
    End Property
    Public Property DateOfIncidet() As String
        Get
            Return DateBox1.Text
        End Get
        Set(ByVal value As String)
            DateBox1.Text = value
        End Set
    End Property
    Public Property TimeOfIncident() As String
        Get
            Return IncTimeBox1.Text
        End Get
        Set(ByVal value As String)
            IncTimeBox1.Text = value
        End Set
    End Property

    Public Property IncidentAddr() As String
        Get
            Return IncidentAddressBox1.Text
        End Get
        Set(ByVal value As String)
            IncidentAddressBox1.Text = value
        End Set
    End Property
    Public Property IncidentCity() As String
        Get
            Return IncidentCityBox1.Text
        End Get
        Set(ByVal value As String)
            IncidentCityBox1.Text = value
        End Set
    End Property
    Public Property IncidentPostCode() As String
        Get
            Return IncidentPostCodeBox1.Text
        End Get
        Set(ByVal value As String)
            IncidentPostCodeBox1.Text = value
        End Set
    End Property
    Public Property IncidentDesc() As String
        Get
            Return DescriptionBox1.Text
        End Get
        Set(ByVal value As String)
            DescriptionBox1.Text = value
        End Set
    End Property
    Public Property Notified() As String
        Get
            Return NotifiedBox1.SelectedValue
        End Get
        Set(ByVal value As String)
            NotifiedBox1.SelectedValue = value
        End Set
    End Property
    Public Property SitePreserved() As String
        Get
            Return SitePreservedBox1.Checked
        End Get
        Set(ByVal value As String)
            SitePreservedBox1.Checked = value
        End Set
    End Property
    Public Property AgencyName() As String
        Get
            Return AgencyNameBox1.Text
        End Get
        Set(ByVal value As String)
            AgencyNameBox1.Text = value
        End Set
    End Property
    Public Property AgencyArea() As String
        Get
            Return AgencyPhoneAreaBox1.Text
        End Get
        Set(ByVal value As String)
            AgencyPhoneAreaBox1.Text = value
        End Set
    End Property
    Public Property AgencyNum() As String
        Get
            Return AgencyPhoneNumBox1.Text
        End Get
        Set(ByVal value As String)
            AgencyPhoneNumBox1.Text = value
        End Set
    End Property
    Public Property Nature() As String
        Get
            Return NatureBox.SelectedValue
        End Get
        Set(ByVal value As String)
            NatureBox.SelectedValue = value
        End Set
    End Property
    Public Property InjName() As String
        Get
            Return InjNameBox.Text
        End Get
        Set(ByVal value As String)
            InjNameBox.Text = value
        End Set
    End Property
    Public Property InjLastName() As String
        Get
            Return InjLastNameBox.Text
        End Get
        Set(ByVal value As String)
            InjLastNameBox.Text = value
        End Set
    End Property
    Public Property InjDOB() As String
        Get
            Return birthday.Value
        End Get
        Set(value As String)
            birthday.Value = value
        End Set
    End Property
    Public Property InjGender() As String
        Get
            Return GenderBox.Text
        End Get
        Set(ByVal value As String)
            GenderBox.Text = value
        End Set
    End Property
    Public Property InjAddr() As String
        Get
            Return InjAddrBox.Text
        End Get
        Set(ByVal value As String)
            InjAddrBox.Text = value
        End Set
    End Property
    Public Property InjCity() As String
        Get
            Return InjCityBox.Text
        End Get
        Set(ByVal value As String)
            InjCityBox.Text = value
        End Set
    End Property
    Public Property InjPostCode() As String
        Get
            Return InjPostCodeBox.Text
        End Get
        Set(ByVal value As String)
            InjPostCodeBox.Text = value
        End Set
    End Property
    Public Property InjPhoneA() As String
        Get
            Return InjPhoneBoxA.Text
        End Get
        Set(ByVal value As String)
            InjPhoneBoxA.Text = value
        End Set
    End Property
    Public Property InjPhoneN() As String
        Get
            Return InjPhoneBoxN.Text
        End Get
        Set(ByVal value As String)
            InjPhoneBoxN.Text = value
        End Set
    End Property
    Public Property InjPersonType() As String
        Get
            Return InjPersonTypeBox.SelectedValue
        End Get
        Set(ByVal value As String)
            InjPersonTypeBox.SelectedValue = value
        End Set
    End Property
    Public Property BodyParts() As String
        Get
            Return BodyPartsBox.SelectedValue
        End Get
        Set(ByVal value As String)
            BodyPartsBox.SelectedValue = value
        End Set
    End Property
    Public Property Treatment() As String
        Get
            Return TreatmentBox.SelectedValue
        End Get
        Set(ByVal value As String)
            TreatmentBox.SelectedValue = value
        End Set
    End Property
    Public Property InjHours() As String
        Get
            Return InjHoursBox.Text
        End Get
        Set(ByVal value As String)
            InjHoursBox.Text = value
        End Set
    End Property
    Public Property InjDesc() As String
        Get
            Return InjuryDescBox1.Text
        End Get
        Set(ByVal value As String)
            InjuryDescBox1.Text = value
        End Set
    End Property
    Public Property HSRWork() As String
        Get
            Return hsr_workingBox1.Checked
        End Get
        Set(ByVal value As String)
            hsr_workingBox1.Checked = value
        End Set
    End Property
    Public Property HSRNZQA() As String
        Get
            Return hsr_nzqaBox1.Checked
        End Get
        Set(ByVal value As String)
            hsr_nzqaBox1.Checked = value
        End Set
    End Property
    Public Property Declaration() As String
        Get
            Return declarationBox1.Text
        End Get
        Set(ByVal value As String)
            declarationBox1.Text = value
        End Set
    End Property
    Public Property DecFN() As String
        Get
            Return DecFirstNameBox1.Text
        End Get
        Set(ByVal value As String)
            DecFirstNameBox1.Text = value
        End Set
    End Property
    Public Property DecLN() As String
        Get
            Return DeclastNameBox1.Text
        End Get
        Set(ByVal value As String)
            DeclastNameBox1.Text = value
        End Set
    End Property
    Public Property DecAddr() As String
        Get
            Return DecAddrBox1.Text
        End Get
        Set(ByVal value As String)
            DecAddrBox1.Text = value
        End Set
    End Property
    Public Property DecCity() As String
        Get
            Return DecCityBox1.Text
        End Get
        Set(ByVal value As String)
            DecCityBox1.Text = value
        End Set
    End Property
    Public Property DecPostCode() As String
        Get
            Return DecPCBox1.Text
        End Get
        Set(ByVal value As String)
            DecPCBox1.Text = value
        End Set
    End Property
    Public Property DecEmail() As String
        Get
            Return DecEmailBox1.Text
        End Get
        Set(ByVal value As String)
            DecEmailBox1.Text = value
        End Set
    End Property
    Public Property DecPhone() As String
        Get
            Return DecPhoneBox1.Text
        End Get
        Set(ByVal value As String)
            DecPhoneBox1.Text = value
        End Set
    End Property
    Public Property DecDate() As String
        Get
            Return DecDateBox1.Text
        End Get
        Set(ByVal value As String)
            DecDateBox1.Text = value
        End Set
    End Property
    Public Property Designation() As String
        Get
            Return DesignationBox1.Text
        End Get
        Set(ByVal value As String)
            DesignationBox1.Text = value
        End Set
    End Property
    Public Property Test() As String
        Get
            Return TestBox.Text
        End Get
        Set(ByVal value As String)
            TestBox.Text = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        JobAssignDS1.DataBind()
        IndustryBox1.SelectedValue = "da438142-d8d9-4177-a834-423de53b6616"
    End Sub
    Protected Sub saveDII_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveDII.Click

        Dim objUserName As String = Session("Username")
        Dim key As String = IncKey

        Dim existingIncident = GetInstance(SIFConn.TheSystem.This, "HS_Event", False, "key='" & key & "'")
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction


        If Not objCandidate Is Nothing Then
            Dim oHSInst, JobInst As IAeClassInst
            Dim HSKey, HSRes As String
            Dim incidents = objCandidate.Folders("IncidentHistories")
            If existingIncident Is Nothing Then
                oHSInst = incidents.CreateNewInstance(SIFConn.TheSystem.This.classes("HS_Event"))
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
            SetValue(oHSInst, "incident_address.Address", IncidentAddr)
            SetValue(oHSInst, "incident_address.City", IncidentCity)
            SetValue(oHSInst, "incident_address.PostCode", IncidentPostCode)
            SetValue(oHSInst, "incident_details", IncidentDesc)
            If Not SitePreserved Is Nothing Then
                SetValue(oHSInst, "SitePreserved", SitePreserved)
            End If
            If Not Notified Is Nothing Then
                SetValue(oHSInst, "notified", Notified)
            End If
            SetValue(oHSInst, "notified_agency_name", AgencyName)
            SetValue(oHSInst, "notified_agency_phone.AreaCode", AgencyArea)
            SetValue(oHSInst, "notified_agency_phone.Number", AgencyNum)

            Dim HSFolder = oHSInst.Folders("Candidate_HSes")
            If Not HSFolder Is Nothing Then
                For Each HSVal In HSFolder
                    HSVal.Delete(objTransaction)
                Next
            End If

            Dim value_Natures = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_Natures, "HS", Nature)

            Dim value_BodyParts = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_BodyParts, "HS", BodyParts)
            Dim value_TA = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_TA, "HS", Treatment)
            'INJURY SAVE
            SetValue(oHSInst, "Inj_name", InjName)
            SetValue(oHSInst, "Inj_surname", InjLastName)
            'Dim dob() As String = InjDOB.Split("/")
            'SetValue(oHSInst, "inj_DOB.DateDay", dob(0))
            'SetValue(oHSInst, "inj_DOB.DateMonth", dob(1))
            'SetValue(oHSInst, "inj_DOB.DateYear", dob(2))
            SetValue(oHSInst, "inj_gender", InjGender)
            SetValue(oHSInst, "inj_address.Address", InjAddr)
            SetValue(oHSInst, "inj_address.City", InjCity)
            SetValue(oHSInst, "inj_address.PostCode", InjPostCode)
            SetValue(oHSInst, "inj_affected_type", InjPersonType)
            SetValue(oHSInst, "inj_phone.AreaCode", InjPhoneA)
            SetValue(oHSInst, "inj_phone.Number", InjPhoneN)
            SetValue(oHSInst, "inj_hours", InjHours)
            SetValue(oHSInst, "inj_description", InjDesc)
            'PCBU Save
            SetValue(oHSInst, "hsr_working", HSRWork)
            SetValue(oHSInst, "hsr_nzqa", HSRNZQA)
            ''DECLARATION SAVe
            SetValue(oHSInst, "declaration", Declaration)

            'SetValue(oHSInst, "declaration_date", Incident.DecDate)
            'SetValue(oHSInst, "designation", Incident.Designation)
            SetJoinValue(JobInst.Key.ToString(), oHSInst, "JobAssignment")
            SetJoinValue(objCandidate.Key.ToString(), oHSInst, "Candidate")
            SetJoinValue(oHSInst.Key.ToString(), value_Natures, "CandidateIncidentHistory")
            SetJoinValue(oHSInst.Key.ToString(), value_BodyParts, "CandidateIncidentHistory")
            SetJoinValue(oHSInst.Key.ToString(), value_TA, "CandidateIncidentHistory")

            value_TA.Save()
            value_BodyParts.Save()
            value_Natures.Save()
            oHSInst.Save()
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
