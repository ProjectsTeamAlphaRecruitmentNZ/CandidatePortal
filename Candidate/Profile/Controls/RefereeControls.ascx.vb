Imports StayinFront.Engine
Partial Class RefereeControls
    Inherits System.Web.UI.UserControl
    Public Property RefereeKey() As String
        Get
            Return RefereeKeyBox.Value
        End Get
        Set(ByVal value As String)
            RefereeKeyBox.Value = value
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
    Public Property FirstNameRef() As String
        Get
            Return FNEdit.Text
        End Get
        Set(ByVal value As String)
            FNEdit.Text = value
        End Set
    End Property
    Public Property LastNameRef() As String
        Get
            Return LNEdit.Text
        End Get
        Set(ByVal value As String)
            LNEdit.Text = value
        End Set
    End Property
    Public Property CompanyRef() As String
        Get
            Return CompanyEdit.Text
        End Get
        Set(ByVal value As String)
            CompanyEdit.Text = value
        End Set
    End Property
    Public Property PositionRef() As String
        Get
            Return PositionEdit.Text
        End Get
        Set(ByVal value As String)
            PositionEdit.Text = value
        End Set
    End Property
    Public Property MobileRef() As String
        Get
            Return PhoneMobiles.Text
        End Get
        Set(ByVal value As String)
            PhoneMobiles.Text = value
        End Set
    End Property
    Public Property LandRef() As String
        Get
            Return PhoneLands.Text
        End Get
        Set(ByVal value As String)
            PhoneLands.Text = value
        End Set
    End Property
    Public Property EmailRef() As String
        Get
            Return EmailEdit.Text
        End Get
        Set(ByVal value As String)
            EmailEdit.Text = value
        End Set
    End Property
    Public Property RepRelationshipRef() As String
        Get
            Return RepRel.Text
        End Get
        Set(ByVal value As String)
            RepRel.Text = value
        End Set
    End Property
    Public Property TimeRef() As String
        Get
            Return TimeToCont.Text
        End Get
        Set(ByVal value As String)
            TimeToCont.Text = value
        End Set
    End Property

    Protected Sub addReferee_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RefereeSave.Click
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim newCandReferee As IAeClassInst
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders
        Dim candidateReferees = objCandidate.Folders("Referees")

        If Not objCandidate Is Nothing Then
            If key Is Nothing Or RefereeKey = "" Then
                newCandReferee = candidateReferees.CreateNewInstance
            Else
                newCandReferee = GetInstance(SIFConn.TheSystem.This, "Referee", False, "key='" & RefereeKey & "'")
            End If
            SetValue(newCandReferee, "Name.FirstName", FirstNameRef)
            SetValue(newCandReferee, "Name.LastName", LastNameRef)
            SetValue(newCandReferee, "Emailaddress.Emailaddress", EmailRef)

            Dim phoneM As String = MobileRef
            phoneM = phoneM.Trim()
            If InStr(phoneM, " ") > 0 Then
                Dim pLS As String() = phoneM.Split(" ")
                SetValue(newCandReferee, "mobileNumber.AreaCode", pLS(0))
                SetValue(newCandReferee, "mobileNumber.Number", pLS(1))
            Else

                SetValue(newCandReferee, "mobileNumber.AreaCode", Nothing)
                SetValue(newCandReferee, "mobileNumber.Number", phoneM)
            End If
            Dim phoneAL As String = PhoneLands.Text
            phoneAL = phoneAL.Trim()
            If InStr(phoneAL, " ") > 0 Then
                Dim pLS As String() = phoneAL.Trim().Split(" ")
                SetValue(newCandReferee, "PhoneNumber.AreaCode", pLS(0))
                SetValue(newCandReferee, "PhoneNumber.Number", pLS(1))
            Else
                SetValue(newCandReferee, "PhoneNumber.AreaCode", Nothing)
                SetValue(newCandReferee, "PhoneNumber.Number", phoneAL)
            End If
            SetValue(newCandReferee, "RefereeCompany", CompanyRef)
            SetValue(newCandReferee, "RefereePosition", PositionRef)
            SetValue(newCandReferee, "RefereeRelationship", RepRelationshipRef)
            SetValue(newCandReferee, "RefereeContactTime", TimeRef)
            SetJoinValue(objCandidate.Key.ToString(), newCandReferee, "Candidate")
            newCandReferee.Save(objTransaction)
            newCandReferee = Nothing
            objCandidate.Save(objTransaction)
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
