Imports StayinFront.Engine

Partial Public Class IncidentControl
    Inherits System.Web.UI.UserControl
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
            Return NotifiedBox.Text
        End Get
        Set(ByVal value As String)
            NotifiedBox.Text = value
        End Set
    End Property
    Public Property SitePreserved() As String
        Get
            Return SitePreservedBox.Text
        End Get
        Set(ByVal value As String)
            SitePreservedBox.Text = value
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

    Public Property PCBUName() As String
        Get
            Return pcbu_nameBox.Text
        End Get
        Set(ByVal value As String)
            pcbu_nameBox.Text = value
        End Set
    End Property
    Public Property PCBUNzbn() As String
        Get
            Return pcbu_nzbnBox.Text
        End Get
        Set(ByVal value As String)
            pcbu_nzbnBox.Text = value
        End Set
    End Property
    Public Property PCBUIndustry() As String
        Get
            Return IndustryBox.SelectedValue
        End Get
        Set(ByVal value As String)
            IndustryBox.SelectedValue = value
        End Set
    End Property
    Public Property PCBUIndustryOther() As String
        Get
            Return OtherBox.Text
        End Get
        Set(ByVal value As String)
            OtherBox.Text = value
        End Set
    End Property
    Public Property PCBUAddress() As String
        Get
            Return PCBUAddressBox.Text
        End Get
        Set(ByVal value As String)
            PCBUAddressBox.Text = value
        End Set
    End Property
    Public Property PCBUCity() As String
        Get
            Return PCBUCityBox.Text
        End Get
        Set(ByVal value As String)
            PCBUCityBox.Text = value
        End Set
    End Property
    Public Property PCBUPostCode() As String
        Get
            Return PCBUPostCodeBox.Text
        End Get
        Set(ByVal value As String)
            PCBUPostCodeBox.Text = value
        End Set
    End Property
    Public Property PCBUMobA() As String
        Get
            Return PCBUMA.Text
        End Get
        Set(ByVal value As String)
            PCBUMA.Text = value
        End Set
    End Property
    Public Property PCBUMobN() As String
        Get
            Return PCBUMN.Text
        End Get
        Set(ByVal value As String)
            PCBUMN.Text = value
        End Set
    End Property
    Public Property PCBULandA() As String
        Get
            Return PCBUPA.Text
        End Get
        Set(ByVal value As String)
            PCBUPA.Text = value
        End Set
    End Property
    Public Property PCBULandN() As String
        Get
            Return PCBUPN.Text
        End Get
        Set(ByVal value As String)
            PCBUPN.Text = value
        End Set
    End Property
    Public Property ContactPerson() As String
        Get
            Return ContactPersonBox.Text
        End Get
        Set(ByVal value As String)
            ContactPersonBox.Text = value
        End Set
    End Property
    Public Property PCBUEmail() As String
        Get
            Return PCBUEmailBox.Text
        End Get
        Set(ByVal value As String)
            PCBUEmailBox.Text = value
        End Set
    End Property

    Public Property HSRWork() As String
        Get
            Return hsr_workingBox.Text
        End Get
        Set(ByVal value As String)
            hsr_workingBox.Text = value
        End Set
    End Property
    Public Property HSRNZQA() As String
        Get
            Return hsr_nzqaBox.Text
        End Get
        Set(ByVal value As String)
            hsr_nzqaBox.Text = value
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
    Public Property DecPArea() As String
        Get
            Return DecPhoneAreaBox.Text
        End Get
        Set(ByVal value As String)
            DecPhoneAreaBox.Text = value
        End Set
    End Property
    Public Property DecPNum() As String
        Get
            Return DecPhoneNumBox.Text
        End Get
        Set(ByVal value As String)
            DecPhoneNumBox.Text = value
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

    Protected Sub saveIncident_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveIncident.Click
        Stop
        Dim objUserName As String = Session("Username")
        Dim key As String = IncKey

        Dim existingIncident = GetInstance(SIFConn.TheSystem.This, "HS_Incident", False, "key='" & key & "'")

        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction

        Dim incidents = objCandidate.Folders("IncidentHistories")
        If Not objCandidate Is Nothing Then
            Dim oHSInst As IAeClassInst
            If existingIncident Is Nothing Then
                oHSInst = incidents.CreateNewInstance(SIFConn.TheSystem.This.classes("HS_Incident"))
            Else
                oHSInst = existingIncident
            End If
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
            'SetValue(oHSInst, "incident_place", Place)
            SetValue(oHSInst, "incident_address.Address", IncidentAddr)
            SetValue(oHSInst, "incident_address.City", IncidentCity)
            SetValue(oHSInst, "incident_address.PostCode", IncidentPostCode)
            Dim value_WHs = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_WHs, "HS", IncidentWH)
            Dim value_PCs = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_PCs, "HS", IncidentPC)
            SetValue(oHSInst, "incident_details", IncidentDesc)
            'SetValue(oHSInst, "", IncidentPeople)
            SetValue(oHSInst, "weather_condition", Weather)
            'SetValue(oHSInst, "hazard_involved", Hazard)
            SetValue(oHSInst, "SitePreserved", SitePreserved)
            'SetValue(oHSInst, "notified", Notified)
            SetValue(oHSInst, "notified_agency_name", AgencyName)
            SetValue(oHSInst, "notified_agency_phone.AreaCode", AgencyArea)
            SetValue(oHSInst, "notified_agency_phone.Number", AgencyNum)
            'PCBU Save
            SetValue(oHSInst, "pcbu_name", PCBUName)
            SetValue(oHSInst, "pcbu_nzbn", PCBUNzbn)
            Dim value_Inds = oHSInst.Folders("Candidate_HSes").CreateNewInstance
            SetValue(value_Inds, "HS", PCBUIndustry)
            SetValue(oHSInst, "pcbu_industry_other", PCBUIndustryOther)
            SetValue(oHSInst, "pcbu_address.Address", PCBUAddress)
            SetValue(oHSInst, "pcbu_address.City", PCBUCity)
            SetValue(oHSInst, "pcbu_address.PostCode", PCBUPostCode)
            SetValue(oHSInst, "pcbu_Contact_Person", ContactPerson)
            SetValue(oHSInst, "pcbu_email.eMailAddress", PCBUEmail)
            SetValue(oHSInst, "pcbu_mobile.AreaCode", PCBUMobA)
            SetValue(oHSInst, "pcbu_mobile.Number", PCBUMobN)
            SetValue(oHSInst, "pcbu_phone.AreaCode", PCBULandA)
            SetValue(oHSInst, "pcbu_phone.Number", PCBULandN)
            SetValue(oHSInst, "hsr_working", HSRWork)
            SetValue(oHSInst, "hsr_nzqa", HSRNZQA)
            'DECLARATION SAVe
            'SetValue(oHSInst, "declaration", Declaration)
            'SetValue(oHSInst, "Name.FirstName", DecFN)
            'SetValue(oHSInst, "Name.LastName", DecLN)
            'SetValue(oHSInst, "Address.Address", DecAddr)
            'SetValue(oHSInst, "Address.City", DecCity)
            'SetValue(oHSInst, "Address.PostCode", DecPostCode)
            'SetValue(oHSInst, "eMailAddress.eMailAddress", DecEmail)
            'SetValue(oHSInst, "hsr_nzqa", DecPArea)
            'SetValue(oHSInst, "hsr_nzqa", DecPNum)
            'SetValue(oHSInst, "declaration_date", DecDate)
            'SetValue(oHSInst, "designation", Designation)

            SetJoinValue(objCandidate.Key.ToString(), oHSInst, "Candidate")
            SetJoinValue(oHSInst.Key.ToString(), value_WHs, "CandidateIncidentHistory")
            SetJoinValue(oHSInst.Key.ToString(), value_PCs, "CandidateIncidentHistory")
            SetJoinValue(oHSInst.Key.ToString(), value_Inds, "CandidateIncidentHistory")

            oHSInst.Save()
            value_WHs.Save()
            value_PCs.Save()
            value_Inds.Save()
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

